package projectB.model.petitionService;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import projectB.model.petition.PetitionDTO;


@Controller
@RequestMapping("petition")
public class PetitionBean {
	
	@Autowired
	private PetitionService dao = null;
	
	@RequestMapping("uploadForm.aa")
	public String upload(PetitionDTO dto, Model model) throws Exception {
		//List category = null;
		System.out.println("wooch uploadForm run");
		model.addAttribute("dto", dto);
		//category = dao.getCategory();
		
		//System.out.println(category);
		
		return "wooch/uploadForm";
	}
	
   @RequestMapping("uploadPro.aa")
   public String writePro(PetitionDTO dto, HttpServletRequest request) throws Exception{
	   	   
	   dao.insertArticle(dto);
	   
	   System.out.println("uploadPro run");
	   
	   return "wooch/uploadPro";
   }
	
   
	//청원게시판 리스트
	@RequestMapping("ing_list.aa")
	public String ing_list(@RequestParam(defaultValue="1")int pageNum, Model model) throws Exception {
		
		System.out.println("viewTest");
		int pageSize = 10;
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize +1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		
		List<PetitionDTO> articleList = null;
		count = dao.getArticleCount();
		if(count > 0) {
			articleList = dao.getArticles(startRow, endRow);
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
	
	//답변이 완료된 게시판 리스트
	@RequestMapping("finish_list.aa")
	public String test1() {
		System.out.println("finish Test");
		
		System.out.println("ddd");
		return "board/finish_list";
	}

	//기간이 만료된 청원 리스트
	@RequestMapping("timeout_list.aa")
	public String timeout_list(@RequestParam(defaultValue="1")int pageNum, Model model) throws Exception {
		
		System.out.println("timeout Test");
		int pageSize = 10;
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize +1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		int state= 3; // 기간이 만료된 청원 
		
		List<PetitionDTO> articleList = null;
		count = dao.getArticleCountbyState(state);
		if(count > 0) {
			articleList = dao.getArtilclebyState(state,startRow, endRow);
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
		
		return "board/timeout_list";
	}

	//답변을 기다리는 리스트
	@RequestMapping("waiting_list.aa")
	public String watiting_list(@RequestParam(defaultValue="1")int pageNum, Model model) throws Exception{
		
		System.out.println("waiting Test");

		int pageSize = 10;
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize +1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		int state= 4; // 답변을 기다리는 청원
		
		List<PetitionDTO> articleList = null;
		count = dao.getArticleCountbyState(state);
		if(count > 0) {
			articleList = dao.getArtilclebyState(state,startRow, endRow);
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
		
		return "board/waiting_list";
	}
	
	
	
	
	
	
}

