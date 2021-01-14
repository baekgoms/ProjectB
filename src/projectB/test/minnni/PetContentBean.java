package projectB.test.minnni;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/petition/")
public class PetContentBean {
	@Autowired
	private PetitionService petitionDAO = null;
	
	@RequestMapping("petContent.aa")
	public String petContent(int num, Model model) throws Exception{
		PetitionDTO petDTO = petitionDAO.getArticle(num);
		model.addAttribute("petDTO",petDTO);
		return "board/petitionContent";
	}

	
	@RequestMapping("pettest.aa")
	public String hello() {
		System.out.println("PetCohjhntenbean ½ÇÇà");
		return "board/petitionContent";

	}
	
}