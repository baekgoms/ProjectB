package projectB.model.petitionContentService;

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

@Service("petitionContentService")
public class PetitionContentServiceImpl implements PetitionContentService{
  
    @Autowired
    private SqlSessionTemplate dao = null;
    
    @Override
    public PetitionDTO getArticle(int num) throws Exception {
        return dao.selectOne("petition.getArticle", num);
    }
    
    @Override
    public void insertPetCmt(PetCommentDTO dto) throws Exception {
        dao.insert("petition.insertPetCmt", dto);
    }
  
    @Override
    public int petCmtCount(int petitionNum) throws Exception {
        return dao.selectOne("petition.petCmtCount", petitionNum);
    }
    
    @Override
    public List<PetitionDTO> petCmtListAll(int petitionNum) throws Exception {
        return dao.selectList("petition.petCmtListAll", petitionNum);
    }
  
    @Override
    public List<PetitionDTO> petCmtList(int petitionNum, int start, int end) throws Exception {
        Map map = new HashMap();
        map.put("petitionNum", petitionNum);
        map.put("start", start);
        map.put("end", end);
        List<PetitionDTO> petCmtList = dao.selectList("petition.petCmtList", map);
        return petCmtList;
    }
  
    @Override
    public int updatePetitionCount(int petitionNum) {
        return dao.update("petition.updatePetitionCount", petitionNum);
    }
    
    @Override
    public PetitionIndicatorDTO getPetitionIndicator(int num) throws Exception {
        return dao.selectOne("petition.getPetitionIndicator", num);
    }
    
    
   
   
    @Override
    public PetitionerDTO getPetitionerById(String writer) {
     
      return dao.selectOne("petition.getPetitionerById", writer);
    }

    @Override
    public String getPetitionState(int petitionState) {
     
      return dao.selectOne("petition.getPetitionState", petitionState);
    }


    @Override
    public String getCategoryName(int categoryNum) throws Exception {

      return dao.selectOne("petition.getCategoryName",categoryNum);
    }
   
    @Override
    public void updateIndicator(int num, String gender, int age) {
        Map<String, Object> map = new HashMap<>();
        map.put("petitionNum", num);
        map.put("gender", "남".equals(gender));
        map.put("age", age);
        dao.update("petition.updateIndicator", map);
    }
   
    @Override
    public void updatePetitionState(int petitionNum) {
        Map<String, Object> map = new HashMap<>();
        map.put("petitionNum", petitionNum);
        dao.update("petition.updatePetitionState",petitionNum);
    }

    @Override
    public void deletePetition(int petitionNum) throws Exception {
        dao.delete("petition.deletePetition",petitionNum);
    }

    @Override
    public void insertAnswerDTO(PetitionDTO petitionDTO) {
        dao.insert("petition.insertAnswerDTO",petitionDTO);
      
    }

}
