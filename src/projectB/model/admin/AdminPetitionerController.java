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

import projectB.model.petition.PetitionDTO;
import projectB.model.petitionListService.PetitionListService;
import projectB.model.petitioner.PetitionerDTO;
import projectB.model.petitionerService.PetitionerService;

@Controller
@RequestMapping("admin")
public class AdminPetitionerController {
	@Autowired
	private PetitionerService petitionerService;
	
	@Autowired
    private PetitionListService petitionDAO;

	public static final int MEMBER_LENGTH = 20;
	public static final int MEMBER_PAGE_LENGTH = 10;
	
	@RequestMapping("petitioner.aa")
	public String member(@RequestParam(defaultValue="1", required = true)int pageNum,
			@RequestParam(defaultValue="1", required = true)int sort,
			Model model) {
		System.out.println("petitioner run");
		
		try {
			
			int memberTotalCount = petitionerService.totalMemberCount();
			int startRow = (pageNum - 1) * MEMBER_LENGTH + 1;
			int endRow = (pageNum) * MEMBER_LENGTH;
			
			int pageTotalCount = memberTotalCount / MEMBER_LENGTH;
			if (memberTotalCount % MEMBER_LENGTH > 0)
				pageTotalCount++;
			
			int startPageIndex = (((pageNum - 1) / MEMBER_PAGE_LENGTH) * MEMBER_PAGE_LENGTH) + 1;
			int endPageIndex = startPageIndex + MEMBER_PAGE_LENGTH - 1;
			if (endPageIndex > pageTotalCount)
				endPageIndex = pageTotalCount;
			
			List<PetitionerDTO> petitioners = petitionerService.petitioners(startRow, endRow, sort);
			
			
			model.addAttribute("petitioners", petitioners);
			model.addAttribute("petitionerCount", petitioners.size());
			
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("sort", sort);
			model.addAttribute("pageTotalCount", pageTotalCount);
			model.addAttribute("startPageIndex", startPageIndex);
			model.addAttribute("endPageIndex", endPageIndex);			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "adminPetitioner/adminPetitioner";
	}
	
	@RequestMapping(value = "selectDel.aa", method = RequestMethod.POST)
	public String selectDel(String selects) {
		System.out.println("selectDel run");
		if(selects != null) {
			List<String> memberNums  = new ArrayList<>(Arrays.asList(selects.split(",")));
			try {
				for (String s : memberNums) {				
					petitionerService.deletepetitioner(Integer.parseInt(s));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return "redirect:petitioner.aa";
	}
	
	@RequestMapping("memberDetail.aa")
	public String memberDetail(int num, Model model) {
		
		try {
			PetitionerDTO dto = petitionerService.petitionerByNum(num);
			List<PetitionDTO> petitions = petitionDAO.getArticles(1, 3);
			
			model.addAttribute("dto", dto);
			model.addAttribute("petitions", petitions);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "adminPetitioner/petitionerDetail";
	}
	
	@RequestMapping("memberModify.aa")
	public String memberModify(PetitionerDTO dto) {
		System.out.println("memberModify run");
		System.out.println(dto.getNum());
		System.out.println(dto.getEmail());
		
		try{
			petitionerService.updatePetitioner(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:memberDetail.aa?num="+dto.getNum();
	}
	
	@RequestMapping("memberDel.aa")
	public String memberDel(int num) {
		System.out.println("memberDel / " + num);
		try{
			petitionerService.deletepetitioner(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "adminPetitioner/petitionerDel";
	}
}
