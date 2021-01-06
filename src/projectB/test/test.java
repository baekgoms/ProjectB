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
}
