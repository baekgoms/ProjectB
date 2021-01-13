package projectB.test.bobae;

import java.util.List;

import projectB.model.PetitionDTO;

public interface PetitionService {
	
	public void insertArticle(PetitionDTO board) throws Exception;
	public int getArticleCount() throws Exception;
	public List<PetitionDTO> getArticle(PetitionDTO board) throws Exception;
	public PetitionDTO getArticle(int num) throws Exception;
	public PetitionDTO updateGetArticle(int num) throws Exception;
	public int updateArticle(PetitionDTO board) throws Exception;
	public int daleteArtilcle(PetitionDTO board) throws Exception;

}
