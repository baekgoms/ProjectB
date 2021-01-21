package projectB.model.discussion;

import java.util.*;

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
public class DiscussionController {
	@Autowired
	private DiscussionService disBoardDAO = null;
	
	@Autowired
	private DisBoardCommService disBoardCommService = null;
	
	//토론 상세보기 댓글 표현 개수
	private static final int COMMENT_LENGTH = 10;
	
	//토론 댓글창에 표시할 최대 페이지 개수
	private static final int COMMENT_PAGE_LENGTH = 10;
	
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
        String sunday = null;
        String nextSunday = null;
        String firstDay = null;
        String lastFirstDay = null;
        Map<String, Integer> lastweek = new HashMap<>();
        ArrayList<String> weekList = new ArrayList<String>();
        ArrayList<String> monthList = new ArrayList<String>();
        ArrayList<String> sundayList = new ArrayList<String>();
        ArrayList<String> nextSundayList = new ArrayList<String>();
        ArrayList<String> firstDayList = new ArrayList<String>();
        ArrayList<String> nextFirstDayList = new ArrayList<String>();

        ArrayList<List<DiscussionDTO>> weekArticleList = new ArrayList<List<DiscussionDTO>>();
        ArrayList<List<DiscussionDTO>> weekArticleCList = new ArrayList<List<DiscussionDTO>>();
        
        if(sort == 1) {
        // 오늘을 기준으로 한 주씩 전의 일요일 날짜 구하기 (총 5주전까지)
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
        // 오늘 기준. 이번주 일요일부터 4주전 일요일까지
        nextSunday = disBoardDAO.getSunday(todayDate);
		nextSundayList.add(nextSunday);
        for(int a = 0; a < 4 ;a++) {
    		nextSunday = sundayList.get(a);
    		nextSundayList.add(nextSunday);
    	}
        // 5주(일요일~토요일)동안 작성된 토론글을 추천순/참여순으로 리스트 받아오기
        for(int i = 0; i < sundayList.size(); i++) {
        	List<DiscussionDTO> list = disBoardDAO.getBestArticles(1, listSize, sort, sundayList.get(i), nextSundayList.get(i));
        	List<DiscussionDTO> list2 = disBoardDAO.getBestCArticles(1, listSize, sort, sundayList.get(i), nextSundayList.get(i));
        	weekArticleList.add(i, list);
        	weekArticleCList.add(i, list2);
        }
        }else {
        // 이번달 기준으로 전달~5달전까지 구하기
        todayDate = disBoardDAO.getToday();
        month = todayDate.get("month");
        year = todayDate.get("year");
        
        for(int i = 0; i < 5;i++) {
        	if(month == 1) {
        		year = year-1;
        		month = 12;
        		firstDay = disBoardDAO.getFirstDay(month, year);
        	}else {
        		month = month-1;
        		firstDay = disBoardDAO.getFirstDay(month, year);
        	}
        	monthList.add(i,year+"년"+month+"월");
        	firstDayList.add(firstDay);
        }
        todayDate = disBoardDAO.getToday();
        month = todayDate.get("month");
        year = todayDate.get("year");
        
        lastFirstDay = disBoardDAO.getFirstDay(month, year);
        nextFirstDayList.add(lastFirstDay);
        for(int a = 0; a < 4 ;a++) {
        	lastFirstDay = firstDayList.get(a);
        	nextFirstDayList.add(lastFirstDay);
    	}
        
     // 5개월동안 작성된 토론글을 추천순/참여순으로 리스트 받아오기
        for(int i = 0; i < firstDayList.size(); i++) {
        	List<DiscussionDTO> list = disBoardDAO.getBestArticles(1, listSize, sort, firstDayList.get(i), nextFirstDayList.get(i));
        	List<DiscussionDTO> list2 = disBoardDAO.getBestCArticles(1, listSize, sort, firstDayList.get(i), nextFirstDayList.get(i));
        	weekArticleList.add(i, list);
        	weekArticleCList.add(i, list2);
        }
        }
        model.addAttribute("listSize", new Integer(listSize));
        model.addAttribute("articleList", articleList);
        model.addAttribute("articleCList", articleCList);
        model.addAttribute("sort", new Integer(sort));
        model.addAttribute("number", new Integer(number));
        model.addAttribute("weekList", weekList);
        model.addAttribute("weekArticleList",weekArticleList);
        model.addAttribute("weekArticleCList",weekArticleCList);
        model.addAttribute("monthList",monthList);
        
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
}
