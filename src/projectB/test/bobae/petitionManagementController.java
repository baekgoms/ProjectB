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
	
	@RequestMapping("petitionManagementSearch.aa")
	public String ing_listSearch(@RequestParam(defaultValue = "1") int pageNum, Model model, 
								@RequestParam(defaultValue = "")String keyword,
								@RequestParam(defaultValue = "title")String searchOption )
			throws Exception {
		int pageSize = 10;
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;

		List<PetitionDTO> articleList = null;
		count = ManageService.getArticleCount(keyword,searchOption);
		if (count > 0) {
			articleList = ManageService.getArticlesSearch(startRow, endRow, keyword,searchOption);
		} else {
			articleList = Collections.emptyList();
		}
		number = count - (currentPage - 1) * pageSize;

		List<CategoryDTO> getCategory = ManageService.getCategoryList();
		model.addAttribute("category", getCategory);

		model.addAttribute("currentPage", new Integer(currentPage));
		model.addAttribute("startRow", new Integer(startRow));
		model.addAttribute("endRow", new Integer(endRow));
		model.addAttribute("count", new Integer(count));
		model.addAttribute("pageSize", new Integer(pageSize));
		model.addAttribute("number", new Integer(number));
		model.addAttribute("articleList", articleList);
		model.addAttribute("pageNum", new Integer(pageNum));
		model.addAttribute("keyword", keyword);
		model.addAttribute("searchOption", searchOption);
		

		return "test/petitionManagement";
	}
	
	@RequestMapping("modifyManagement.aa")
	public String modifyManagement() throws Exception{

		return "test/modifyManagement";
	}
	
	@RequestMapping("abstractManagement.aa")
	public String abstractManagement(@RequestParam(defaultValue = "1") int pageNum, Model model) throws Exception{
		
			int pageSize = 10;
			int currentPage = pageNum;
			int startRow = (currentPage - 1) * pageSize + 1;
			int endRow = currentPage * pageSize;
			int count = 0;
			int number = 0;
			int state = 6;

			List<PetitionDTO> articleList = null;
			count = ManageService.getArticleCountbyState(state);
			if (count > 0) {
				articleList = ManageService.getArtilclebyState(state, startRow, endRow);
			} else {
				articleList = Collections.emptyList();
			}
			number = count - (currentPage - 1) * pageSize;

			model.addAttribute("currentPage", new Integer(currentPage));
			model.addAttribute("startRow", new Integer(startRow));
			model.addAttribute("endRow", new Integer(endRow));
			model.addAttribute("count", new Integer(count));
			model.addAttribute("pageSize", new Integer(pageSize));
			model.addAttribute("number", new Integer(number));
			model.addAttribute("articleList", articleList);
			
		return "test/abstractManagement";
	}
	
	@RequestMapping("petitionDetail.aa")
	public String petitionDetail(int num, int pageNum, Model model) throws Exception{
		
		PetitionDTO list = ManageService.getContent(num);
		List<petitionStateDTO> getState = ManageService.getStateList();
		
		model.addAttribute("num", new Integer(num));
		model.addAttribute("pageNum", new Integer(pageNum));
		model.addAttribute("list", list);
		model.addAttribute("state", getState);
		
		return "test/petitionDetail";
	}
}
