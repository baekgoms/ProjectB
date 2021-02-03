package projectB.model.answerUploadService;

import projectB.model.answer.AnswerDTO;
import projectB.model.petition.PetitionDTO;

public interface AnswerUploadService { 
  public PetitionDTO getPetitionInfo(int petitionNum) throws Exception;
  public void updateAnswerState(int petitionNum) throws Exception;
  public void updatePetitionState(int num) throws Exception;
  public void insertArticle(AnswerDTO answerDTO) throws Exception;
}
