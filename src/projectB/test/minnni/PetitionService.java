package projectB.test.minnni;

import java.util.List;

import projectB.model.petition.PetitionDTO;

public interface PetitionService {

	public PetitionDTO getArticle(int num) throws Exception;
	
	public void insertCmt(PetCommentDTO dto) throws Exception;
	
	//public PetitionDTO petCmtList(int petitionNum) throws Exception;
	public List petCmtList(int petitionNum) throws Exception;
	
	public int petCmtCount() throws Exception;
}