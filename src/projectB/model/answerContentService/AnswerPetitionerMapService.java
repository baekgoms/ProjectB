package projectB.model.answerContentService;

import projectB.model.answer.AnswerPetitionerMapDTO;

public interface AnswerPetitionerMapService {
  
  public void insertAnswerPetitionerMap(AnswerPetitionerMapDTO answerPetitionerMapDTO) throws Exception;

  public void answerReact(AnswerPetitionerMapDTO answerPetitionerMapDTO) throws Exception;
  
  public AnswerPetitionerMapDTO getAnswerPetitionerMap(AnswerPetitionerMapDTO answerPetitionerMapDTO) throws Exception;
}
