package projectB.model.admin;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import projectB.model.adminPetManagerService.petitionManegementService;
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
		
		return "adminPetition/petitionManagement";
	}
	
	@RequestMapping("petitionManagementSearch.aa")
	public String ing_listSearch(@RequestParam(defaultValue = "1") int pageNum, Model model, 
								@RequestParam(defaultValue = "")String keyword,
								@RequestParam(defaultValue = "title")String searchOption, int stateList)
			throws Exception {
		int pageSize = 10;
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		
		List<PetitionDTO> articleList = null;
		count = ManageService.getArticleCount(keyword,searchOption,stateList);
		if (count > 0) {
			articleList = ManageService.getArticlesSearch(startRow, endRow, keyword,searchOption,stateList);
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
		model.addAttribute("stateList", stateList);
		
		return "adminPetition/petitionManagement";
	}
	
    @RequestMapping("petitionManagementdelete.aa")
    public String ajaxTest(HttpServletRequest request) {
            
        String[] num = request.getParameterValues("valueArr");
        int size = num.length;
        int[] nums = Arrays.stream(num).mapToInt(Integer::parseInt).toArray();
        for(int i=0; i<size; i++) {
			ManageService.deleteArticle(nums[i]);
		}
       

		return "adminPetition/petitionManagement";
	}
	
	@RequestMapping("modifyManagement.aa")
	public String modifyManagement() throws Exception{

		return "adminPetition/modifyManagement";
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
			
		return "adminPetition/abstractManagement";
	}
	
    @RequestMapping("abstractManagementdelete.aa")
    public String ajaxTestAbstra(HttpServletRequest request) {
            
        String[] num = request.getParameterValues("valueArr");
        int size = num.length;
        int[] nums = Arrays.stream(num).mapToInt(Integer::parseInt).toArray();
        for(int i=0; i<size; i++) {
			ManageService.deleteArticle(nums[i]);
		}
       

		return "adminPetition/abstractManagement";
	}
	
	@RequestMapping("petitionDetail.aa")
	public String petitionDetail(int num, int pageNum, Model model) throws Exception{
		
		PetitionDTO list = ManageService.getContent(num);
		List<petitionStateDTO> getState = ManageService.getStateList();
		
		model.addAttribute("num", new Integer(num));
		model.addAttribute("pageNum", new Integer(pageNum));
		model.addAttribute("list", list);
		model.addAttribute("state", getState);
		
		return "adminPetition/petitionDetail";
	}
	
	@RequestMapping("petitionDetailDelete.aa")
	public String petitionDetailDelete(int num) throws Exception{
		
		ManageService.deleteArticle(num);
		
		return "adminPetition/petitionDetailDelete";
	}
	
	@RequestMapping("openClosePetition.aa")
	public String openClosePetition(int num, Model model) throws Exception{

		PetitionDTO list = ManageService.checkOpCl(num);
		
		model.addAttribute("num", new Integer(num));
		model.addAttribute("list", list);
		
		return "adminPetition/openClosePetition";
	}
	
	 @RequestMapping("updatePrivate.aa")
	  public String updatePrivate(@RequestParam("num") int num, Model model) throws Exception{
	   
		
		ManageService.updatePrivate(num);
	    model.addAttribute("num", num);
	    
	    return "adminPetition/updatePrivate";
	  }
	  
	  @RequestMapping("updatePublicly.aa")
	  public String updatePublicly(@RequestParam("num") int num, Model model) throws Exception{
		
		ManageService.updatePublicly(num);
	    model.addAttribute("num", num);
	    
	    return "adminPetition/updatePublicly";
	  }
}
