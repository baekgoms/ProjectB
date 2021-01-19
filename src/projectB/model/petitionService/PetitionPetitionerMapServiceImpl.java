package projectB.model.petitionService;

import java.util.HashMap;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import projectB.model.petition.PetitionPetitionerMapDTO;

@Service
public class PetitionPetitionerMapServiceImpl implements PetitionPetitionerMapService{
 
  @Autowired
  private SqlSessionTemplate dao = null;
  
  @Override
  public boolean isAgreed(int petitionNum, String petitionerId) {
    Map<String, Object> map = new HashMap<>();
    map.put("petitionNum", petitionNum);
    map.put("petitionerId", petitionerId);
    PetitionPetitionerMapDTO m = (PetitionPetitionerMapDTO) dao.selectOne("petition.getPetitionPetitionerByPetitionNumPetitionerId", map);
    return (m != null);
  }

  @Override
  public int insertMap(int petitionNum, String writer) {
    Map<String, Object> map = new HashMap<>();
    map.put("petitionNum", petitionNum);
    map.put("petitionerId", writer);
    return dao.insert("petition.insertPetitionPetitionerMap", map);
  }
}
