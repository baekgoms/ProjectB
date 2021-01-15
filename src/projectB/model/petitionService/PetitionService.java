package projectB.model.petitionService;

import java.util.List;

import projectB.model.petition.PetCommentDTO;
import projectB.model.petition.PetitionDTO;

public interface PetitionService {
	
	public void insertArticle(PetitionDTO petition) throws Exception;
	public List<PetitionDTO> getCategory() throws Exception;
	public int getArticleCount() throws Exception;
	public List<PetitionDTO> getArticles(int start, int end) throws Exception;
	public PetitionDTO updateGetArticle(int num) throws Exception;
	public int getArticleCountbyState() throws Exception;
	public List<PetitionDTO> getArtilclebyState(int state, int start, int end) throws Exception;
	
	//청원내용+댓글
	public PetitionDTO getArticle(int num) throws Exception;
	public void insertPetCmt(PetCommentDTO dto) throws Exception;
	public List<PetitionDTO> petCmtListAll(int petitionNum) throws Exception;
	public List<PetitionDTO> petCmtList(int petitionNum, int start, int end) throws Exception;
	public int petCmtCount(int petitionNum) throws Exception;

}
