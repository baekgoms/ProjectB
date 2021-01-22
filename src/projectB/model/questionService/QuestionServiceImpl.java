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
		Map map = new HashMap();

		return dao.selectList("question.getCategory");
	}

}
