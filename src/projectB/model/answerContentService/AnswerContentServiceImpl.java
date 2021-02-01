package projectB.model.answerContentService;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import projectB.model.answer.AnswerDTO;

@Service("AnswerContentService")
public class AnswerContentServiceImpl implements AnswerContentService{

  @Autowired
  private SqlSessionTemplate dao = null;
  
  @Override
  public AnswerDTO getArticle(int num) throws Exception {
    // TODO Auto-generated method stub
    return null;
  }

  
}
