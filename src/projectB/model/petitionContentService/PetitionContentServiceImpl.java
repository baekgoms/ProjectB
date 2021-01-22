package projectB.model.petitionContentService;

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
   public void updateIndicator(int num, String gender, int age) {
       Map<String, Object> map = new HashMap<>();
       map.put("petitionNum", num);
       map.put("gender", "남자".equals(gender));
       map.put("age", age);
       dao.update("petition.updateIndicator", map);
    }
   
   @Override
   public PetitionerDTO getPetitionerById(String writerId) {
     
     return dao.selectOne("petitioner.getPetitionerById", writerId);
   }

   @Override
   public String getPetitionState(int petitionState) {
     
     return dao.selectOne("petition.getPetitionState", petitionState);
   }
    
  @Override
  public List<CategoryDTO> getCategoryList() throws Exception {
    return dao.selectList("petition.getCategoryList");
  }

}
