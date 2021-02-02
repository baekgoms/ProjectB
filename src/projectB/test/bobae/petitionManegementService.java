package projectB.test.bobae;

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
	
}
