package projectB.model.petitionerService;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

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
	public PetitionerDTO getPetitionerByEmailAndAuthKey(String email, int authKey) {
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("email", email);
		dataMap.put("authKey", authKey + "");
		
		return connection.selectOne("petitioner.getPetitionerByEmailAndAuthKey", dataMap);
	}
	
	@Override
	public void updatePetitionerState(String id) {
		//System.out.println("updatePetitionerState id - " + id);
		connection.update("petitioner.updatePetitionerState", id);
	}
	
	@Override
	public List<PetitionerDTO> petitioners(int startRow, int endRow, int sort) {
		HashMap<String, Integer> dataMap = new HashMap<>();
		dataMap.put("startRow", startRow);
		dataMap.put("endRow", endRow);
		dataMap.put("sort", sort);
		
		return connection.selectList("petitioner.petitioners", dataMap);
	}
	
	public List<PetitionerDTO> petitionersByState(int startRow, int endRow, int state){
		HashMap<String, Integer> dataMap = new HashMap<>();
		dataMap.put("startRow", startRow);
		dataMap.put("endRow", endRow);
		dataMap.put("state", state);
		
		return connection.selectList("petitioner.petitionersByState", dataMap);
	}
	
	@Override
	public int totalMemberCount() {
		return connection.selectOne("petitioner.totalMemberCount");
	}
	
	@Override
	public int totalMemberCount(int state) {
		return connection.selectOne("petitioner.totalMemberCountByState", state);
	}
	
	@Override
	public void deletepetitioner(int num) {
		connection.delete("petitioner.deletePetitioner", num);
	}
	
	@Override
	public int totalBlackListCount(int sort) {
		return connection.selectOne("petitioner.totalBlackListCount", sort);
	}
	
	@Override
	public List<PetitionerDTO> blackList(int startRow, int endRow, int sort) {
		HashMap<String, Integer> dataMap = new HashMap<>();
		dataMap.put("startRow", startRow);
		dataMap.put("endRow", endRow);
		dataMap.put("sort", sort);
		
		return connection.selectList("petitioner.blackList", dataMap);
	}
	
	@Override
	public void selectRelease(int num) {
		connection.update("petitioner.release", num);
	}
	
	@Override
	public PetitionerDTO petitionerByNum(int num)  throws SQLException {
		return connection.selectOne("petitioner.petitionerByNum", num);
	}
	
	@Override
	public void updatePetitioner(PetitionerDTO dto) throws SQLException {
		connection.update("petitioner.memberModify", dto);
	}
}
