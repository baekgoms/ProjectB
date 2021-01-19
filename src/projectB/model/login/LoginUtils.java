package projectB.model.login;

import javax.servlet.http.HttpSession;
import projectB.model.petitioner.PetitionerDTO;

public class LoginUtils {
	public static void setLogin(HttpSession session, PetitionerDTO dto, int loginReulst) {
		if(dto == null || dto.getId() == null || loginReulst > 0) {
			new IllegalAccessException("로그인 정보가 없습니다");			
		}

		session.setAttribute("memId", dto.getId());
	}
	
	public static boolean isLogin(HttpSession session) {
		return session.getAttribute("memId") != null;
	}
	
	public static String getLoginID(HttpSession session) {
		return (String)session.getAttribute("memId");
	}
	
	public static void logout(HttpSession session) {
		session.invalidate();
	}
}
