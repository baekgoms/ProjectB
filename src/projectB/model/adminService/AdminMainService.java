package projectB.model.adminService;

import java.util.List;

import projectB.model.answer.AnswerDTO;
import projectB.model.petition.DiscussionDTO;
import projectB.model.petition.PetitionDTO;

public interface AdminMainService {
	
	//==========새로운 회원===============
	public int getCountPetitionerToday( ) throws Exception;
	public double getPercentPetitionerToday( ) throws Exception;
	
	//==========새로운 문의===============
	public int getCountQuestionToday( ) throws Exception;
	public double getPercentQuestionToday( ) throws Exception;
	
	//==========새로운 청원===============
	public int getCountPetitionToday( ) throws Exception;
	public double getPercentPetitionToday( ) throws Exception;
	
	//==========새로운 토론===============
	public int getCountDiscussionToday( ) throws Exception;
	public double getPercentDiscussionToday( ) throws Exception;
	
	//==========인기 청원===============
	public List<PetitionDTO> getTopPetition( ) throws Exception;
	public int getRestDay() throws Exception;
	
	//==========최다 청원 분야===============
	public String getBestCategory( ) throws Exception;
	
	//==========인기 토론===============
	public List<DiscussionDTO> getTopDiscussion( ) throws Exception;
	
	//==========이슈 답변===============
	public List<AnswerDTO> getTopAnswer() throws Exception;
	
}
