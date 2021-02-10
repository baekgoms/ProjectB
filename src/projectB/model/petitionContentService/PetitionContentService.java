package projectB.model.petitionContentService;

import java.sql.Timestamp;
import java.util.List;
import projectB.model.petition.CategoryDTO;
import projectB.model.petition.PetCommentDTO;
import projectB.model.petition.PetitionDTO;
import projectB.model.petition.PetitionIndicatorDTO;
import projectB.model.petitioner.PetitionerDTO;

public interface PetitionContentService {
    public PetitionDTO getArticle(int num) throws Exception;
    public String getCategoryName(int categoryNum) throws Exception;
    
    
    public void insertPetCmt(PetCommentDTO dto) throws Exception;
    public int petCmtCount(int petitionNum) throws Exception;
    public List<PetitionDTO> petCmtListAll(int petitionNum) throws Exception;
    public List<PetitionDTO> petCmtList(int petitionNum, int start, int end) throws Exception;
    
    public int updatePetitionCount(int petitionNum)throws Exception;
    public PetitionIndicatorDTO getPetitionIndicator(int num) throws Exception;
    public void updateIndicator(int num, String gender, int age);

    public PetitionerDTO getPetitionerById(String writer)throws Exception;

    public String getPetitionState(int petitionState)throws Exception;
    public void updatePetitionState(int petitionNum)throws Exception;
    public void deletePetition(int petitionNum)throws Exception;
    
    public void insertAnswerDTO(PetitionDTO petitionDTO);
    
}
