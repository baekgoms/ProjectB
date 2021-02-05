package projectB.model.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import projectB.model.PageUtils;
import projectB.model.login.LoginController;
import projectB.model.login.LoginUtils;
import projectB.model.petitioner.PetitionerDTO;
import projectB.model.petitionerService.PetitionerService;

import static projectB.model.admin.AdminPetitionerController.MEMBER_LENGTH;
import static projectB.model.admin.AdminPetitionerController.MEMBER_PAGE_LENGTH;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("admin")
public class AdminAnswerController {

	@Autowired
	private PetitionerService petitionerService;

	@RequestMapping("answers.aa")
	public String main(@RequestParam(defaultValue = "1", required = true) int pageNum, Model model) {

		int totalCount = petitionerService.totalMemberCount(LoginUtils.ANSWER);

		//Map<String, Integer> pageInfos = PageUtils.pageInfos(MEMBER_LENGTH, MEMBER_PAGE_LENGTH, totalCount, pageNum);
		int startRow = PageUtils.startPage(MEMBER_LENGTH, MEMBER_PAGE_LENGTH, pageNum);
		int endRow = PageUtils.endRow(MEMBER_LENGTH, pageNum);
		List<PetitionerDTO> answers = petitionerService.petitionersByState(startRow, endRow, LoginUtils.ANSWER);
		
		model.addAttribute("petitioners", answers);
		model.addAttribute("petitionerCount", answers.size());

		int startPage = PageUtils.startPage(MEMBER_LENGTH, MEMBER_PAGE_LENGTH, pageNum);
		int pageTotalCount = PageUtils.pageTotalCount(MEMBER_LENGTH, totalCount);
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pageTotalCount", pageTotalCount);
		model.addAttribute("startPageIndex", startPage);
		model.addAttribute("endPageIndex", PageUtils.endPage(startPage, MEMBER_PAGE_LENGTH, pageTotalCount));
//		model.addAttribute("pageTotalCount", pageInfos.get("pageTotalCount"));
//		model.addAttribute("startPageIndex", pageInfos.get("startPageIndex"));
//		model.addAttribute("endPageIndex", pageInfos.get("endPageIndex"));

		return "adminPetitioner/answer";
	}
	
	@RequestMapping("signUp.aa")
	public String signUp() {
		return "adminPetitioner/signUp";
	}
	
	@RequestMapping("insertAnswer.aa")
	public String insertAnswer(PetitionerDTO dto) {
		try {
			dto.setGender("no");
			dto.setBirthday("999999");
			dto.setState(LoginUtils.ANSWER);
			petitionerService.insertPetitioner(dto);	
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return "adminPetitioner/answerInsert";
	}
	
	@RequestMapping(value = "selectAnswerDel.aa", method = RequestMethod.POST)
	public String selectDel(String selects) {
		System.out.println("selectDel run");
		if (selects != null) {
			List<String> memberNums = new ArrayList<>(Arrays.asList(selects.split(",")));
			try {
				for (String s : memberNums) {
					petitionerService.deletepetitioner(Integer.parseInt(s));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return "redirect:answers.aa";
	}
}
