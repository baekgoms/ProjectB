package projectB.model.petitionContentService;

public interface PetitionPetitionerMapService {
    
  public boolean isAgreed(int petitionNum,String writer);

  public int insertMap(int petitionNum, String writer);
}
