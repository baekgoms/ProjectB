package projectB.model.questionService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import projectB.model.question.QuestionDTO;

@Service("questionDAO")
public class QuestionServiceImpl implements QuestionService{

	@Autowired
	private SqlSessionTemplate dao = null;
	
	@Override
	public void insertQuestion(QuestionDTO dto) throws Exception {
		dao.insert("question.insertArticle", dto);
	}

	@Override
	public List getCategory() throws Exception {

		return dao.selectList("question.getCategory");
	}
	
	@Override
	public List getCategoryMap() throws Exception {
	
		return dao.selectList("question.getCategoryMap");
	}

	@Override
	public List<QuestionDTO> getArticle() throws Exception {

		List<QuestionDTO> articleList = dao.selectList("question.getArticle");

		return articleList;
	}

	@Override
	public List<QuestionDTO> getArticles(int start, int end) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		List<QuestionDTO> articleList = dao.selectList("question.getArticles", map);

		return articleList;
	}

	@Override
	public List<QuestionDTO> getOneInfo(int num) throws Exception {
		
		return dao.selectList("question.getOneInfo",num);
	}

}
