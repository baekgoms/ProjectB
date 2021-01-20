package projectB.test.hj;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import projectB.model.petition.DiscussionDTO;

@Service("disBoardDAO")
public class DisBoardDAO implements DisBoardService{
	
	@Autowired
	private SqlSessionTemplate bDao = null;
	
	@Override
	public void insertArticle(DiscussionDTO article) throws Exception {
	}

	@Override
	public int getArticleCount() throws Exception {
		int a = bDao.selectOne("disBoard.getArticleCount");
		return a;
	}
	
	@Override
	public int getArticleCount(String keyword) throws Exception {
		int a = bDao.selectOne("disBoard.getArticleCount", keyword);
		return a;
	}

	@Override
	public List<DiscussionDTO> getArticles(int start, int end) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start",start);
		map.put("end",end);
		List<DiscussionDTO> articleList = bDao.selectList("disBoard.getArticles", map);
		return articleList;
	}

	@Override
	public List<DiscussionDTO> getArticles(int start, int end, String keyword) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start",start);
		map.put("end",end);
		map.put("keyword",keyword);
		List<DiscussionDTO> articleList = bDao.selectList("disBoard.getArticles", map);
		return articleList;
	}

	@Override
	public DiscussionDTO getArticle(int num) throws Exception {
		return bDao.selectOne("disBoard.getArticle", num);
	}

	@Override
	public int updateArticle(DiscussionDTO article) throws Exception {
		return 0;
	}

	@Override
	public int deleteArticle(int num) throws Exception {
		return 0;
	}

	@Override
	public void report(int num) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void openStateOpen(int num) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void openStateCheck(int num) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void openStateClose(int num) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<DiscussionDTO> getBestArticles(int start, int end, int sort) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start",start);
		map.put("end",end);
		map.put("sort",sort);
		List<DiscussionDTO> articleList = bDao.selectList("disBoard.getBestArticles", map);
		return articleList;
	}

	@Override
	public List<DiscussionDTO> getBestCArticles(int start, int end, int sort) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start",start);
		map.put("end",end);
		map.put("sort",sort);
		List<DiscussionDTO> articleCList = bDao.selectList("disBoard.getBestCArticles", map);
		return articleCList;
	}
	
	@Override
	public void insertVote(Map<String, Object> voteMap) {
		Map<String, Object> map = new HashMap<>(voteMap);
		//map.put("discussionNum",discussionNum);
		//map.put("writer",writer);
		
		bDao.insert("disBoardVote.insertVote", map);
	}
	
	@Override
	public int CheckVote(int discussionNum, String writer) {
		if(writer == null || discussionNum <= 0)
			return -1;
		Map<String, Object> map = new HashMap<>();
		map.put("discussionNum",discussionNum);
		map.put("writer",writer);
		
		return bDao.selectOne("disBoardVote.votecheck", map);
	}

	@Override
	public void updateVoteByUp(int discussionNum) {
		bDao.update("disBoard.agreement", discussionNum);
	}
	
	@Override
	public void updateVoteByDown(int discussionNum) {
		bDao.update("disBoard.opposition", discussionNum);
	}

	@Override
	public Map<String, Integer> getToday(){
		Calendar c = Calendar.getInstance();
		int month = c.get(Calendar.MONTH)+1;
		int year = c.get(Calendar.YEAR);
		c.setFirstDayOfWeek(Calendar.SUNDAY);
 		c.setMinimalDaysInFirstWeek(4);
 		int week = c.get(Calendar.WEEK_OF_MONTH);
 		int day = c.get(Calendar.DAY_OF_MONTH);
 		Map<String, Integer> todayDate = new HashMap<>();
 		todayDate.put("week", week);
 		todayDate.put("year", year);
 		todayDate.put("month", month);
 		todayDate.put("day", day);
		return todayDate;
	}
	// 저번주는 몇년, 몇월, 몇째주인지
	@Override
	public Map<String, Integer> getPreWeek(Map<String, Integer> lastweek) {
		Calendar c = Calendar.getInstance();
		c.setFirstDayOfWeek(Calendar.SUNDAY);
 		c.setMinimalDaysInFirstWeek(7);
 		int year = lastweek.get("year");
 		int month = lastweek.get("month");
 		int week = lastweek.get("week");
 		
		if(month == 1) {
			int years = year-1;
			month = 11;
			c.set(Calendar.MONTH,month);
			int day = c.getActualMaximum(Calendar.DAY_OF_MONTH);
			c.set(years, month, day);
			week = c.get(Calendar.WEEK_OF_MONTH);
			lastweek.put("week", week);
			lastweek.put("year", years);
			lastweek.put("month",12);
			lastweek.put("day", day);
		}else {
			month = month-2;
			c.set(year, month, 1);
			int day = c.getActualMaximum(Calendar.DAY_OF_MONTH);
			c.set(year, month, day);
			week = c.get(Calendar.WEEK_OF_MONTH);
			lastweek.put("week", week);
			lastweek.put("year", year);
			lastweek.put("month",month+1);
			lastweek.put("day", day);
		}
		
		return lastweek;
	}
	// 그 날의 일요일 구하기
	@Override
	public String getSunday(Map<String, Integer> lastweek) throws Exception {
	String pattern = "yyyy-MM-dd";
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
	int year = lastweek.get("year");
	int month = lastweek.get("month")-1;
	int week = lastweek.get("week");
	Calendar c = Calendar.getInstance();
	c.set(Calendar.YEAR,year);
	c.set(Calendar.MONTH,month);
	c.set(Calendar.WEEK_OF_MONTH,week);
	c.set(Calendar.DAY_OF_WEEK,Calendar.SUNDAY);
	c.add(c.DATE,7);
		return simpleDateFormat.format(c.getTime());
	}
	
	@Override
	public List<DiscussionDTO> getBestArticles(int start, int end, int sort, String date1, String date2) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start",start);
		map.put("end",end);
		map.put("sort",sort);
		map.put("date1", date1);
		map.put("date2", date2);
		List<DiscussionDTO> articleList = bDao.selectList("disBoard.getWeekBestArticles", map);
		return articleList;
	}
	
	@Override
	public List<DiscussionDTO> getBestCArticles(int start, int end, int sort, String date1, String date2) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start",start);
		map.put("end",end);
		map.put("sort",sort);
		map.put("date1", date1);
		map.put("date2", date2);
		List<DiscussionDTO> articleCList = bDao.selectList("disBoard.getBestCArticles", map);
		return articleCList;
	}

}
