package projectB.model.adminPetitionService;

import java.sql.Timestamp;
import java.util.List;
import projectB.model.petition.CategoryDTO;
import projectB.model.petition.PetCommentDTO;
import projectB.model.petition.PetitionDTO;
import projectB.model.petition.PetitionIndicatorDTO;
import projectB.model.petitioner.PetitionerDTO;

public interface AdminPetitionService {
    public PetitionDTO getArticle(int num) throws Exception;
    public String getCategoryName(int categoryNum) throws Exception;
    public String getPetitionState(int petitionState)throws Exception;
    
    public void updateArticle(PetitionDTO petitionDTO) throws Exception;
    public void updateOpen(int num) throws Exception;
    public void updateClose(int num) throws Exception;
    
}
