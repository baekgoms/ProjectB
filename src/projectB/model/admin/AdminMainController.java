package projectB.model.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import projectB.model.adminService.AdminMainService;
import projectB.model.petition.PetitionDTO;


@Controller
@RequestMapping("admin")
public class AdminMainController {
	
	@Autowired
    private AdminMainService DAO = null;
	
	@RequestMapping("main.aa")
	public String main(Model model) throws Exception {
		
		//새로운 회원
		int todayPetitioner = DAO.getCountPetitionerToday();
		model.addAttribute("todayPetitioner", todayPetitioner);
		
		//새로운 회원 퍼센트
		double todayPercent = DAO.getPercentPetitionerToday();
		model.addAttribute("todayPercent", todayPercent);
		
		//인기 청원
		List<PetitionDTO> topPetition = DAO.getTopPetition();
		System.out.println("topPetition : "+topPetition);
		model.addAttribute("topPetition", topPetition);
		
		//인기 청원 퍼센트
		int petition = (int)topPetition.get(0).getPetition();
		System.out.println("petition : "+petition);
		double petitioPercent = petition / (200000 / 100); 
		System.out.println("petitioPercent : "+petitioPercent);
		petitioPercent = Math.round(petitioPercent); 
		model.addAttribute("petitioPercent", petitioPercent);
		
		System.out.println("admin main controller");
		System.out.println(todayPetitioner);
		
		return "wooch/AdminMain";
	}
	
}

