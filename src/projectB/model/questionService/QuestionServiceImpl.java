package projectB.model.questionService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import projectB.model.question.QuestionCommentDTO;
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
	public List<QuestionDTO> getArticle( String writer) throws Exception {

		List<QuestionDTO> articleList = dao.selectList("question.getArticle", writer);

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
	
	@Override
	public List<QuestionDTO> questions(int startRow, int endRow, int sort) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("sort", sort);

		List<QuestionDTO> articleList = dao.selectList("question.questions", map);

		return articleList;
	}
	
	public int questionCount(int sort) throws Exception {
		return dao.selectOne("question.totalQuestionCount", sort);
	}

	@Override
	public void deleteQuestion(int num) throws Exception {
		dao.delete("question.deleteQuestion", num);
	}

	@Override
	public void insertComment(QuestionCommentDTO dto) throws Exception {
		dao.insert("question.insertComment", dto);
		
	}

	@Override
	public List<QuestionCommentDTO> getComments(int num) throws Exception {
		List<QuestionCommentDTO> comment = dao.selectList("question.getComments", num);
		return comment;
	}

}
