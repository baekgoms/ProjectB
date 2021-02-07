package projectB.model.answerUploadService;

import java.util.List;
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
    public void insertArticle(AnswerDTO answerDTO) throws Exception {
      dao.insert("answer.insertArticle", answerDTO);
      
    }

    @Override
    public int insertParentNum(int petitionNum) throws Exception {
      return dao.selectOne("answer.insertParentNum",petitionNum);
    }
    
    
    @Override
    public void createRow(AnswerDTO answerDTO) throws Exception {
      int parentNum = dao.selectOne("answer.insertParentNum",answerDTO.getPetitionNum());
      System.out.println("parentNum_1==="+parentNum);
      
      answerDTO.setParentNum(parentNum);
      dao.insert("answer.createRow",answerDTO);
    }


    @Override
    public void insertAddArticle(AnswerDTO answerDTO) throws Exception {
      int parentNum = dao.selectOne("answer.findParentNum",answerDTO);
      System.out.println("parentNum_2==="+parentNum);
      
      answerDTO.setParentNum(parentNum);
      dao.insert("answer.insertAddArticle", answerDTO);
      
    }


    @Override
    public int findParentNum(AnswerDTO answerDTO) throws Exception {
      return dao.selectOne("answer.findParentNum",answerDTO);
    }

 
}
