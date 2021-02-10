package projectB.model.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import projectB.model.adminDiscussionService.AdminDiscussionService;
import projectB.model.petition.DiscussionDTO;

@Controller
@RequestMapping("admin")
public class AdmnDiscussionController {
	
	@Autowired
	private AdminDiscussionService adminDis = null;
	
	@RequestMapping("adminDis.aa")
	public String adminDis(@RequestParam(defaultValue="1" , required = true)int pageNum, Model model) throws Exception {
		
		int pageSize = 6;
        int currentPage = pageNum;
        int startRow = (currentPage - 1) * pageSize + 1;
        int endRow = currentPage * pageSize;
        
		int count = adminDis.getAllArticlesCount();
		System.out.println(count);
		List<DiscussionDTO> articleList = null;
		if(count > 0) {
			articleList = adminDis.getAllArticles(startRow, endRow);
		}
		
		model.addAttribute("currentPage", new Integer(currentPage));
        model.addAttribute("count", new Integer(count));
        model.addAttribute("pageSize", new Integer(pageSize));
        model.addAttribute("pageNum", new Integer(pageNum));
		model.addAttribute("articleList", articleList);
		return "adminDiscussion/adminDis";
		
	}
	
	@RequestMapping("delete.aa")
	public int delete(HttpSession session,
		     @RequestParam(value = "chbox[]") List<String> chArr, DiscussionDTO article, Model model) throws Exception {
	
	String memId = (String) session.getAttribute("memId");

	int result = 0;
	int num = 0;
	if(memId != null) {
		for(String i : chArr) {
		num = Integer.parseInt(i);
		adminDis.deleteArticle(num);
		}
		result = 1;
	}
		return result;
	}

}
