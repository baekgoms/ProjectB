package projectB.model.adminPetManagerService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import projectB.model.petition.CategoryDTO;
import projectB.model.petition.PetitionDTO;
import projectB.model.petition.petitionStateDTO;

@Service("petitionManegementService")
public class petitionManagementImpl implements petitionManegementService{

	@Autowired
	private SqlSessionTemplate dao = null;
	
	@Override
	public int getArticleCount() throws Exception {
		
		return dao.selectOne("adminPetition.getArticleCount");
	}

	@Override
	public List<PetitionDTO> getArticles(int startRow, int endRow) throws Exception {
		
		Map map = new HashMap();
		map.put("startRow", startRow);
		map.put("endRow", endRow);

		List<PetitionDTO> articleList = dao.selectList("adminPetition.getArticleAll", map);

		return articleList;
	}

	@Override
	public int getArticleCountbyCategory(int category) throws Exception {
		
		return dao.selectOne("adminPetition.getArticleCountCategory", category);
	}

	@Override
	public List<CategoryDTO> getCategoryList() throws Exception {
		
		 return dao.selectList("adminPetition.getCategoryList");
	}

	@Override
	public int getArticleCountbyState(int state) throws Exception {
		
		return dao.selectOne("adminPetition.getArticleCountState", state);
	}

	@Override
	public List<petitionStateDTO> getStateList() throws Exception {

		return dao.selectList("adminPetition.getStateList");
	}
	
	 @Override
	    public List<PetitionDTO> getArticlesSearch(int startRow, int endRow, String keyword, String searchOption, int check) throws Exception {
	        Map map = new HashMap();
	        map.put("startRow", startRow);
	        map.put("endRow", endRow);
	        map.put("keyword", keyword);
	        map.put("searchOption", searchOption);
	        map.put("check", check);
	        List<PetitionDTO> articleList = dao.selectList("adminPetition.getArticleAll", map);
	        return articleList;
	    }

	    @Override
	    public int getArticleCount(String keyword, String searchOption,int check) throws Exception {
	    	Map map = new HashMap();
	        map.put("keyword", keyword);
	        map.put("searchOption", searchOption);
	    	int count = dao.selectOne("adminPetition.getArticleCount",map);
	        return count;
	    }

		@Override
		public PetitionDTO getContent(int num) throws Exception {
			
			return dao.selectOne("adminPetition.getContent",num);
		}

		@Override
		public List<PetitionDTO> getArtilclebyState(int state, int startRow, int endRow) throws Exception {
			Map map = new HashMap();
			map.put("state", state);
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			List<PetitionDTO> stateList = dao.selectList("adminPetition.getArticleState", map);
			return stateList;
		}

		@Override
		public void deleteArticle(int num) {
			dao.delete("adminPetition.deleteArticle",num);
		}

		@Override
		public PetitionDTO checkOpCl(int num) throws Exception {
			
			return dao.selectOne("adminPetition.checkOpCl", num);
		}

		@Override
		public void updatePublicly(int num) throws Exception {
			dao.selectOne("adminPetition.updateOpen",num);	
		}

		@Override
		public void updatePrivate(int num) throws Exception {
			dao.selectOne("adminPetition.updateClose",num);	
			
		}

		

}
