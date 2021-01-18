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

	@Autowired
	private LoginService loginSerivce;

	@RequestMapping("loginForm")
	public String loginForm() {
		System.out.println("loginForm run");
		return "login/loginForm";
	}

	@RequestMapping("loginPro")
	public String loginPro(PetitionerDTO dto, HttpSession session, Model model) {
		System.out.println("loginPro run");

		// DB에서 체크
		int loginReulst = loginSerivce.checkLogin(dto);
		
		LoginUtils.setLogin(session, dto, loginReulst);
		
		return "redirect:loginForm.aa";
	}
}
