package projectB.test.bobae;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import projectB.model.petition.PetitionDTO;

@Service("PetitionMainService")
public class PetitionMainImpl implements PetitionMainService{
	
	@Autowired
	private SqlSessionTemplate dao = null;

	@Override
	public List<PetitionDTO> getArtilclebyState(int state) throws Exception {
		Map map = new HashMap();
		map.put("state", state);
	
		List<PetitionDTO> stateList = dao.selectList("petition.getStateMain", map);
		return stateList;
	}

	@Override
	public List<PetitionDTO> getArtilclebyEnddate() throws Exception {
		List<PetitionDTO> enddateList = dao.selectList("petition.MainbyEnddate");
		return enddateList;
	}

	@Override
	public List<PetitionDTO> getArtilclebyPetition() throws Exception {
		List<PetitionDTO> petitionList = dao.selectList("petition.MainbyPetition");
		return petitionList;
	}

	@Override
	public List<PetitionDTO> getTagCount() throws Exception {
		List<PetitionDTO> tagList = dao.selectList("petition.tagCount");
		return tagList;
	}

}
