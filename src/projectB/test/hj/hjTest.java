package projectB.test.hj;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("hj")
public class hjTest {
	
	@RequestMapping("main.aa")
	public String board() {
		return "abc/main";
	}
	
	@RequestMapping("login.aa")
	public String testing() {
		return "abc/login";
	}
}
