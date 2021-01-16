package projectB.model.petitionService;

import java.util.List;

import projectB.model.petition.CategoryDTO;
import projectB.model.petition.PetCommentDTO;
import projectB.model.petition.PetitionDTO;

public interface PetitionService {
	
	public void insertArticle(PetitionDTO petition) throws Exception;
	public List<PetitionDTO> getCategory() throws Exception;
	public int getArticleCount() throws Exception;
	public List<PetitionDTO> getArticles(int start, int end) throws Exception;
	
	public int getArticleCountbyCategory(int category) throws Exception;
	public List<PetitionDTO> getArticles(int start, int end, int category) throws Exception;
	public List<PetitionDTO> getArticlesSort(int start, int end, int sort) throws Exception;
	
	public PetitionDTO updateGetArticle(int num) throws Exception;
	public int getArticleCountbyState(int state) throws Exception;
	public List<PetitionDTO> getArtilclebyState(int state, int start, int end) throws Exception;
	public List<CategoryDTO> getCategoryList() throws Exception;
	
	public PetitionDTO getArticle(int num) throws Exception;
	public void insertPetCmt(PetCommentDTO dto) throws Exception;
	public List<PetitionDTO> petCmtListAll(int petitionNum) throws Exception;
	public List<PetitionDTO> petCmtList(int petitionNum, int start, int end) throws Exception;
	public int petCmtCount(int petitionNum) throws Exception;

}
