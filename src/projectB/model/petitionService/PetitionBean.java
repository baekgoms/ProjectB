package projectB.model.petitionService;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import projectB.model.petition.PetCommentDTO;
import projectB.model.petition.PetitionDTO;


@Controller
@RequestMapping("petition")
public class PetitionBean {
	
	@Autowired
	private PetitionService dao = null;
	
	@RequestMapping("uploadForm.aa")
	public String upload(PetitionDTO dto, Model model) throws Exception {
		List category = null;
		System.out.println("wooch uploadForm run");
		model.addAttribute("dto", dto);
		category = dao.getCategory();
		model.addAttribute("category", category);
		System.out.println("category size:"+category.size()+"\n"+category);
		
		return "wooch/uploadForm";
	}
	
   @RequestMapping("uploadPro.aa")
   public String writePro(PetitionDTO dto, HttpServletRequest request) throws Exception{
	   	   
	   dao.insertArticle(dto);
	   
	   System.out.println("uploadPro run");
	   
	   return "wooch/uploadPro";
   }
	
   
	//泥��썝寃뚯떆�뙋 由ъ뒪�듃
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
	
	//�떟蹂��씠 �셿猷뚮맂 寃뚯떆�뙋 由ъ뒪�듃
	@RequestMapping("finish_list.aa")
	public String test1() {
		System.out.println("finish Test");
		
		System.out.println("ddd");
		return "board/finish_list";
	}

	//湲곌컙�씠 留뚮즺�맂 泥��썝 由ъ뒪�듃
	@RequestMapping("timeout_list.aa")
	public String timeout_list(@RequestParam(defaultValue="1")int pageNum, Model model) throws Exception {
		
		System.out.println("timeout Test");
		int pageSize = 10;
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize +1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		int state= 3; // 湲곌컙�씠 留뚮즺�맂 泥��썝 
		
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

	//�떟蹂��쓣 湲곕떎由щ뒗 由ъ뒪�듃
	@RequestMapping("waiting_list.aa")
	public String watiting_list(@RequestParam(defaultValue="1")int pageNum, Model model) throws Exception{
		
		System.out.println("waiting Test");

		int pageSize = 10;
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize +1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		int state= 4; // �떟蹂��쓣 湲곕떎由щ뒗 泥��썝
		
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
	//청원보기
	@RequestMapping("petContent.aa")
	public String petContent(int num, Model model) throws Exception{
		PetitionDTO petDTO = dao.getArticle(num);
		model.addAttribute("petDTO",petDTO);
		return "board/petitionContent";
	}
	
	//청원댓글
	@RequestMapping("petComment.aa")
	public String petCmtListAll(int petitionNum,@RequestParam(defaultValue="1")int pageNum, Model model) throws Exception{
		int pageSize = 20;
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize +1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		
		List<PetitionDTO> articleList = null;
		count = dao.petCmtCount(petitionNum);
		if(count > 0) {
			articleList = dao.petCmtList(petitionNum,startRow, endRow);
		} else {
			articleList = Collections.emptyList();
		}
		number = count-(currentPage-1)*pageSize;
		
		model.addAttribute("currentPage", new Integer(currentPage));
		model.addAttribute("startRow", new Integer(startRow));
		model.addAttribute("endRow", new Integer(endRow));
		model.addAttribute("count", new Integer(count));
		model.addAttribute("pageSize", new Integer(pageSize));
		model.addAttribute("number", new Integer(number));
		model.addAttribute("petitionNum", new Integer(petitionNum));
		model.addAttribute("articleList", articleList);
		
		return "board/petitionComment";
	}
	
	@RequestMapping("petCommentPro.aa")
	public String insertCmt(PetCommentDTO dto)throws Exception{
		dao.insertPetCmt(dto);
		return "board/petitionCommentPro";
	}
	  
	
	
	
}

