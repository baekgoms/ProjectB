package projectB.test.hj;

import java.util.List;

public interface DisBoardService {

	public void insertArticle(DisBoardDTO article) throws Exception;
	public int getArticleCount() throws Exception;
	public List<DisBoardDTO> getArticles(int start, int end) throws Exception;
	public DisBoardDTO getArticle(int num) throws Exception;
	public DisBoardDTO updateGetArticle(int num) throws Exception;
	public int updateArticle(DisBoardDTO article) throws Exception;
	int deleteArticle(int num) throws Exception;
	public void agreement(int num) throws Exception;
	public void opposition (int num) throws Exception;
}
