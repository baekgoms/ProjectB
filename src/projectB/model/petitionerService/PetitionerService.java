package projectB.model.petitionerService;

import projectB.model.petitioner.PetitionerDTO;

public interface PetitionerService {
	public static final int NOT_AUTH_STATE = 99;
	
	void insertPetitioner(PetitionerDTO dto);
	int confirmId(String id);
	int confirmAuthKey(PetitionerDTO dto);
	PetitionerDTO getPetitionerByEmailAndAuthKey(String email, String authKey);
	void updatePetitionerState(String id);
}
