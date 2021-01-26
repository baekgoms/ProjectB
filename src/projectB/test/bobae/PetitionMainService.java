package projectB.test.bobae;

import java.util.List;

import projectB.model.petition.PetitionDTO;

public interface PetitionMainService {

	public List<PetitionDTO> getArtilclebyState(int state) throws Exception;
	public List<PetitionDTO> getArtilclebyEnddate() throws Exception;
	
}
