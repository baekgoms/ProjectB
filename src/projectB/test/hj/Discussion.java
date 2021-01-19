package projectB.test.hj;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import projectB.model.discussion.DisBoardCommDTO;
import projectB.model.discussionCommService.DisBoardCommService;
import projectB.model.login.LoginUtils;
import projectB.model.petition.DiscussionDTO;

@Controller
@RequestMapping("discussion")
public class Discussion {
	
	@Autowired
	private DisBoardService disBoardDAO = null;
	
	@Autowired
	private DisBoardCommService disBoardCommService = null;
	
	@RequestMapping("main.aa")
	public String main(
			@RequestParam(defaultValue="1" , required = true)int pageNum, Model model) throws Exception {
		int pageSize = 12;
        int currentPage = pageNum;
        int startRow = (currentPage - 1) * pageSize + 1;
        int endRow = currentPage * pageSize;
        int count = 0;
        
        List<DiscussionDTO> articleList = null;
        count = disBoardDAO.getArticleCount();
        if (count > 0) {
            articleList = disBoardDAO.getArticles(startRow, endRow);
        } else {
            articleList = Collections.emptyList();
        }
        model.addAttribute("currentPage", new Integer(currentPage));
        model.addAttribute("startRow", new Integer(startRow));
        model.addAttribute("endRow", new Integer(endRow));
        model.addAttribute("count", new Integer(count));
        model.addAttribute("pageSize", new Integer(pageSize));
        model.addAttribute("articleList", articleList);
        model.addAttribute("pageNum", new Integer(pageNum));
        
		return "discussion/main";
	}
	@RequestMapping("mainBest.aa")
	public String mainBest(@RequestParam(defaultValue="1" , required = true)int sort, Model model) throws Exception {
		int listSize = 5;
		int number = 1;
        
        List<DiscussionDTO> articleList = null;
        List<DiscussionDTO> articleCList = null;
        if(sort == 1) {
	        articleList = disBoardDAO.getBestArticles(1,listSize, sort);
	        articleCList = disBoardDAO.getBestCArticles(1, listSize, sort);
        } else {
        	articleList = disBoardDAO.getBestArticles(1,listSize, sort);
	        articleCList = disBoardDAO.getBestCArticles(1, listSize, sort);
        }
        
        model.addAttribute("listSize", new Integer(listSize));
        model.addAttribute("articleList", articleList);
        model.addAttribute("articleCList", articleCList);
        model.addAttribute("sort", new Integer(sort));
        model.addAttribute("number", new Integer(number));
        
		return "discussion/mainBest";
	}
	@RequestMapping("mainSearch.aa")
	public String mainSearch(
			@RequestParam(defaultValue="1" , required = true)int pageNum, Model model, String keyword) throws Exception {
		int pageSize = 12;
        int currentPage = pageNum;
        int startRow = (currentPage - 1) * pageSize + 1;
        int endRow = currentPage * pageSize;
        int count = 0;
        
        List<DiscussionDTO> articleList = null;
        count = disBoardDAO.getArticleCount(keyword);
        if (count > 0) {
            articleList = disBoardDAO.getArticles(startRow, endRow, keyword);
        } else {
            articleList = Collections.emptyList();
        }
        
        model.addAttribute("currentPage", new Integer(currentPage));
        model.addAttribute("startRow", new Integer(startRow));
        model.addAttribute("endRow", new Integer(endRow));
        model.addAttribute("count", new Integer(count));
        model.addAttribute("pageSize", new Integer(pageSize));
        model.addAttribute("articleList", articleList);
        model.addAttribute("pageNum", new Integer(pageNum));
        model.addAttribute("keyword", keyword);
        
		return "discussion/main";
	}
	
	@RequestMapping("writeForm.aa")
    public String writeForm(Model model, DiscussionDTO dto, int pageNum){
		model.addAttribute("dto", dto);
        model.addAttribute("pageNum", new Integer(pageNum));
		return "discussion/writeForm";
	}
	
	@RequestMapping("writePro.aa")
    public String writePro(DiscussionDTO dto, int pageNum, Model model) throws Exception{
		disBoardDAO.insertArticle(dto);
        model.addAttribute("pageNum", new Integer(pageNum));
		return "discussion/writePro";
	}
	
	@RequestMapping("updatePro.aa")
    public String updatePro(){
		return "discussion/updatePro";
	}

	@RequestMapping("updateForm.aa")
    public String updateForm(int num, Model model) throws Exception{
		DiscussionDTO article = disBoardDAO.getArticle(num);
		model.addAttribute("article", article);
		return "discussion/updateForm";
	}
	
	@RequestMapping("deletePro.aa")
    public String deletePro(int num, int pageNum, Model model) throws Exception{
		disBoardDAO.deleteArticle(num);
        model.addAttribute("pageNum", new Integer(pageNum));
		return "discussion/deletePro";
	}
	
	@RequestMapping("content.aa")
    public String content(@RequestParam(defaultValue="356" , required = true)int discussionNum, 
    		@RequestParam(defaultValue="1" , required = true)int pageNum,
    		HttpSession session, Model model) throws Exception {
		System.out.println("content run/" + discussionNum);
		
		DiscussionDTO article = disBoardDAO.getArticle(discussionNum);
		if (article == null) {
			return "redriect:dadasd.aa"; // 게시물이 없다는 오류 페이지로 보여주기!
		}
		
		List<String> tags = new ArrayList<>( Arrays.asList(article.getTag().split(",")) );
		List<DisBoardCommDTO> comments = disBoardCommService.getCommentListByDiscussionNum(discussionNum);
//		System.out.println(comments);

		
		//System.out.println("id//" + LoginUtils.getLoginID(session));
		String id = LoginUtils.getLoginID(session);		
		int voteResult = disBoardDAO.CheckVote(discussionNum, id);
//		System.out.println("checkVote - " + checkVote);
		model.addAttribute("voteResult", voteResult);
		model.addAttribute("memId", id);
        model.addAttribute("article", article);
        model.addAttribute("tags", tags);
        model.addAttribute("comments", comments);
        
		return "discussion/content";
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

	@RequestMapping("commentWritePro.aa")
    public String writePro(DisBoardCommDTO dto, Model model) throws Exception{
		disBoardCommService.insertComment(dto);
		return "discussion/commentWritePro";
	}
}
