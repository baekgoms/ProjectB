package projectB.test.minnni;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import projectB.model.petition.PetitionDTO;

@Service("petitionDAO")
public class PetContentServiceImpl implements PetitionService{

	@Autowired
	private SqlSessionTemplate dao = null;

	@Override
	public PetitionDTO getArticle(int num) throws Exception {

		return dao.selectOne("petition.getArticle",num);
	}

	@Override
	public void insertCmt(PetCommentDTO dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

}