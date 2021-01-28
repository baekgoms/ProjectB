package projectB.model.adminPetitionService;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import projectB.model.petition.CategoryDTO;
import projectB.model.petition.PetCommentDTO;
import projectB.model.petition.PetitionDTO;
import projectB.model.petition.PetitionIndicatorDTO;
import projectB.model.petitioner.PetitionerDTO;

@Service("adminPetitionService")
public class AdminPetitionServiceImpl implements AdminPetitionService{
  
    @Autowired
    private SqlSessionTemplate dao = null;
    
    @Override
    public PetitionDTO getArticle(int num) throws Exception {
        return dao.selectOne("petition.getArticle", num);
    }
 
    @Override
    public String getCategoryName(int categoryNum) throws Exception {

      return dao.selectOne("petition.getCategoryName",categoryNum);
    }
   
  
    @Override
    public String getPetitionState(int petitionState) {
     
      return dao.selectOne("petition.getPetitionState", petitionState);
    }

    @Override
    public void updateArticle(PetitionDTO petitionDTO) throws Exception {
      dao.update("adminPetition.updatePetition",petitionDTO);
      
    }

    @Override
    public void updateClose(int num) throws Exception {
      dao.selectOne("adminPetition.updateClose",num);
      
    }

    @Override
    public void updateOpen(int num) throws Exception {
      dao.selectOne("adminPetition.updateOpen",num);
      
    }

}
