package projectB.test.bobae;

import java.util.List;

import org.springframework.stereotype.Service;

import projectB.model.petition.PetitionDTO;

@Service("petitionDAO")
public class PetitionServiceImpl implements PetitionService{

	@Override
	public void insertArticle(PetitionDTO board) throws Exception {
		
	}

	@Override
	public int getArticleCount() throws Exception {
	
		return 0;
	}

	@Override
	public List<PetitionDTO> getArticle(PetitionDTO board) throws Exception {
	
		return null;
	}

	@Override
	public PetitionDTO getArticle(int num) throws Exception {
	
		return null;
	}

	@Override
	public PetitionDTO updateGetArticle(int num) throws Exception {
	
		return null;
	}

	@Override
	public int updateArticle(PetitionDTO board) throws Exception {
	
		return 0;
	}

	@Override
	public int daleteArtilcle(PetitionDTO board) throws Exception {

		return 0;
	}

}
