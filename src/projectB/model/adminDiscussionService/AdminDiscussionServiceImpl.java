package projectB.model.adminDiscussionService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import projectB.model.petition.DiscussionDTO;

@Service("adminDis")
public class AdminDiscussionServiceImpl implements AdminDiscussionService{
	
	@Autowired
    private SqlSessionTemplate dao = null;
    
	@Override
	public List<DiscussionDTO> getAllArticles(int start, int end) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		List<DiscussionDTO> list = dao.selectList("disBoard.getArticles", map);
		return list;
	}

	@Override
	public int getAllArticlesCount() throws Exception {
		int a = dao.selectOne("disBoard.getArticleCount");
		return a;
	}

	@Override
	public void deleteArticle(int num) throws Exception {
		dao.update("disBoard.deleteArticle", num);
	}

	
}
