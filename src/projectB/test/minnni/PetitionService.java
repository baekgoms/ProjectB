package projectB.test.minnni;

import projectB.model.petition.PetitionDTO;

public interface PetitionService {

	//public static final String dbConnect = "jdbc/orcl";

	public PetitionDTO getArticle(int num) throws Exception;
	
	public void insertCmt(PetCommentDTO dto) throws Exception;
}