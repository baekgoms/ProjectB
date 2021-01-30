package projectB.model.petitionerService;

import java.sql.SQLException;
import java.util.List;

import projectB.model.petitioner.PetitionerDTO;

public interface PetitionerService {
	public static final int NOT_AUTH_STATE = 99;
	
	int confirmId(String id)  throws SQLException;
	int confirmAuthKey(PetitionerDTO dto)  throws SQLException;
	PetitionerDTO getPetitionerByEmailAndAuthKey(String email, int authKey)  throws SQLException;
	void insertPetitioner(PetitionerDTO dto) throws SQLException;
	void updatePetitionerState(String id)  throws SQLException;
	
	public List<PetitionerDTO> petitioners(int startRow, int endRow, int sort);
	public int totalMemberCount();
	public void deletepetitioner(int num);
	
	public int totalBlackListCount(int sort);
	public List<PetitionerDTO> blackList(int startRow, int endRow, int sort);
	public void selectRelease(int num);

}
