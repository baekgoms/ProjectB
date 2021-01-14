package projectB.model.petitionService;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import projectB.model.petition.PetitionDTO;


@Service("petitionerDAO")
public class PetitionServiceImpl implements PetitionService{

	@Autowired
	private SqlSessionTemplate dao = null;
	
	@Override
	public void insertPetition(PetitionDTO DTO) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
