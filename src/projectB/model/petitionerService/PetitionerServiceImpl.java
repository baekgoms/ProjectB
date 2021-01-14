package projectB.model.petitionerService;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import projectB.model.petitioner.PetitionerDTO;

@Service("petitionerService")
public class PetitionerServiceImpl implements PetitionerService {
	
	@Autowired
	private SqlSessionTemplate connection;
	
	@Override
	public void insertPetitioner(PetitionerDTO dto) {
		//정보 추가
		connection.insert("petitioner.insertPetitioner", dto);
	}
}
