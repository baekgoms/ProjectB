package projectB.model.admin;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import projectB.model.adminService.AdminMainService;
import projectB.model.answer.AnswerDTO;
import projectB.model.petition.DiscussionDTO;
import projectB.model.petition.PetitionDTO;


@Controller
@RequestMapping("admin")
public class AdminMainController {
	
	@Autowired
	private SqlSessionTemplate dao = null;
	
	@Autowired
    private AdminMainService DAO = null;
	
	@RequestMapping("main.aa")
	public String main(Model model) throws Exception {
		
		Date time = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy");
		int year = Integer.parseInt(format1.format(time));
		
		//새로운 회원
		int todayPetitioner = DAO.getCountPetitionerToday();
		model.addAttribute("todayPetitioner", todayPetitioner);
		//새로운 회원 퍼센트
		double todayPercent = DAO.getPercentPetitionerToday();
		System.out.println("todayPercent : "+todayPercent);
		model.addAttribute("todayPercent", todayPercent);
		
		//새로운 회원
		
		int todayQuestion = DAO.getCountQuestionToday();
		model.addAttribute("todayQuestion", todayQuestion);
		//새로운 회원 퍼센트
		double todayQuestionPercent = DAO.getPercentQuestionToday();
		System.out.println("todayQuestionPercent : "+todayQuestionPercent);
		model.addAttribute("todayQuestionPercent", todayQuestionPercent);		
		
		//인기 청원
		List<PetitionDTO> topPetition = DAO.getTopPetition();
		System.out.println("topPetition : "+topPetition);
		model.addAttribute("topPetition", topPetition);
		
		//인기 청원 퍼센트
		if(topPetition.size() != 0) {
			int petition = (int)topPetition.get(0).getPetition();
			System.out.println("petition : "+petition);
			double petitioPercent = petition / (200000 / 100); 
			System.out.println("petitioPercent : "+petitioPercent);
			petitioPercent = Math.round(petitioPercent); 
			model.addAttribute("petitioPercent", petitioPercent);
		}	
		//최다 청원 분야
		String bestCategory = DAO.getBestCategory();
		model.addAttribute("bestCategory", bestCategory);
		
		//누적 청원
		int totalPetition = dao.selectOne("adminMain.getCountTotalPetition");
		model.addAttribute("totalPetition", totalPetition);
		
		//진행중인 청원
		int ongoingPetition = dao.selectOne("adminMain.getCountOngoingPetition");
		model.addAttribute("ongoingPetition", ongoingPetition);
		
		//진행중인 청원
		int WaitingAnswerPetition = dao.selectOne("adminMain.getCountWaitingAnswerPetition");
		model.addAttribute("WaitingAnswerPetition", WaitingAnswerPetition);
		
		//누적 회원
		int TotalPetitioner = dao.selectOne("adminMain.getCountTotalPetitioner");
		model.addAttribute("TotalPetitioner", TotalPetitioner);
		
		//신규 블랙리스트
		int newBlacklist = dao.selectOne("adminMain.getNewBlacklist");
		model.addAttribute("newBlacklist", newBlacklist);
		
		//인기 토론
		List<DiscussionDTO> topDiscussion = DAO.getTopDiscussion();
		System.out.println("topDiscussion : "+topDiscussion);
		model.addAttribute("topDiscussion", topDiscussion);
		int agree = (int)topDiscussion.get(0).getAgreement();
		int oppo = (int)topDiscussion.get(0).getOpposition();
		double dOnePer = (agree + oppo) / 100.0;
		double agreePer = agree / dOnePer;
		double oppoPer = oppo / dOnePer;
		model.addAttribute("agreePer", agreePer);
		model.addAttribute("oppoPer", oppoPer);
		
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
		
		//요약 그래프
		int thisYearPetitionCount = dao.selectOne("adminMain.getCountPetition",Integer.toString(year));
		int beforeYearPetitionCount = dao.selectOne("adminMain.getCountPetition",Integer.toString(year-1));
		int beforeTwoYearPetitionCount = dao.selectOne("adminMain.getCountPetition",Integer.toString(year-2));
		int thisYearPetitionerCount = dao.selectOne("adminMain.getCountPetitioner",Integer.toString(year));
		int beforeYearPetitionerCount = dao.selectOne("adminMain.getCountPetitioner",Integer.toString(year-1));
		int beforeTwoYearPetitionerCount = dao.selectOne("adminMain.getCountPetitioner",Integer.toString(year-2));
		model.addAttribute("thisYearPetitionCount", thisYearPetitionCount);
		model.addAttribute("beforeYearPetitionCount", beforeYearPetitionCount);
		model.addAttribute("beforeTwoYearPetitionCount", beforeTwoYearPetitionCount);
		model.addAttribute("thisYearPetitionerCount", thisYearPetitionerCount);
		model.addAttribute("beforeYearPetitionerCount", beforeYearPetitionerCount);
		model.addAttribute("beforeTwoYearPetitionerCount", beforeTwoYearPetitionerCount);
		
		
		//이슈 답변
		List<AnswerDTO> topAnswer = DAO.getTopAnswer();
		int recommend = topAnswer.get(0).getRecommend();
		int opposite = topAnswer.get(0).getOpposite();
		int addition = topAnswer.get(0).getAddition();
		int total = recommend + opposite + addition;
		double onePer = total / 100.0;
		double recommendPer = recommend / onePer;
		double oppositePer = opposite / onePer;
		double additionPer = addition / onePer;
		recommendPer = Math.round(recommendPer); 
		oppositePer = Math.round(oppositePer);
		additionPer = Math.round(additionPer);
		model.addAttribute("recommendPer", recommendPer);
		model.addAttribute("oppositePer", oppositePer);
		model.addAttribute("additionPer", additionPer);
		model.addAttribute("topAnswer", topAnswer);
		
		System.out.println("admin main controller");
		System.out.println(todayPetitioner);
		
		return "main/AdminMain";
	}
	
}

