package projectB.test.baek;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("beakTest")
public class baekTest {
	@RequestMapping("inputEmail.aa")
	public String test() {
		System.out.println("inputEmail run");
		
		return "test/baek_test/inputEmail";
	}
	
	@RequestMapping("inputAuthEmail.aa")
	public String test2() {
		System.out.println("inputAuthEmail run");
		
		return "test/baek_test/inputAuthEmail";
	}
	
	@RequestMapping("signUp.aa")
	public String test3() {
		System.out.println("signUp run");
		
		return "test/baek_test/signUp";
	}
	
	@RequestMapping("confirmId.aa")
	public @ResponseBody String confirmId2(Model model) throws Exception
	{
		System.out.println("confirmId run");
		int check = 12;
		
		return check + "";
	}
}
