package projectB.model.petitionListService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import projectB.model.petition.CategoryDTO;
import projectB.model.petition.PetitionDTO;


@Service("petitionListService")
public class PetitionListServiceImpl implements PetitionListService{
	
	@Autowired
	private SqlSessionTemplate dao = null;
	
	
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




    //신고하기 Test중
    @Override
    public PetitionDTO forReport(int num) throws Exception {

        return dao.selectOne("petition.forReport",num);
    }

    @Override
    public PetitionDTO reportCount(int num) throws Exception {
        dao.update("petition.reportCount",num);
        return dao.selectOne("petition.forReport",num);
    }

    @Override
    public int getreportCount(int num) throws Exception {
        
        return dao.selectOne("petition.reportCountBynum", num);
    }

    @Override
    public int updateReport(String id) throws Exception {
        
        return dao.update("petition.reportCountId", id);

    }

}
