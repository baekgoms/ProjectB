package projectB.test.bobae;

import java.util.List;

import projectB.model.petition.PetitionDTO;

public interface PetitionService {
	
	public void insertArticle(PetitionDTO petition) throws Exception;
	public int getArticleCount() throws Exception;
	public List<PetitionDTO> getArticles(PetitionDTO petition) throws Exception;
	public PetitionDTO getArticle(int num) throws Exception;
	public PetitionDTO updateGetArticle(int num) throws Exception;
	public int updateArticle(PetitionDTO petition) throws Exception;
	public int daleteArtilcle(int num) throws Exception;
	

}
