package projectB.model.adminPetManagerService;

import java.util.List;

import projectB.model.petition.CategoryDTO;
import projectB.model.petition.PetitionDTO;
import projectB.model.petition.petitionStateDTO;


public interface petitionManegementService {
	
	public int getArticleCount() throws Exception;
	public List<PetitionDTO> getArticles(int startRow, int endRow) throws Exception;
	public int getArticleCountbyCategory(int category) throws Exception;
	public List<CategoryDTO> getCategoryList() throws Exception;
	public int getArticleCountbyState(int state) throws Exception;
	public List<petitionStateDTO> getStateList() throws Exception;
	public List<PetitionDTO> getArticlesSearch(int startRow, int endRow, String keyword, String searchOption, int check) throws Exception;
	public int getArticleCount(String keyword, String searchOption, int chkeck) throws Exception;
	public PetitionDTO getContent(int num) throws Exception;
	public List<PetitionDTO> getArtilclebyState(int state, int startRow, int endRow) throws Exception;
	public void deleteArticle(int num);
	public PetitionDTO checkOpCl(int num)throws Exception;
	public void updatePublicly(int num) throws Exception;
	public void updatePrivate(int num) throws Exception;
}
