package projectB.model.petitionContentService;

public interface PetitionPetitionerMapService {
    
  public boolean isAgreed(int petitionNum,String petitionerId);

  public int insertMap(int petitionNum, String writer);
}
