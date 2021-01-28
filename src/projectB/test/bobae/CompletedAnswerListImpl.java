package projectB.test.bobae;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import projectB.model.answer.AnswerDTO;
import projectB.model.petition.PetitionDTO;

@Service("CompletedAnswerListService")
public class CompletedAnswerListImpl implements CompletedAnswerListService{

	@Autowired
	private SqlSessionTemplate dao = null;
	
	@Override
	public List<AnswerDTO> getAnswerListbyState(int state, int startRow, int endRow) throws Exception {
		
		Map map = new HashMap();
		map.put("state", state);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<AnswerDTO> comAnswer = dao.selectList("answer.completedAnswer",map);
		return comAnswer;
	}

	@Override
	public int completedAnswerCount(int state) throws Exception {
		
		return dao.selectOne("answer.completedAnswerCount", state);
	}

	@Override
	public PetitionDTO getInfobyNum(int num) throws Exception {
		
		return dao.selectOne("answer.getInfobyNum",num);
	}

}
