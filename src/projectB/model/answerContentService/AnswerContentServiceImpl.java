package projectB.model.answerContentService;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import projectB.model.answer.AnswerDTO;
import projectB.model.answer.AnswerPetitionerMapDTO;

@Service("AnswerContentService")
public class AnswerContentServiceImpl implements AnswerContentService{

  @Autowired
  private SqlSessionTemplate dao = null;
  
  @Override
  public List<AnswerDTO> getAnswerByPetitionNum(int petitionNum) throws Exception {
    return dao.selectList("answer.getAnswerByPetitionNum", petitionNum);
  }

  @Override
  public void updateArticle(AnswerDTO answerDTO) throws Exception {
    dao.update("answer.updateArticle",answerDTO);
    
  }
}
