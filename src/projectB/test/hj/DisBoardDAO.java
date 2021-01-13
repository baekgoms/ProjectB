package projectB.test.hj;

import java.util.List;

import org.springframework.stereotype.Service;

@Service("boardDAO")
public class DisBoardDAO implements DisBoardService{
	
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
	public DisBoardDTO updateGetArticle(int num) throws Exception {
		return null;
	}

	@Override
	public int updateArticle(DisBoardDTO article) throws Exception {
		return 0;
	}

	@Override
	public int deleteArticle(int num, String passwd) throws Exception {
		return 0;
	}

	@Override
	public void agreement(int num) throws Exception {
		
	}

	@Override
	public void opposition(int num) throws Exception {
		
	}

}
