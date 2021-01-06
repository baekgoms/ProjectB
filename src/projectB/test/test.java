package projectB.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("myTest")
public class test {
	
	@RequestMapping("testing.aa")
	public String testing() {
		System.out.println("test run");
		return "test/Test";
	}
		
	@RequestMapping("n1.aa")
	public String num01() {
		System.out.println("test run");
		return "test/n1";
	}
}
