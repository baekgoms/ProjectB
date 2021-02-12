package projectB.model.questionService;

import java.util.List;

import projectB.model.question.QuestionDTO;


public interface QuestionService {
	
	public void insertQuestion(QuestionDTO dto) throws Exception;
	public List getCategory() throws Exception;
	public List getCategoryMap() throws Exception;
	public List<QuestionDTO> getArticle( String writer) throws Exception;
	public List<QuestionDTO> getArticles(int start, int end) throws Exception;
	public List<QuestionDTO> getOneInfo(int num) throws Exception;
	public void deleteQuestion(int num) throws Exception;
	public List<QuestionDTO> questions(int start, int end, int sort) throws Exception;
	public int questionCount(int sort) throws Exception;
}
