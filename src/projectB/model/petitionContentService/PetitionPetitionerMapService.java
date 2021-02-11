package projectB.model.petitionContentService;

import projectB.model.petition.PetitionPetitionerMapDTO;

public interface PetitionPetitionerMapService {

  public void insertPetitionPetitionerMap(PetitionPetitionerMapDTO petitionPetitionerMapDTO);
  
  public void agreePetition(PetitionPetitionerMapDTO petitionPetitionerMapDTO) throws Exception;
  
  public PetitionPetitionerMapDTO getPetitionPetitionerMap(PetitionPetitionerMapDTO petitionPetitionerMapDTO) throws Exception;
}
