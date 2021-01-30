package projectB.model.adminService;

import java.util.List;

import projectB.model.petition.PetitionDTO;

public interface AdminMainService {
	
	//==========1번 라인===============
	public int getCountPetitionerToday( ) throws Exception;
	public double getPercentPetitionerToday( ) throws Exception;
	
	//==========2번 라인===============
	public List<PetitionDTO> getTopPetition( ) throws Exception;
	public int getPercentTopPetition( ) throws Exception;

}
