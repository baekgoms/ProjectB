package projectB.model.petitionService;

import java.util.List;

import projectB.model.petition.CategoryDTO;
import projectB.model.petition.DiscussionDTO;
import projectB.model.petition.PetCommentDTO;
import projectB.model.petition.PetitionDTO;
import projectB.model.petition.PetitionIndicatorDTO;
import projectB.model.petitioner.PetitionerDTO;

public interface PetitionService {
	
	public void insertArticle(PetitionDTO petition) throws Exception;
	public void insertDiscussion(DiscussionDTO dto) throws Exception;
	public List<PetitionDTO> getCategory() throws Exception;
	public int getArticleCount() throws Exception;
	public int getArticleCount(String keyword) throws Exception;
	public List<PetitionDTO> getArticles(int start, int end) throws Exception;
	
	public int getArticleCountbyCategory(int category) throws Exception;
	public List<PetitionDTO> getArticles(int startRow, int endRow, int category) throws Exception;
	public List<PetitionDTO> getArticlesSort(int startRow, int endRow, int sort) throws Exception;
	public List<PetitionDTO> getArticlesSearch(int startRow, int endRow, String keyword) throws Exception;
	public PetitionDTO updateGetArticle(int num) throws Exception;
	public int getArticleCountbyState(int state) throws Exception;
	public List<PetitionDTO> getArtilclebyState(int state, int startRow, int endRow) throws Exception;
	public List<CategoryDTO> getCategoryList() throws Exception;
	//신고하기 test중
	public PetitionDTO forReport(int num) throws Exception;
	public PetitionDTO reportCount(int num) throws Exception;
	public int getreportCount(int num) throws Exception;
	public int updateReport(String id) throws Exception;
	
	public PetitionDTO getArticle(int num) throws Exception;
	public void insertPetCmt(PetCommentDTO dto) throws Exception;
	public List<PetitionDTO> petCmtListAll(int petitionNum) throws Exception;
	public List<PetitionDTO> petCmtList(int petitionNum, int start, int end) throws Exception;
	public int petCmtCount(int petitionNum) throws Exception;
    public PetitionIndicatorDTO getPetitionIndicator(int num) throws Exception;

	// 청원 동의자수 +1
	int updatePetitionCount(int petitionNum);
}
