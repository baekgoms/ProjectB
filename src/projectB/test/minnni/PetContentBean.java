package projectB.test.minnni;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import projectB.model.petition.PetitionDTO;

@Controller
@RequestMapping("/petition/")
public class PetContentBean {
	@Autowired
	private PetitionService petitionContentService = null;
	
	@RequestMapping("petContent.aa")
	public String petContent(int num, Model model) throws Exception{
		PetitionDTO petDTO = petitionContentService.getArticle(num);
		model.addAttribute("petDTO",petDTO);
		return "board/petitionContent";
	}

	
	@RequestMapping("pettest.aa")
	public String hello() {
		System.out.println("PetCohjhntenbean run");
		return "board/petitionContent";

	}
	
}