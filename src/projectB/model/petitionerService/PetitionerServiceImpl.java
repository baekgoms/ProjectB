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
		connection.insert("petitioner.insertPetitioner", dto);
	}
	
	@Override
	public int confirmId(String id) {
		return connection.selectOne("petitioner.confirmId", id);
	}
}
