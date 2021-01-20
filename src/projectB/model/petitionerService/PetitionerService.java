package projectB.model.petitionerService;

import java.sql.SQLException;

import projectB.model.petitioner.PetitionerDTO;

public interface PetitionerService {
	public static final int NOT_AUTH_STATE = 99;
	
	int confirmId(String id)  throws SQLException;
	int confirmAuthKey(PetitionerDTO dto)  throws SQLException;
	PetitionerDTO getPetitionerByEmailAndAuthKey(String email, int authKey)  throws SQLException;
	void insertPetitioner(PetitionerDTO dto) throws SQLException;
	void updatePetitionerState(String id)  throws SQLException;

}
