package projectB.test.hj;

import java.util.List;

import projectB.model.petition.DiscussionDTO;

public interface DisBoardService {

	public void insertArticle(DiscussionDTO article) throws Exception;
	public int getArticleCount() throws Exception;
	public int getArticleCount(String keyword) throws Exception;
	public List<DiscussionDTO> getArticles(int start, int end) throws Exception;
	public List<DiscussionDTO> getArticles(int start, int end, String keyword) throws Exception;
	public List<DiscussionDTO> getArticles(int start, int end, int sort) throws Exception;
	public DiscussionDTO getArticle(int num) throws Exception;
	public int updateArticle(DiscussionDTO article) throws Exception;
	int deleteArticle(int num) throws Exception;
	public void agreement(int num) throws Exception;
	public void opposition (int num) throws Exception;
	public void report (int num) throws Exception;
	public void openStateCheck (int num) throws Exception;
	public void openStateOpen (int num) throws Exception;
	public void openStateClose (int num) throws Exception;
	
	public List<DiscussionDTO> getBestArticles(int start, int end);
	public List<DiscussionDTO> getBestCArticles(int start, int end);
}
