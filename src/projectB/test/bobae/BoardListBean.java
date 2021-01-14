package projectB.test.bobae;


import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import projectB.model.petition.PetitionDTO;

@Controller
@RequestMapping("board")
public class BoardListBean {
	
	@Autowired
	private PetitionService petitionDAO = null;
	
	@RequestMapping("ing_list.aa")
	public String ing_list(@RequestParam(defaultValue="1")int pageNum, PetitionDTO dto, Model model) throws Exception {
		
		System.out.println("viewTest");
		int pageSize = 10;
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize +1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		
		List<PetitionDTO> articleList = null;
		count = petitionDAO.getArticleCount();
		if(count > 0) {
			articleList = petitionDAO.getArticles(dto);
		} else {
			articleList = Collections.emptyList();
		}
		number = count-(currentPage-1)*pageSize;
		
		 System.out.println(count + "//count");
	     System.out.println(articleList.size() + "//size");
		
		model.addAttribute("currentPage", new Integer(currentPage));
		model.addAttribute("startRow", new Integer(startRow));
		model.addAttribute("endRow", new Integer(endRow));
		model.addAttribute("count", new Integer(count));
		model.addAttribute("pageSize", new Integer(pageSize));
		model.addAttribute("number", new Integer(number));
		model.addAttribute("articleList", articleList);
		
		return "board/ing_list";
	}
	
	@RequestMapping("finish_list.aa")
	public String test1() {
		System.out.println("finish Test");
		return "board/finish_list";
	}

	@RequestMapping("timeout_list.aa")
	public String test2() {
		System.out.println("timeout Test");
		return "board/timeout_list";
	}

	@RequestMapping("waiting_list.aa")
	public String test3() {
		System.out.println("waiting Test");
		return "board/waiting_list";
	}

}
