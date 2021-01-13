package projectB.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("myTest")
public class test {
	
	@RequestMapping("testing.aa")
	public String testing() {

		System.out.println("test run~~~!");

		return "test/Test";
	}
		
	@RequestMapping("nana1.aa")
	public String num01() {
		System.out.println("test run");
		return "test/n1";
	}
	@RequestMapping("nana2.aa")
	public String num02() {
		System.out.println("test run");
		return "test/n2";
	}

}
