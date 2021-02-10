package projectB.model.adminDiscussionService;

import java.util.List;

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
		
		List<DiscussionDTO> list = dao.selectList("disBoard.getArticles");
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
