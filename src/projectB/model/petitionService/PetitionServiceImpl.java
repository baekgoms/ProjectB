package projectB.model.petitionService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<PetitionDTO> getCategory() throws Exception {
		Map map = new HashMap();
		
		
		return dao.selectList("petition.getCategory");
	}
	
	@Override
	public int getArticleCount() throws Exception {
	
		return dao.selectOne("petition.getArticleCount");
	}

	@Override
	public List<PetitionDTO> getArticles(int startRow, int endRow) throws Exception {
 
		Map map = new HashMap();
		map.put("startRow",startRow);
		map.put("endRow",endRow);
		
		List<PetitionDTO> articleList = dao.selectList("petition.getArticleAll", map);
		
		return articleList;
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

	@Override
	public int getArticleCountbyState(int state) throws Exception {
		return dao.selectOne("petition.getArticleCountState", state);
	}

	@Override
	public List<PetitionDTO> getArtilclebyState(int state, int startRow, int endRow) throws Exception {
		Map map = new HashMap();
		map.put("state",state);
		map.put("startRow",startRow);
		map.put("endRow",endRow);
		List<PetitionDTO> stateList = dao.selectList("petition.getArticleState", map);
		return stateList;
	}






}
