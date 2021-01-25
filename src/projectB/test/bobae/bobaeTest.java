package projectB.test.bobae;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class bobaeTest {
	
	@RequestMapping("petitionMain.aa")
	public String petitionMain() {
		return "test/PetitionMain";
	}

}
