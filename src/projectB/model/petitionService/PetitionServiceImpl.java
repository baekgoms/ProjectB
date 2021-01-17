package projectB.model.petitionService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import projectB.model.petition.CategoryDTO;
import projectB.model.petition.PetCommentDTO;
import projectB.model.petition.PetitionDTO;
import projectB.model.petition.PetitionIndicatorDTO;

@Service("petitionDAO")
public class PetitionServiceImpl implements PetitionService {

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
		map.put("startRow", startRow);
		map.put("endRow", endRow);

		List<PetitionDTO> articleList = dao.selectList("petition.getArticleAll", map);

		return articleList;
	}
	
	@Override
	public List<PetitionDTO> getArticles(int startRow, int endRow, int category) throws Exception {
		Map map = new HashMap();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("category", category);
		List<PetitionDTO> articleList = dao.selectList("petition.getArticleCategory", map);
		return articleList;
	}
	
	@Override
	public List<PetitionDTO> getArticlesSort(int startRow, int endRow, int sort) throws Exception {
		Map map = new HashMap();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("sort", sort);
		List<PetitionDTO> articleList = dao.selectList("petition.getArticleAll", map);
		return articleList;
	}
	
	@Override
	public int getArticleCountbyCategory(int category) throws Exception {
		return dao.selectOne("petition.getArticleCountCategory", category);
	}
	

	@Override
	public PetitionDTO updateGetArticle(int num) throws Exception {

		return null;
	}

	@Override
	public int getArticleCountbyState(int state) throws Exception {
		return dao.selectOne("petition.getArticleCountState", state);
	}

	@Override
	public List<PetitionDTO> getArtilclebyState(int state, int startRow, int endRow) throws Exception {
		Map map = new HashMap();
		map.put("state", state);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<PetitionDTO> stateList = dao.selectList("petition.getArticleState", map);
		return stateList;
	}

	@Override
	public PetitionDTO getArticle(int num) throws Exception {
		return dao.selectOne("petition.getArticle", num);
	}

	@Override
	public void insertPetCmt(PetCommentDTO dto) throws Exception {
		dao.insert("petition.insertPetCmt", dto);
	}

	@Override
	public List<PetitionDTO> petCmtListAll(int petitionNum) throws Exception {
		return dao.selectList("petition.petCmtListAll", petitionNum);
	}

	@Override
	public int petCmtCount(int petitionNum) throws Exception {
		return dao.selectOne("petition.petCmtCount", petitionNum);
	}

	@Override
	public List<PetitionDTO> petCmtList(int petitionNum, int start, int end) throws Exception {
		Map map = new HashMap();
		map.put("petitionNum", petitionNum);
		map.put("start", start);
		map.put("end", end);
		List<PetitionDTO> petCmtList = dao.selectList("petition.petCmtList", map);
		return petCmtList;
	}

	@Override
	public List<CategoryDTO> getCategoryList() throws Exception {
		return dao.selectList("petition.getCategoryList");
	}

	@Override
	public List<PetitionDTO> getArticlesSearch(int startRow, int endRow, String keyword) throws Exception {
		Map map = new HashMap();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("keyword", keyword);
		List<PetitionDTO> articleList = dao.selectList("petition.getArticleAll", map);
		return articleList;
	}

	@Override
	public int getArticleCount(String keyword) throws Exception {
		int count = dao.selectOne("petition.getArticleCount",keyword);
		return count;
	}

	@Override
	public PetitionIndicatorDTO getPetitionIndicator(int num) throws Exception {
        return dao.selectOne("petition.getPetitionIndicator", num);
	}

}
