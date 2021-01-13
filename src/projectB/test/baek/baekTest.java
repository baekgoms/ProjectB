package projectB.test.baek;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
