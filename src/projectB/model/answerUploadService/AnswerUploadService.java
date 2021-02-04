package projectB.model.answerUploadService;

import projectB.model.answer.AnswerDTO;
import projectB.model.petition.PetitionDTO;
import projectB.model.petitioner.PetitionerDTO;

public interface AnswerUploadService { 
  public PetitionDTO getPetitionInfo(int petitionNum) throws Exception;
  public void updateAnswerState(int petitionNum) throws Exception;
  public void updatePetitionState(int num) throws Exception;
  public void insertArticle(AnswerDTO answerDTO) throws Exception;
  public PetitionerDTO getReplyerInfo(String id) throws Exception;
  public AnswerDTO getAnswerInfo(int petitionNum) throws Exception;
  public void insertArticle2(AnswerDTO answerDTO) throws Exception;
}
