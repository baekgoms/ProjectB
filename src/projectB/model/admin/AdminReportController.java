package projectB.model.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import projectB.model.adminService.AdminMainService;
import projectB.model.adminService.AdminReportService;
import projectB.model.petitionListService.PetitionListService;
import projectB.model.petitioner.PetitionerDTO;


import projectB.model.petitionerService.PetitionerService;


@Controller
@RequestMapping("admin")
public class AdminReportController {
	
	@Autowired
	private SqlSessionTemplate dao = null;
	

	
	public static final int LIST_LENGTH = 20;
	public static final int PAGE_LENGTH = 10;
	
	//===============참고=========================
	@Autowired
	private PetitionerService petitionerService;
	@Autowired
    private PetitionListService petitionDAO;
	public static final int MEMBER_LENGTH = 20;
	public static final int MEMBER_PAGE_LENGTH = 10;
	//===========================================
	
	@RequestMapping("report.aa")
	public String report( @RequestParam(defaultValue="1", required = true)int pageNum,
						  @RequestParam(defaultValue="1", required = true)int option, 
						  @RequestParam(defaultValue="0", required = true)int open,
						  Model model ) throws Exception {
		
		System.out.println("===admin report controller start===");
		int petitionCount = dao.selectOne("adminReport.getPetitionCount", open);
		int discussionCount = dao.selectOne("adminReport.getPetitionCount", open);
		int discussionCommentCount = dao.selectOne("adminReport.getPetitionCount", open);
		int TotalCount = petitionCount + discussionCount + discussionCommentCount;
				
				
		int startRow = (pageNum - 1) * LIST_LENGTH + 1;
		int endRow = (pageNum) * LIST_LENGTH;
		
		int pageTotalCount = TotalCount / LIST_LENGTH;
		if (TotalCount % LIST_LENGTH > 0)
			pageTotalCount++;
		
		int startPageIndex = (((pageNum - 1) / PAGE_LENGTH) * PAGE_LENGTH) + 1;
		int endPageIndex = startPageIndex + PAGE_LENGTH - 1;
		if (endPageIndex > pageTotalCount)
			endPageIndex = pageTotalCount;
		
		List<PetitionerDTO> petitioners = petitionerService.petitioners(startRow, endRow, option);
		
		
		model.addAttribute("petitioners", petitioners);
		model.addAttribute("petitionerCount", petitioners.size());
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("option", option);
		model.addAttribute("pageTotalCount", pageTotalCount);
		model.addAttribute("startPageIndex", startPageIndex);
		model.addAttribute("endPageIndex", endPageIndex);			
		
		
		
		
		System.out.println("===admin report controller end===");
		return "wooch/AdminReport";
	}
	
	//참고=============================================================================
	@RequestMapping("p.aa")
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
	
	
	
}

