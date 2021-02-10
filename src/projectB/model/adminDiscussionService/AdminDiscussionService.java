package projectB.model.adminDiscussionService;

import java.util.List;

import projectB.model.petition.DiscussionDTO;

public interface AdminDiscussionService {

	public List<DiscussionDTO> getAllArticles(int start, int end) throws Exception;
	public int getAllArticlesCount() throws Exception;
	public void deleteArticle(int num) throws Exception;
}
