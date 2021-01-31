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
	PetitionerDTO petitionerByNum(int num)  throws SQLException;
	
	List<PetitionerDTO> petitioners(int startRow, int endRow, int sort);
	int totalMemberCount();
	void deletepetitioner(int num);
	
	int totalBlackListCount(int sort);
	List<PetitionerDTO> blackList(int startRow, int endRow, int sort);
	void selectRelease(int num);
	
	void updatePetitioner(PetitionerDTO dto) throws SQLException;

}
