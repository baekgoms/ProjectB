package projectB.model.login;

import javax.servlet.http.HttpSession;
import projectB.model.petitioner.PetitionerDTO;

public class LoginUtils {
	public static final int PETITIONER = 1;
	public static final int ANSWER = 6;
	public static final int ADMIN = 7;
	
	public static void setLogin(HttpSession session, PetitionerDTO dto, int loginReulst) {
		if(dto == null || dto.getId() == null || loginReulst > 0) {
			new IllegalAccessException("로그인 정보가 없습니다");			
		}

		session.setAttribute("memId", dto.getId());
		session.setAttribute("memState", dto.getState());
	}
	
	public static boolean isLogin(HttpSession session) {
		if(session == null) {
			return false;
		}
		return session.getAttribute("memId") != null;
	}
	
	public static boolean isLogin(HttpSession session, int type) {
		if(session == null) {
			return false;
		}
		int state = 0;
		if(session.getAttribute("memState") != null) {
			state = (int)session.getAttribute("memState");	
		}
		String id = (String)session.getAttribute("memId");
		return (state == type) && (id != null);
	}
	
	public static boolean isAdmin(HttpSession session) {
		if(session == null) {
			return false;
		}		
		
		int state = 0;
		if(session.getAttribute("memState") != null) {
			state = (int)session.getAttribute("memState");	
		}
		String id = (String)session.getAttribute("memId");
		return (state == ADMIN) && (id != null);
	}
	
	public static boolean isAnswer(HttpSession session) {
		if(session == null) {
			return false;
		}		
		
		int state = 0;
		if(session.getAttribute("memState") != null) {
			state = (int)session.getAttribute("memState");	
		}
		String id = (String)session.getAttribute("memId");
		return (state == ANSWER) && (id != null);
	}
	
	public static String getLoginID(HttpSession session) {
		return (String)session.getAttribute("memId");
	}
	
	public static void logout(HttpSession session) {
		session.invalidate();
	}
}
