package projectB.model.questionService;

import java.util.List;

import projectB.model.question.QuestionDTO;


public interface QuestionService {
	
	public void insertQuestion(QuestionDTO dto) throws Exception;
	public List getCategory() throws Exception;

}
