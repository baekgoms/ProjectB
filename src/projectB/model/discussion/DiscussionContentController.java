package projectB.model.discussion;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import projectB.model.discussionCommService.DisBoardCommService;
import projectB.model.discussionService.DiscussionService;
import projectB.model.login.LoginUtils;
import projectB.model.petition.DiscussionDTO;

@Controller
@RequestMapping("discussion")
public class DiscussionContentController {
	@Autowired
	private DiscussionService disBoardDAO = null;
	
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
			HttpSession session, Model model) {
		System.out.println("discussionComment run");
		
		try {
			String id = LoginUtils.getLoginID(session);
			List<CommentVoteDTO> cmvs = Collections.emptyList();
			int cmmVoteCount = 0;
			int voteResult = 0;
			if(id != null)
			{
				cmmVoteCount = disBoardCommService.getCmmVoteCount(discussionNum, id);
				if(cmmVoteCount > 0)
					cmvs = disBoardCommService.getCmmVotes(discussionNum, id);
				
				voteResult = disBoardDAO.CheckVote(discussionNum, id);
			}
			
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
	        model.addAttribute("cmvs", cmvs);
	      
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		model.addAttribute("pageNum", pageNum);
        model.addAttribute("commentPageNum", commentPageNum);
		
		return "discussion/content";
	}
	
	@RequestMapping("commentInsert.aa")
    public String commentInsert(DisBoardCommDTO dto, int pageNum, int commentPageNum) {
		String text = dto.getContent().replaceAll("[\r\n]","<br>");
    	text = text.replace(" ","&nbsp");
    	dto.setContent(text);
    	
		int parentNum = dto.getNum();    		
		int discussionNum = dto.getDiscussionNum();
    	//여기서 계산!
    	try {
        	if(parentNum != 0) {
        		int nextDepth = disBoardCommService.getNextDepth(discussionNum, parentNum);
        		dto.setDepth(nextDepth);
        		dto.setGrouping(parentNum);
        		dto.setImgState(-1);
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
    	String redirectURL = "redirect:content.aa?discussionNum="+discussionNum
    			+ "&pageNum=" + pageNum
    			+ "&commentPageNum=" + commentPageNum;
        return redirectURL;
    }
	
	@RequestMapping("commentVote.aa")
	public String commentVote(CommentVoteDTO dto, int pageNum, int commentPageNum) {
		//할 일
		//테이블 좋아요 누른 여부 체크
		//좋아요 누른 상태 - 레코드  삭제 / 좋아요 - 1
		//누른적없음 - 레코드 추가 / 좋아요 + 1
		System.out.println("commentVote run / " + dto);
		//String id = "qw";//LoginUtils.getLoginID(session);
		int discussionNum = dto.getDiscussionNum();
		int commentNum = dto.getCommentNum();
		String writer = dto.getWriter();
		int commentVote = disBoardCommService.checkCommentVote(discussionNum, commentNum, writer);
		int commentState = dto.getState();
		//추천/반대 누른적 없음 - 추가경로
		System.out.println("commentVote - " + commentVote);
		if(commentVote == 0) {
			//테이블에 사용자 추가 - 인설트
			disBoardCommService.insertCommentVote(dto);
			
			//현재 댓글에서 어떤걸 눌렀는지에 따라 추천 or 반대 + 1 - 댓굴 업데이트			
			try {				
			
				if(commentState == 0) {
					//추천 업데이트
					disBoardCommService.addUp(commentNum);
				} else {
					//반대 업데이트
					disBoardCommService.addDown(commentNum);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//추천/반대 누른적있음 - 취소경로
		else {
			//테이블 사용자 정보 삭제 -딜리트
			disBoardCommService.deleteCmVote(dto);
			//현재 댓글에서 어떤걸 눌렀는지에 따라 추천 or 반대 - 1 - 댓굴 업데이트
			try {
				if(commentState == 0) {
					//추천 업데이트
					disBoardCommService.subUp(commentNum);
				} else {
					//반대 업데이트
					disBoardCommService.subDown(commentNum);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}		
		
		String redirectURL = "redirect:content.aa?discussionNum="+dto.getDiscussionNum()
    			+ "&pageNum=" + pageNum
    			+ "&commentPageNum=" + commentPageNum;
		return redirectURL;
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
