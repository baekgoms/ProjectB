package projectB.test.wooch;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("petition")
public class PetitionBean {

	@RequestMapping("upload.aa")
	public String upload() {
		System.out.println("wooch upload controller");
		return "wooch/uploadForm";
	}
	
	
	
	
	
}

