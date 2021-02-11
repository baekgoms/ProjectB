package projectB.model.petitionContentService;

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
  public void insertPetitionPetitionerMap(PetitionPetitionerMapDTO petitionPetitionerMapDTO) {
    dao.insert("petition.insertPetitionPetitionerMap", petitionPetitionerMapDTO);;
  }

  @Override
  public void agreePetition(PetitionPetitionerMapDTO petitionPetitionerMapDTO) throws Exception {
    dao.update("petition.agreePetition", petitionPetitionerMapDTO);
  }

  @Override
  public PetitionPetitionerMapDTO getPetitionPetitionerMap(
      PetitionPetitionerMapDTO petitionPetitionerMapDTO) throws Exception {
    return dao.selectOne("petition.getPetitionPetitionerMap", petitionPetitionerMapDTO);
  }

  
  
}
