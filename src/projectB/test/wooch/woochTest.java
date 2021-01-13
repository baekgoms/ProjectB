package projectB.test.wooch;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("wooch")
public class woochTest {
	
	@RequestMapping("test.aa")
	public String board() {
		System.out.println("wooch test");
		return "test/woochTest";
	}
}

