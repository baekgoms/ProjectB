package projectB.model.answerUploadService;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import projectB.model.answer.AnswerDTO;
import projectB.model.petition.PetitionDTO;
import projectB.model.petitioner.PetitionerDTO;

@Service("AnswerUploadService")
public class AnswerUploadServiceImpl implements AnswerUploadService {

    @Autowired
    private SqlSessionTemplate dao = null;
    
    
    @Override
    public PetitionDTO getPetitionInfo(int petitionNum) throws Exception {
      return dao.selectOne("answer.getPetitionInfo", petitionNum);
    }
    
   
    
    @Override
    public void insertArticle(AnswerDTO answerDTO) throws Exception {
      dao.insert("answer.insertArticle", answerDTO);
      
    }
  
    @Override
    public void updateAnswerState(int petitionNum) throws Exception {
      dao.update("answer.updateAnswerState",petitionNum);
      
    }
  
    @Override
    public void updatePetitionState(int num) throws Exception {
      dao.update("answer.updatePetitionState",num);
      
    }



    @Override
    public PetitionerDTO getReplyerInfo(String id) throws Exception {
      return dao.selectOne("answer.getReplyerInfo",id);
    }



    @Override
    public AnswerDTO getAnswerInfo(int petitionNum) throws Exception {
      return dao.selectOne("answer.getAnswerInfo",petitionNum);
    }



    @Override
    public void insertArticle2(AnswerDTO answerDTO) throws Exception {
      dao.insert("answer.insertArticle2", answerDTO);
    }
 
}
