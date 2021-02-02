package projectB.test.bobae;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import projectB.model.petition.CategoryDTO;
import projectB.model.petition.PetitionDTO;
import projectB.model.petition.petitionStateDTO;

@Controller
@RequestMapping("admin")
public class petitionManagementController {
	
	@Autowired
	private petitionManegementService ManageService = null;
	
	@RequestMapping("petitionManagement.aa")
	public String petitionManagement(@RequestParam(defaultValue="1")int pageNum, Model model) throws Exception{
		
		int pageSize = 10;
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;

		List<PetitionDTO> articleList = null;
		count = ManageService.getArticleCount();
		if (count > 0) {
			articleList = ManageService.getArticles(startRow, endRow);
		} else {
			articleList = Collections.emptyList();
		}
		number = count - (currentPage - 1) * pageSize;

		List<CategoryDTO> getCategory = ManageService.getCategoryList();
		List<petitionStateDTO> getState = ManageService.getStateList();
		
		model.addAttribute("state", getState);
		model.addAttribute("category", getCategory);
		model.addAttribute("currentPage", new Integer(currentPage));
		model.addAttribute("startRow", new Integer(startRow));
		model.addAttribute("endRow", new Integer(endRow));
		model.addAttribute("count", new Integer(count));
		model.addAttribute("pageSize", new Integer(pageSize));
		model.addAttribute("number", new Integer(number));
		model.addAttribute("articleList", articleList);
		model.addAttribute("pageNum", new Integer(pageNum));
		
		return "test/petitionManagement";
	}
}
