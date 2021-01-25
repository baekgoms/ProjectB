package projectB.model.questionService;

import java.util.List;

import projectB.model.question.QuestionDTO;


public interface QuestionService {
	
	public void insertQuestion(QuestionDTO dto) throws Exception;
	public List getCategory() throws Exception;
	public List getCategoryMap() throws Exception;
	public List<QuestionDTO> getArticle() throws Exception;
	public List<QuestionDTO> getArticles(int start, int end) throws Exception;
	
}
