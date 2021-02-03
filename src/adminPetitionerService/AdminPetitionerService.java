package adminPetitionerService;

import java.util.List;

import projectB.model.petitioner.PetitionerDTO;

public interface AdminPetitionerService {
	List<PetitionerDTO> getPetitioners(int startRow, int endRow, int sort);
}
