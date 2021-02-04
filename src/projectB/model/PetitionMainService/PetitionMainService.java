package projectB.model.PetitionMainService;

import java.util.List;

import projectB.model.petition.PetitionDTO;

public interface PetitionMainService {

	public List<PetitionDTO> getArtilclebyState(int state) throws Exception;
	public List<PetitionDTO> getArtilclebyEnddate() throws Exception;
	public List<PetitionDTO> getArtilclebyPetition() throws Exception;
	public List<PetitionDTO> getTagCount() throws Exception;
}