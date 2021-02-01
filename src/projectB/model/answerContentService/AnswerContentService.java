package projectB.model.answerContentService;

import projectB.model.answer.AnswerDTO;
import projectB.model.petition.PetitionDTO;

public interface AnswerContentService {

  public AnswerDTO getArticle(int num) throws Exception;
}
