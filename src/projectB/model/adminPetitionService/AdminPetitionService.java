package projectB.model.adminPetitionService;

import projectB.model.petition.PetitionDTO;

public interface AdminPetitionService {
    public PetitionDTO getArticle(int num) throws Exception;
    public String getCategoryName(int categoryNum) throws Exception;
    public String getPetitionState(int petitionState)throws Exception;
    
    public void updateArticle(PetitionDTO petitionDTO) throws Exception;
    public void updateOpen(int num) throws Exception;
    public void updateClose(int num) throws Exception;
    
}
