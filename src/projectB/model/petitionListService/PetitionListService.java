package projectB.model.petitionListService;

import java.util.List;

import projectB.model.petition.CategoryDTO;
import projectB.model.petition.PetitionDTO;

public interface PetitionListService {
	
	public int getArticleCount() throws Exception;
	public List<PetitionDTO> getArticles(int startRow, int endRow) throws Exception;
	public List<PetitionDTO> getArticles(int startRow, int endRow, int category) throws Exception;
	public List<PetitionDTO> getArticlesSort(int startRow, int endRow, int sort) throws Exception;
	public int getArticleCountbyCategory(int category) throws Exception;
	public int getArticleCountbyState(int state) throws Exception;
	public List<PetitionDTO> getArtilclebyState(int state, int startRow, int endRow) throws Exception;
	public List<CategoryDTO> getCategoryList() throws Exception;
	public List<PetitionDTO> getArticlesSearch(int startRow, int endRow, String keyword) throws Exception;
	public int getArticleCount(String keyword) throws Exception;
	
	public PetitionDTO forReport(int num) throws Exception;
	public PetitionDTO reportCount(int num) throws Exception;
	public int getreportCount(int num) throws Exception;
	public int updateReport(String id) throws Exception;

}
