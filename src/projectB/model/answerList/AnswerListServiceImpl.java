package projectB.model.answerList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import projectB.model.answer.AnswerDTO;
import projectB.model.petition.CategoryDTO;
import projectB.model.petition.PetitionDTO;

@Service("AnswerListService")
public class AnswerListServiceImpl implements AnswerListService{

  @Autowired
  private SqlSessionTemplate dao = null;
  
  @Override
  public int getArticleCount() throws Exception {
    return dao.selectOne("answer.getArticleCount");
  }

  @Override
  public List<AnswerDTO> getArticles(int startRow, int endRow) throws Exception {
    Map map = new HashMap();
    map.put("startRow", startRow);
    map.put("endRow", endRow);

    List<AnswerDTO> articleList = dao.selectList("answer.getArticleAll", map);

    return articleList;
  }

  @Override
  public List<AnswerDTO> getArticles(int startRow, int endRow, int category) throws Exception {
    Map map = new HashMap();
    map.put("startRow", startRow);
    map.put("endRow", endRow);
    map.put("category", category);
    List<AnswerDTO> articleList = dao.selectList("answer.getArticleCategory", map);
    return articleList;
  }

  @Override
  public List<AnswerDTO> getArticlesSort(int startRow, int endRow, int sort) throws Exception {
    Map map = new HashMap();
    map.put("startRow", startRow);
    map.put("endRow", endRow);
    map.put("sort", sort);
    List<AnswerDTO> articleList = dao.selectList("answer.getArticleAll", map);
    return articleList;
  }

  @Override
  public int getArticleCountbyCategory(int category) throws Exception {
    return dao.selectOne("answer.getArticleCountCategory", category);
  }

  @Override
  public int getArticleCountbyState(int state) throws Exception {
    return dao.selectOne("answer.getArticleCountState", state);
  }

  @Override
  public List<AnswerDTO> getArtilclebyState(int state, int startRow, int endRow) throws Exception {
    Map map = new HashMap();
    map.put("state", state);
    map.put("startRow", startRow);
    map.put("endRow", endRow);
    List<AnswerDTO> stateList = dao.selectList("answer.getArticleState", map);
    return stateList;
  }

  @Override
  public List<CategoryDTO> getCategoryList() throws Exception {
    return dao.selectList("answer.getCategoryList");
  }

  @Override
  public List<AnswerDTO> getArticlesSearch(int startRow, int endRow, String keyword)
      throws Exception {
    Map map = new HashMap();
    map.put("startRow", startRow);
    map.put("endRow", endRow);
    map.put("keyword", keyword);
    List<AnswerDTO> articleList = dao.selectList("answer.getArticleAll", map);
    return articleList;
  }

  @Override
  public int getArticleCount(String keyword) throws Exception {
    int count = dao.selectOne("answer.getArticleCount",keyword);
    return count;
  }

}
