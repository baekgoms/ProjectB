package projectB.model.answerContentService;

import java.util.List;
import projectB.model.answer.AnswerDTO;
import projectB.model.answer.AnswerPetitionerMapDTO;
import projectB.model.petition.PetitionDTO;

public interface AnswerContentService {

  public AnswerDTO getAnswerByPetitionNum(int petitionNum) throws Exception;

  public void updateArticle(AnswerDTO answerDTO) throws Exception;

  public void updateArticle2(AnswerDTO answerDTO) throws Exception;
}
