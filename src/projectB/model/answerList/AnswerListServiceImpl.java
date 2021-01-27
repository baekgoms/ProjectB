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
  public int getArticleCount(int state,String department, int category, String keyword) throws Exception {
    Map map = new HashMap();
    map.put("state", state);
    map.put("department", department);
    map.put("category", category);
    map.put("keyword", keyword);
    return dao.selectOne("answer.getArticleCount", map);
  }

  
  @Override
  public List<CategoryDTO> getCategoryList() throws Exception {
    return dao.selectList("answer.getCategoryList");
  }
  
  @Override
  public List<AnswerDTO> getArticleAll(int state,int startRow, int endRow,String department, int category, String keyword, String sort) throws Exception {
    Map map = new HashMap();
    map.put("state", state);
    map.put("startRow", startRow); 
    map.put("endRow", endRow);
    map.put("department", department);
    map.put("category", category);
    map.put("keyword", keyword);
    map.put("sort", sort);
    

    List<AnswerDTO> articleList = dao.selectList("answer.getArticleAll", map);

    return articleList;
  }


  @Override
  public PetitionDTO getPetitionInfo(int petitionNum) throws Exception {
    return dao.selectOne("answer.getPetitionInfo", petitionNum);
  }

}
