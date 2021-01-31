package projectB.model.admin;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import projectB.model.adminService.AdminMainService;
import projectB.model.petition.DiscussionDTO;
import projectB.model.petition.PetitionDTO;


@Controller
@RequestMapping("admin")
public class AdminMainController {
	
	@Autowired
    private AdminMainService DAO = null;
	
	@RequestMapping("main.aa")
	public String main(Model model) throws Exception {
		
		Date time = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMM");
		
		//새로운 회원
		int todayPetitioner = DAO.getCountPetitionerToday();
		model.addAttribute("todayPetitioner", todayPetitioner);
		//새로운 회원 퍼센트
		double todayPercent = DAO.getPercentPetitionerToday();
		System.out.println("todayPercent : "+todayPercent);
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
		
		//인기 토론
		List<DiscussionDTO> topDiscussion = DAO.getTopDiscussion();
		System.out.println("topDiscussion : "+topDiscussion);
		model.addAttribute("topDiscussion", topDiscussion);
		
		//새로운 청원
		int todayPetition = DAO.getCountPetitionToday();
		model.addAttribute("todayPetition", todayPetition);
		//새로운 회원 퍼센트
		double todayPetitionPercent = DAO.getPercentPetitionToday();
		System.out.println("todayPetitionPercent : "+todayPetitionPercent);
		model.addAttribute("todayPetitionPercent", todayPetitionPercent);
		
		//새로운 토론
		int todayDiscussion = DAO.getCountDiscussionToday();
		model.addAttribute("todayDiscussion", todayDiscussion);
		//새로운 회원 퍼센트
		double todayDiscussionPercent = DAO.getPercentDiscussionToday();
		System.out.println("todayDiscussionPercent : "+todayDiscussionPercent);
		model.addAttribute("todayDiscussionPercent", todayDiscussionPercent);
		
		//마감 남은 일 수
		int restDay = DAO.getRestDay();
		model.addAttribute("restDay",restDay);
		
		System.out.println("admin main controller");
		System.out.println(todayPetitioner);
		
		return "wooch/AdminMain";
	}
	
}

