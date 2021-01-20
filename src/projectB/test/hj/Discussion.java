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
        articleList = disBoardDAO.getBestArticles(1,listSize, sort);
        articleCList = disBoardDAO.getBestCArticles(1, listSize, sort);
        
        Map<String, Integer> todayDate = new HashMap<>();
        todayDate = disBoardDAO.getToday();
        int month = todayDate.get("month");
        int year = todayDate.get("year");
        int week = todayDate.get("week");
        int day = todayDate.get("day");
        String today = month+"월 "+week+"주차";
        String sunday = null;
        String nextSunday = null;
        Map<String, Integer> lastweek = new HashMap<>();
        ArrayList<String> weekList = new ArrayList<String>();
        ArrayList<String> sundayList = new ArrayList<String>();
        ArrayList<String> nextSundayList = new ArrayList<String>();

        ArrayList<List<DiscussionDTO>> weekArticleList = new ArrayList<List<DiscussionDTO>>();
        ArrayList<List<DiscussionDTO>> weekArticleCList = new ArrayList<List<DiscussionDTO>>();
        
        for(int i = 0; i < 5;i++) {
        	if(week == 1) {
        		lastweek = disBoardDAO.getPreWeek(lastweek);
                sunday = disBoardDAO.getSunday(lastweek);
                week = lastweek.get("week");
                month = lastweek.get("month");  
                year = lastweek.get("year");
        	}else {
        		week = week-1;
        		day = day-7;
        		lastweek.put("week", week);
    			lastweek.put("year", year);
    			lastweek.put("month",month);
    			lastweek.put("day", day);
        		sunday = disBoardDAO.getSunday(lastweek);
        	}
        	weekList.add(i,month+"월 "+week+"주차");
        	sundayList.add(sunday);
        }
        nextSunday = disBoardDAO.getSunday(todayDate);
		nextSundayList.add(nextSunday);
        for(int a = 0; a < 4 ;a++) {
    		nextSunday = sundayList.get(a);
    		nextSundayList.add(nextSunday);
    	}
        System.out.println(sundayList);
        System.out.println(nextSundayList);
        for(int i = 0; i < sundayList.size(); i++) {
        	List<DiscussionDTO> list = disBoardDAO.getBestArticles(1, listSize, sort, sundayList.get(i), nextSundayList.get(i));
        	List<DiscussionDTO> list2 = disBoardDAO.getBestCArticles(1, listSize, sort, sundayList.get(i), nextSundayList.get(i));
        	weekArticleList.add(i, list);
        	weekArticleCList.add(i, list2);
        }
        System.out.println(weekArticleList);
        
        model.addAttribute("listSize", new Integer(listSize));
        model.addAttribute("articleList", articleList);
        model.addAttribute("articleCList", articleCList);
        model.addAttribute("sort", new Integer(sort));
        model.addAttribute("number", new Integer(number));
        model.addAttribute("today", today);
        model.addAttribute("sunday", sunday);
        model.addAttribute("weekList", weekList);
        model.addAttribute("weekArticleList",weekArticleList);
        model.addAttribute("weekArticleCList",weekArticleCList);
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
    public String content(int discussionNum,
    		@RequestParam(defaultValue="1" , required = true)int pageNum,
    		@RequestParam(defaultValue="1" , required = true)int commentPageNum,
    		HttpSession session, Model model) throws Exception {
		
		String id = LoginUtils.getLoginID(session);
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
		
		//페이징 계산
		int commentTotalCount = disBoardCommService.getCommentCount(discussionNum);
		int startRow = (commentPageNum - 1) * COMMENT_LENGTH + 1;
		int endRow = (commentPageNum) * COMMENT_LENGTH;
		
		//댓글 얻기
		List<DisBoardCommDTO> comments = disBoardCommService.getComments(discussionNum, startRow, endRow);
		int pageTotalCount = commentTotalCount / COMMENT_LENGTH;
		
		//다음 페이지에 게시물이 하나라도 있다면 페이지 처리
		if(commentTotalCount % COMMENT_LENGTH > 0)
			pageTotalCount++;
		// 페이징 처리 시작 값
		int startPageIndex = (((commentPageNum - 1) / COMMENT_PAGE_LENGTH) * COMMENT_LENGTH) + 1;
		// 페이징 처리 종료 값
		int endPageIndex = startPageIndex + COMMENT_PAGE_LENGTH - 1;
		// 페이지 마지막 값이 총 페이지를 넘어가지 않도록 처리
		if(endPageIndex > pageTotalCount)
			endPageIndex = pageTotalCount;
		
		// 페이징용 변수
		model.addAttribute("pageTotalCount", pageTotalCount);
		model.addAttribute("startPageIndex", startPageIndex);
		model.addAttribute("endPageIndex", endPageIndex);
		model.addAttribute("commentCount", comments.size());
		
		model.addAttribute("pageNum", pageNum);
        model.addAttribute("commentPageNum", commentPageNum);
        
		model.addAttribute("voteResult", voteResult);
		model.addAttribute("memId", id);
        model.addAttribute("article", article);
        model.addAttribute("tags", tags);
        model.addAttribute("comments", comments);
        
		return "discussion/content";
	}
	
    @RequestMapping("commentInsert.aa")
    public String commentInsert(DisBoardCommDTO dto) {
    	String text = dto.getContent().replaceAll("[\r\n]","<br>");
    	text = text.replace(" ","&nbsp");
    	dto.setContent(text);    	
    	
        try {
        	disBoardCommService.insertComment(dto);
        } catch (Exception e) {
        	e.printStackTrace();
		}
        return "redirect:content.aa?discussionNum=" + dto.getDiscussionNum();
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
