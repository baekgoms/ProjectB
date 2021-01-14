package projectB.test.hj;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("disBoardDAO")
public class DisBoardDAO implements DisBoardService{
	
	@Autowired
	private SqlSessionTemplate bDao = null;
	
	@Override
	public void insertArticle(DisBoardDTO article) throws Exception {
	}

	@Override
	public int getArticleCount() throws Exception {
		return 0;
	}

	@Override
	public List<DisBoardDTO> getArticles(int start, int end) throws Exception {
		return null;
	}

	@Override
	public DisBoardDTO getArticle(int num) throws Exception {
		return null;
	}

	@Override
	public int updateArticle(DisBoardDTO article) throws Exception {
		return 0;
	}

	@Override
	public int deleteArticle(int num) throws Exception {
		return 0;
	}

	@Override
	public void agreement(int num) throws Exception {
		
	}

	@Override
	public void opposition(int num) throws Exception {
		
	}

	@Override
	public void report(int num) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void openStateOpen(int num) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void openStateCheck(int num) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void openStateClose(int num) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
