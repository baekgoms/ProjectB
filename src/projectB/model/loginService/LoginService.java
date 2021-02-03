package projectB.model.loginService;


import projectB.model.petitioner.PetitionerDTO;

public interface LoginService {
	public int checkLogin(PetitionerDTO dto);
	PetitionerDTO getPetitioner(PetitionerDTO dto);
}
