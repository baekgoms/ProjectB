package projectB.test.bobae;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import projectB.model.petition.PetitionDTO;

@Service("petitionDAO")
public class PetitionServiceImpl implements PetitionService{

	@Autowired
	private SqlSessionTemplate dao = null;
	
	@Override
	public void insertArticle(PetitionDTO petition) throws Exception {
		dao.insert("petition.insertArticle", petition);
	}

	@Override
	public int getArticleCount() throws Exception {
	
		return dao.selectOne("petition.getArticleCount");
	}

	@Override
	public List<PetitionDTO> getArticles(PetitionDTO petition) throws Exception {
	
		return dao.selectList("petition.getArticleAll", petition);
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
	public int updateArticle(PetitionDTO petition) throws Exception {
	
		return 0;
	}

	@Override
	public int daleteArtilcle(int num) throws Exception {

		return 0;
	}




}
