package projectB.model.petitionerService;

import java.util.HashMap;

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
	
	@Override
	public int confirmAuthKey(PetitionerDTO dto) {
		return connection.selectOne("petitioner.confirmAuthKey", dto);
	}
	
	@Override
	public PetitionerDTO getPetitionerByEmailAndAuthKey(String email, String authKey) {
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("email", email);
		dataMap.put("authKey", authKey);
		return connection.selectOne("petitioner.getPetitionerByEmailAndAuthKey", dataMap);
	}
	
	@Override
	public void updatePetitionerState(String id) {
		System.out.println("updatePetitionerState id - " + id);
		connection.update("petitioner.updatePetitionerState", id);
	}
}
