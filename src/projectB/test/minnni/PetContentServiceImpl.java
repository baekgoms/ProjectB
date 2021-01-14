package projectB.test.minnni;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import projectB.model.petition.PetitionDTO;

@Service("petitionContentService")
public class PetContentServiceImpl implements PetitionService{

	@Autowired
	private SqlSessionTemplate dao = null;

	@Override
	public PetitionDTO getArticle(int num) throws Exception {

		return dao.selectOne("petition.getArticle",num);
	}

	@Override
	public void insertCmt(PetCommentDTO dto) throws Exception {
		dao.insert("petition.insertCmt",dto);
	}

	@Override
	public List petCmtList(int petitionNum) throws Exception {
		return dao.selectList("petition.petCmtList",petitionNum);
	}
	
	@Override
	public int petCmtCount() throws Exception {
		return dao.selectOne("petition.petCmtCount");
	}

}