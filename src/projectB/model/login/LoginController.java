package projectB.model.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import projectB.model.loginService.LoginService;
import projectB.model.petitioner.PetitionerDTO;

@Controller
@RequestMapping("login")
public class LoginController {

	private static final int PETITIONER = 1;
	private static final int ANSWER = 6;
	private static final int ADMIN = 7;
	@Autowired
	private LoginService loginSerivce;

	@RequestMapping("loginForm.aa")
	public String loginForm() {
		System.out.println("loginForm run");
		return "login/loginForm";
	}

	@RequestMapping("loginPro.aa")
	public String loginPro(PetitionerDTO dto, HttpSession session, Model model) {
		System.out.println("loginPro run");

		// DB에서 체크
		int loginReulst = loginSerivce.checkLogin(dto);
		
		LoginUtils.setLogin(session, dto, loginReulst);
		
		//현재 회원 상태에 따라 로그인 위치 변경
		//일반 / 답변 / 관리
		String view = "redirect:loginForm.aa";
		if(dto.getState() == PETITIONER) {
			view = "redirect:/petition/afootPetition.aa";
		}
		else if(dto.getState() == ANSWER) {
			view = "redirect:/answer/answerMain.aa";
		}
		else if(dto.getState() == ADMIN) {
			view = "redirect:/petition/afootPetition.aa";
		}
		
		return view;
	}
}
