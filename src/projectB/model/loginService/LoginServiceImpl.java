package projectB.model.loginService;

import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import projectB.model.petitioner.PetitionerDTO;

@Service("loginSerivce")
public class LoginServiceImpl implements LoginService {
	@Autowired
	private SqlSessionTemplate dao = null;

	public int checkLogin(PetitionerDTO dto) {
		int result = 0;
		try {
			result = dao.selectOne("login.login", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public PetitionerDTO getPetitioner(PetitionerDTO dto) {
		return dao.selectOne("login.loginInfo", dto);
	}

}
