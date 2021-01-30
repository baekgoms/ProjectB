package projectB.model.admin;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import projectB.model.petitioner.PetitionerDTO;
import projectB.model.petitionerService.PetitionerService;

import static projectB.model.admin.AdminPetitionerController.MEMBER_LENGTH;
import static projectB.model.admin.AdminPetitionerController.MEMBER_PAGE_LENGTH;;

@Controller
@RequestMapping("admin")
public class AdminBlackListController {
	@Autowired
	private PetitionerService petitionerService;
	
	@RequestMapping("petitionerblack.aa")
	public String member(@RequestParam(defaultValue = "1", required = true) int pageNum,
			@RequestParam(defaultValue = "0", required = true) int sort, Model model) {
		System.out.println("petitionerblack run");

		try {
			System.out.println("sort / " + sort);
			int memberTotalCount = petitionerService.totalBlackListCount(sort);
			System.out.println("memberTotalCount / " + memberTotalCount);
			int startRow = (pageNum - 1) * MEMBER_LENGTH + 1;
			int endRow = (pageNum) * MEMBER_LENGTH;

			int pageTotalCount = memberTotalCount / MEMBER_LENGTH;
			if (memberTotalCount % MEMBER_LENGTH > 0)
				pageTotalCount++;

			int startPageIndex = (((pageNum - 1) / MEMBER_PAGE_LENGTH) * MEMBER_PAGE_LENGTH) + 1;
			int endPageIndex = startPageIndex + MEMBER_PAGE_LENGTH - 1;
			if (endPageIndex > pageTotalCount)
				endPageIndex = pageTotalCount;

			List<PetitionerDTO> petitioners = petitionerService.blackList(startRow, endRow, sort);

			model.addAttribute("pageNum", pageNum);
			model.addAttribute("sort", sort);
			model.addAttribute("petitioners", petitioners);
			model.addAttribute("petitionerCount", petitioners.size());

			model.addAttribute("pageTotalCount", pageTotalCount);
			model.addAttribute("startPageIndex", startPageIndex);
			model.addAttribute("endPageIndex", endPageIndex);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "test/Test";
	}

	@RequestMapping(value = "selectRelease.aa", method = RequestMethod.POST)
	public String selectDel(String selects) {
		System.out.println("selectRelease run");
		if (selects != null) {
			List<String> memberNums = new ArrayList<>(Arrays.asList(selects.split(",")));
			try {
				for (String s : memberNums) {
					petitionerService.selectRelease(Integer.parseInt(s));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return "redirect:petitionerblack.aa";
	}
}
