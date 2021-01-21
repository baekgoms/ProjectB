package projectB.model.discussion;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import projectB.model.discussionCommService.DisBoardCommService;
import projectB.model.petition.DiscussionDTO;
import projectB.test.hj.DisBoardService;

@Controller
@RequestMapping("discussion")
public class DiscussionContentController {
	@Autowired
	private DisBoardService disBoardDAO = null;
	
	@Autowired
	private DisBoardCommService disBoardCommService = null;
	
	//토론 상세보기 댓글 표현 개수
	private static final int COMMENT_LENGTH = 10;

	// 토론 댓글창에 표시할 최대 페이지 개수
	private static final int COMMENT_PAGE_LENGTH = 10;
	
	@RequestMapping("content.aa")
	public String commentMain(int discussionNum,
			@RequestParam(defaultValue="1" , required = true)int pageNum,
			@RequestParam(defaultValue="1" , required = true)int commentPageNum,
			Model model) {
		System.out.println("discussionComment run");
		String id = "qw";//LoginUtils.getLoginID(session);
		//int voteResult = disBoardDAO.CheckVote(discussionNum, id);
		
		try {
			int voteResult = disBoardDAO.CheckVote(discussionNum, id);
			DiscussionDTO article = disBoardDAO.getArticle(discussionNum);
			
			if (article == null) {
				return "redriect:dadasd.aa"; // 게시물이 없다는 오류 페이지로 보여주기!
			}
			
			//태그 생성
			List<String> tags = Collections.emptyList();
			if(article.getTag() != null) {
				tags = new ArrayList<>( Arrays.asList(article.getTag().split(",")) );
			}
			
			// 페이징 계산
			int commentTotalCount = disBoardCommService.getCommentCount(discussionNum);
			int startRow = (commentPageNum - 1) * COMMENT_LENGTH + 1;
			int endRow = (commentPageNum) * COMMENT_LENGTH;

			// 댓글 얻기
			List<DisBoardCommDTO> comments = disBoardCommService.getComments(discussionNum, startRow, endRow);
			int pageTotalCount = commentTotalCount / COMMENT_LENGTH;

			// 다음 페이지에 게시물이 하나라도 있다면 페이지 처리
			if (commentTotalCount % COMMENT_LENGTH > 0)
				pageTotalCount++;
			// 페이징 처리 시작 값
			int startPageIndex = (((commentPageNum - 1) / COMMENT_PAGE_LENGTH) * COMMENT_LENGTH) + 1;
			// 페이징 처리 종료 값
			int endPageIndex = startPageIndex + COMMENT_PAGE_LENGTH - 1;
			// 페이지 마지막 값이 총 페이지를 넘어가지 않도록 처리
			if (endPageIndex > pageTotalCount)
				endPageIndex = pageTotalCount;
			
			// 페이징용 변수
			model.addAttribute("pageTotalCount", pageTotalCount);
			model.addAttribute("startPageIndex", startPageIndex);
			model.addAttribute("endPageIndex", endPageIndex);
			model.addAttribute("commentCount", comments.size());
			
			model.addAttribute("voteResult", voteResult);
			model.addAttribute("memId", id);
			model.addAttribute("discussionNum", discussionNum);
	        model.addAttribute("article", article);
	        model.addAttribute("tags", tags);
	        model.addAttribute("comments", comments);
	        System.out.println("comments - " + comments.size());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		model.addAttribute("pageNum", pageNum);
        model.addAttribute("commentPageNum", commentPageNum);
		
		return "discussion/content";
	}
	
	@RequestMapping("commentInsert.aa")
    public String commentInsert(DisBoardCommDTO dto) {
		System.out.println("commentInsert run" + dto.getDiscussionNum());
    	String text = dto.getContent().replaceAll("[\r\n]","<br>");
    	text = text.replace(" ","&nbsp");
    	dto.setContent(text);
    	
		int parentNum = dto.getNum();    		
		int discussionNum = dto.getDiscussionNum();
    	//여기서 계산!
    	try {
        	if(parentNum != 0) {
        		int nextDepth = disBoardCommService.getNextDepth(discussionNum, parentNum);
        		System.out.println(nextDepth + "/nextDepth");
        		dto.setDepth(nextDepth);
        		dto.setGrouping(parentNum);
        	}
        	
        	disBoardCommService.insertComment(dto);
        	System.out.println(parentNum + "//");
        	if(parentNum == 0) {
        		int maxNumber = disBoardCommService.getMaxNumber(discussionNum);
        		disBoardCommService.updateGrouping(maxNumber);
        	}
        } catch (Exception e) {
        	e.printStackTrace();
		}
        return "redirect:content.aa?discussionNum="+discussionNum;
    }
	
	@RequestMapping("vote_y.aa")
	@ResponseBody
	public String clickVoteY(@RequestParam Map<String, Object> voteMap) {
		System.out.println("vote run" + voteMap);
		String result = "-1";
		int discussionNum = Integer.valueOf((String)voteMap.get("discussionNum"));
		try {
			//투표자 추가
			disBoardDAO.insertVote(voteMap);	
			//현재 게시물 찬성표 업데이트.
			disBoardDAO.updateVoteByUp(discussionNum);
			
			result = "1";
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping("vote_n.aa")
	@ResponseBody
	public String clickVoteN(@RequestParam Map<String, Object> voteMap) {
		System.out.println("vote run" + voteMap);
		String result = "-1";
		int discussionNum = Integer.valueOf((String)voteMap.get("discussionNum"));
		try {
			//투표자 추가
			disBoardDAO.insertVote(voteMap);	
			//현재 게시물 반대표 업데이트.
			disBoardDAO.updateVoteByDown(discussionNum);
			
			result = "1";
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
