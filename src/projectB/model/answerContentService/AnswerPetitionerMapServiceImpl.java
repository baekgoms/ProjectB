package projectB.model.answerContentService;

import java.util.HashMap;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import projectB.model.answer.AnswerPetitionerMapDTO;
import projectB.model.petition.PetitionPetitionerMapDTO;

@Service("AnswerPetitionerMapService")
public class AnswerPetitionerMapServiceImpl implements AnswerPetitionerMapService{

  @Autowired
  private SqlSessionTemplate dao = null;

  @Override
  public void insertAnswerPetitionerMap(AnswerPetitionerMapDTO answerPetitionerMapDTO) {
    dao.insert("answer.insertAnswerPetitionerMap", answerPetitionerMapDTO);
  }

  @Override
  public void answerReact(AnswerPetitionerMapDTO answerPetitionerMapDTO) {
    dao.update("answer.answerReact", answerPetitionerMapDTO);
  }

  @Override
  public AnswerPetitionerMapDTO getAnswerPetitionerMap(
      AnswerPetitionerMapDTO answerPetitionerMapDTO) {
    return dao.selectOne("answer.getAnswerPetitionerMap", answerPetitionerMapDTO);
  }

  
}
