package projectB.model.petitionService;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import projectB.model.petition.CategoryDTO;
import projectB.model.petition.PetCommentDTO;
import projectB.model.petition.PetitionDTO;
import projectB.model.petition.PetitionIndicatorDTO;

@Controller
@RequestMapping("petition")
public class PetitionBean {
	
	@Autowired
	private PetitionService petitionDAO = null;
	
	
	@RequestMapping("uploadForm.aa")
	public String upload(PetitionDTO dto, Model model,HttpSession session) throws Exception {
		
		//임시 세션 아이디 입력
		session.setAttribute("memId", "홍우찬테스트");
		
		String id = (String) session.getAttribute("memId");
		System.out.println("session id:"+id);
		
		if(id != null) {
			
			List category = null;
			System.out.println("wooch uploadForm run");
			
			model.addAttribute("dto", dto);
			dto.setWriter((String)session.getAttribute("memId"));
			System.out.println("Writer:"+dto.getWriter());
			category = petitionDAO.getCategory();
			model.addAttribute("category", category);
			System.out.println("category size:"+category.size()+"\n"+category);
		}	
		
		return "wooch/uploadForm";
	}
	
   @RequestMapping("uploadPro.aa")
   public String writePro(PetitionDTO dto, HttpServletRequest request, HttpSession session) throws Exception{
	   	   
	   
	   dto.setWriter((String)session.getAttribute("memId"));
	   System.out.println("Writer:"+dto.getWriter());
	   petitionDAO.insertArticle(dto);
	   System.out.println("uploadPro run");
	   
	   return "wooch/uploadPro";
   }
	
	@RequestMapping("afootPetition.aa")
	public String ing_list(@RequestParam(defaultValue="1")int pageNum, Model model) throws Exception {
		
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
			articleList = petitionDAO.getArticles(startRow, endRow);
		} else {
			articleList = Collections.emptyList();
		}
		number = count-(currentPage-1)*pageSize;
		
		 System.out.println(count + "//count");
	     System.out.println(articleList.size() + "//size");
	  
	   
	     List<CategoryDTO> getCategory = petitionDAO.getCategoryList();
	     System.out.println(getCategory + "//category");
	     model.addAttribute("category", getCategory);
	
	 
		
		model.addAttribute("currentPage", new Integer(currentPage));
		model.addAttribute("startRow", new Integer(startRow));
		model.addAttribute("endRow", new Integer(endRow));
		model.addAttribute("count", new Integer(count));
		model.addAttribute("pageSize", new Integer(pageSize));
		model.addAttribute("number", new Integer(number));
		model.addAttribute("articleList", articleList);
		model.addAttribute("pageNum", new Integer(pageNum));
		
		
		return "petition/afootPetition";
	}
	
	@RequestMapping("afootPetitioncategory.aa")
	public String ing_listbyCategory(@RequestParam(defaultValue="1")int pageNum, Model model, int category) throws Exception {
		
		System.out.println("viewTest");
		int pageSize = 10;
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize +1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		
		List<PetitionDTO> articleList = null;
		count = petitionDAO.getArticleCountbyCategory(category);
		if(count > 0) {
			articleList = petitionDAO.getArticles(startRow, endRow, category);
		} else {
			articleList = Collections.emptyList();
		}
		number = count-(currentPage-1)*pageSize;
		
		 System.out.println(count + "//count");
	     System.out.println(articleList.size() + "//size");
	 
	     
	     List<CategoryDTO> getCategory = petitionDAO.getCategoryList();
	     System.out.println(getCategory + "//category");
	     model.addAttribute("category", getCategory);
		
		model.addAttribute("currentPage", new Integer(currentPage));
		model.addAttribute("startRow", new Integer(startRow));
		model.addAttribute("endRow", new Integer(endRow));
		model.addAttribute("count", new Integer(count));
		model.addAttribute("pageSize", new Integer(pageSize));
		model.addAttribute("number", new Integer(number));
		model.addAttribute("articleList", articleList);
		model.addAttribute("pageNum", new Integer(pageNum));
		model.addAttribute("categorya", new Integer(category));
		
		return "petition/afootPetition";
	}
	
	@RequestMapping("afootPetitionSort.aa")
	public String ing_listSort(@RequestParam(defaultValue="1")int pageNum, Model model, int sort) throws Exception {
		
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
			articleList = petitionDAO.getArticlesSort(startRow, endRow, sort);
		} else {
			articleList = Collections.emptyList();
		}
		number = count-(currentPage-1)*pageSize;
		
		 System.out.println(count + "//count");
		 System.out.println(articleList.size() + "//size");
	   
	     List<CategoryDTO> getCategory = petitionDAO.getCategoryList();
	     System.out.println(getCategory + "//category");
	     model.addAttribute("category", getCategory);
	
	 
		
		model.addAttribute("currentPage", new Integer(currentPage));
		model.addAttribute("startRow", new Integer(startRow));
		model.addAttribute("endRow", new Integer(endRow));
		model.addAttribute("count", new Integer(count));
		model.addAttribute("pageSize", new Integer(pageSize));
		model.addAttribute("number", new Integer(number));
		model.addAttribute("articleList", articleList);
		model.addAttribute("pageNum", new Integer(pageNum));
		model.addAttribute("sort", new Integer(sort));
	
		return "petition/afootPetition";
	}
	
	@RequestMapping("afootPetitionSearch.aa")
	public String ing_listSearch(@RequestParam(defaultValue="1")int pageNum, Model model, String keyword) throws Exception {
		
		System.out.println("viewTest");
		int pageSize = 10;
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize +1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		
		List<PetitionDTO> articleList = null;
		count = petitionDAO.getArticleCount(keyword);
		if(count > 0) {
			articleList = petitionDAO.getArticlesSearch(startRow, endRow, keyword);
		} else {
			articleList = Collections.emptyList();
		}
		number = count-(currentPage-1)*pageSize;
		
		 System.out.println(count + "//count");
		 System.out.println(articleList.size() + "//size");
	   
	     List<CategoryDTO> getCategory = petitionDAO.getCategoryList();
	     System.out.println(getCategory + "//category");
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
	
		return "petition/afootPetition";
	}
	
	
	@RequestMapping("finish_list.aa")
	public String test1() {
		System.out.println("finish Test");
		
		System.out.println("ddd");
		return "petition/finish_list";
	}

	@RequestMapping("terminationPetition.aa")
	public String timeout_list(@RequestParam(defaultValue="1")int pageNum, Model model) throws Exception {
		
		System.out.println("timeout Test");
		int pageSize = 10;
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize +1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		int state= 3;
		
		List<PetitionDTO> articleList = null;
		count = petitionDAO.getArticleCountbyState(state);
		if(count > 0) {
			articleList = petitionDAO.getArtilclebyState(state,startRow, endRow);
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
		
		return "petition/terminationPetition";
	}

	@RequestMapping("standbyPetition.aa")
	public String watiting_list(@RequestParam(defaultValue="1")int pageNum, Model model) throws Exception{
		
		System.out.println("waiting Test");

		int pageSize = 10;
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize +1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		int state= 4;
		
		List<PetitionDTO> articleList = null;
		count = petitionDAO.getArticleCountbyState(state);
		if(count > 0) {
			articleList = petitionDAO.getArtilclebyState(state,startRow, endRow);
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
		
		return "petition/standbyPetition";
	}
	//청원보기
	@RequestMapping("petContent.aa")
	public String petContent(int num, Model model) throws Exception{
		PetitionDTO petDTO = petitionDAO.getArticle(num);
        List<CategoryDTO> categoryDTO = petitionDAO.getCategoryList();
        String categoryName = "";
        
        for (int i=0; i<categoryDTO.size(); i++) {
            if (petDTO.getCategory() == categoryDTO.get(i).getNum()) {
                categoryName = categoryDTO.get(i).getCategoryName();
            }
        }
        
        PetitionIndicatorDTO petitionIndicatorDTO = petitionDAO.getPetitionIndicator(num);
        
        model.addAttribute("categoryName", categoryName);		
		model.addAttribute("petDTO",petDTO);
        model.addAttribute("petitionIndicatorDTO",petitionIndicatorDTO);
		return "petition/petitionContent";
	}
	
	//청원댓글
	@RequestMapping("petComment.aa")
    public String petCmtListAll(@RequestParam("petitionNum")int petitionNum,@RequestParam(defaultValue="1")int pageNum, Model model) throws Exception{
		int pageSize = 10;
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize +1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		
		List<PetitionDTO> petCmtList = null;
		count = petitionDAO.petCmtCount(petitionNum);
		if(count > 0) {
			petCmtList = petitionDAO.petCmtList(petitionNum,startRow, endRow);
		} else {
			petCmtList = Collections.emptyList();
		}
		number = count-(currentPage-1)*pageSize;
		
		model.addAttribute("currentPage", new Integer(currentPage));
		model.addAttribute("startRow", new Integer(startRow));
		model.addAttribute("endRow", new Integer(endRow));
		model.addAttribute("count", new Integer(count));
		model.addAttribute("pageSize", new Integer(pageSize));
		model.addAttribute("number", new Integer(number));
		model.addAttribute("petitionNum", new Integer(petitionNum));
		model.addAttribute("petCmtList", petCmtList);
		
		return "petition/petitionComment";
	}
	
	@RequestMapping
	public String insertCmt(PetCommentDTO dto)throws Exception{
		
		
		
		petitionDAO.insertPetCmt(dto);
		return "petition/petitionCommentPro";
	}

}

