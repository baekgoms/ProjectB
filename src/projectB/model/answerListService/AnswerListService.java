package projectB.model.answerListService;

import java.util.List;
import projectB.model.answer.AnswerDTO;
import projectB.model.petition.CategoryDTO;
import projectB.model.petition.PetitionDTO;

public interface AnswerListService {

  public int getArticleCount(int state,String department, int category, String keyword) throws Exception;
  public List<AnswerDTO> getArticleAll(int state,int startRow, int endRow,String department, int category, String keyword, String sort) throws Exception;
  public List<CategoryDTO> getCategoryList() throws Exception; 
  public PetitionDTO getPetitionInfo(int petitionNum) throws Exception;
  
  public List<AnswerDTO> getAnswerByRecommends(int startRow, int endRow, int sort) throws Exception;
  public List<AnswerDTO> getAnswerByOpposites(int startRow, int endRow, int sort) throws Exception;
  public List<AnswerDTO> getAnswerByAdditions(int startRow, int endRow, int sort) throws Exception;

}
