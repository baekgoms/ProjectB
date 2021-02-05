package projectB.model.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	

	
	public static final int LIST_LENGTH = 10;
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
						  @RequestParam(defaultValue="0", required = true)int option, 
						  @RequestParam(defaultValue="0", required = true)int open,
						  Model model ) throws Exception {
		
		System.out.println("===admin report controller start===");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("option", option);
		map.put("open", open);
		
		int petitionCount = dao.selectOne("adminReport.getPetitionCount", map);
		int discussionCount = dao.selectOne("adminReport.getPetitionCount", map);
		int discussionCommentCount = dao.selectOne("adminReport.getPetitionCount", map);
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
		
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		System.out.println(map);
		//List<PetitionerDTO> petitioners = petitionerService.petitioners(startRow, endRow, option);
		List<AdminReportDTO> totalList = dao.selectList("adminReport.getTotalList", map);
		
		model.addAttribute("totalList", totalList);
		model.addAttribute("totalListCount", totalList.size());
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("option", option);
		model.addAttribute("open", open);
		model.addAttribute("pageTotalCount", pageTotalCount);
		model.addAttribute("startPageIndex", startPageIndex);
		model.addAttribute("endPageIndex", endPageIndex);			
		
		
		
		
		System.out.println("===admin report controller end===");
		return "wooch/AdminReport";
	}
	
	
	
	
}

