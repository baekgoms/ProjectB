package projectB.model.petition;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import projectB.model.PetitionMainService.PetitionMainService;
import projectB.model.login.LoginUtils;
import projectB.model.petitionListService.PetitionListService;

@Controller
@RequestMapping("petition")
public class PetitionMianController {
	
	@Autowired
    private PetitionListService petitionDAO = null;
	
	@Autowired
	private PetitionMainService MainDAO = null;

	@RequestMapping("petitionMain.aa")
	public String petitionMain(HttpSession session, Model model) throws Exception{
		
			String id = LoginUtils.getLoginID(session);
		
		 	int count = 0;
	        int state= 3;
	        
	        
	        List<PetitionDTO> articleList = null;
	        count = petitionDAO.getArticleCountbyState(state);
	        if(count > 0) {
	            articleList = MainDAO.getArtilclebyState(state);
	        } else {
	            articleList = Collections.emptyList();
	        }
	        System.out.println(count + "//count");
	        System.out.println(state + "//state");
	        System.out.println(id + "//id");
	        
	        List<PetitionDTO> enddateList = null;
	        enddateList = MainDAO.getArtilclebyEnddate();
	        
	        List<PetitionDTO> petitionList = null;
	        petitionList = MainDAO.getArtilclebyPetition();
		
	        List<PetitionDTO> tagList = null;
	        tagList = MainDAO.getTagCount();
		
	        model.addAttribute("state",state);
	        model.addAttribute("count", new Integer(count));
	        model.addAttribute("memId",id);
	        model.addAttribute("articleList", articleList);
	        model.addAttribute("enddateList",enddateList);
	        model.addAttribute("petitionList",petitionList);
	        model.addAttribute("tagList",tagList);
		return "petition/PetitionMain";
	}
}