package projectB.test.bobae;

import java.util.List;

import projectB.model.answer.AnswerDTO;
import projectB.model.petition.PetitionDTO;

public interface CompletedAnswerListService {
	
	public List<AnswerDTO> getAnswerListbyState (int state, int startRow, int endRow) throws Exception;
	public int completedAnswerCount(int state) throws Exception;
	public PetitionDTO getInfobyNum(int num) throws Exception;
	
}
