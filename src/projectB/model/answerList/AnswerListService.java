package projectB.model.answerList;

import java.util.List;
import projectB.model.answer.AnswerDTO;
import projectB.model.petition.CategoryDTO;
import projectB.model.petition.PetitionDTO;

public interface AnswerListService {

  public int getArticleCount() throws Exception;
  public List<AnswerDTO> getArticles(int startRow, int endRow) throws Exception;
  public List<AnswerDTO> getArticles(int startRow, int endRow, int category) throws Exception;
  public List<AnswerDTO> getArticlesSort(int startRow, int endRow, int sort) throws Exception;
  public int getArticleCountbyCategory(int category) throws Exception;
  public int getArticleCountbyState(int state) throws Exception;
  public List<AnswerDTO> getArtilclebyState(int state, int startRow, int endRow) throws Exception;
  public List<CategoryDTO> getCategoryList() throws Exception;
  public List<AnswerDTO> getArticlesSearch(int startRow, int endRow, String keyword) throws Exception;
  public int getArticleCount(String keyword) throws Exception;
}
