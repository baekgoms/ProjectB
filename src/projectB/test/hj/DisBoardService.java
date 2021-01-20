package projectB.test.hj;

import java.util.List;
import java.util.Map;

import projectB.model.petition.DiscussionDTO;

public interface DisBoardService {

	public void insertArticle(DiscussionDTO article) throws Exception;
	public int getArticleCount() throws Exception;
	public int getArticleCount(String keyword) throws Exception;
	public List<DiscussionDTO> getArticles(int start, int end) throws Exception;
	public List<DiscussionDTO> getArticles(int start, int end, String keyword) throws Exception;
	public DiscussionDTO getArticle(int num) throws Exception;
	public int updateArticle(DiscussionDTO article) throws Exception;
	int deleteArticle(int num) throws Exception;
	public void report (int num) throws Exception;
	public void openStateCheck (int num) throws Exception;
	public void openStateOpen (int num) throws Exception;
	public void openStateClose (int num) throws Exception;
	
	public List<DiscussionDTO> getBestArticles(int start, int end, int sort);
	public List<DiscussionDTO> getBestCArticles(int start, int end, int sort);

	public void insertVote(Map<String, Object> voteMap);
	public int CheckVote(int discussionNum, String writer);
	public void updateVoteByUp(int discussionNum);
	public void updateVoteByDown(int discussionNum);

	public Map<String, Integer> getToday();
	public String getFirstDay(int month, int year);
	public Map<String, Integer> getPreWeek(Map<String, Integer> date);
	public String getSunday(Map<String, Integer> date) throws Exception;
	public List<DiscussionDTO> getBestArticles(int start, int end, int sort, String date1, String date2) throws Exception;
	public List<DiscussionDTO> getBestCArticles(int start, int end, int sort, String date1, String date2);
}
