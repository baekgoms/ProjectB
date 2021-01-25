package projectB.model.petition;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import projectB.model.petitionListService.PetitionListService;


@Controller
@RequestMapping("petition")
public class petitionListController {
	
	@Autowired
    private PetitionListService petitionDAO = null;
    
	
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
    
    @RequestMapping("afootPetitionCategory.aa")
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
         System.out.println(state + "//state");
         
        
        model.addAttribute("currentPage", new Integer(currentPage));
        model.addAttribute("startRow", new Integer(startRow));
        model.addAttribute("endRow", new Integer(endRow));
        model.addAttribute("count", new Integer(count));
        model.addAttribute("pageSize", new Integer(pageSize));
        model.addAttribute("number", new Integer(number));
        model.addAttribute("articleList", articleList);
        
        return "petition/standbyPetition";
    }

    //신고하기
    @RequestMapping("declareArticle.aa")
	public String declareArticle(int num, Model model)throws Exception{
		
		PetitionDTO report = petitionDAO.forReport(num);
		
		model.addAttribute("num",new Integer(num));
		model.addAttribute("report", report);
		return "petition/declareArticle";
	}
    
    //신고하기
    @RequestMapping("reportMs.aa")
	public String report(int num,String id, Model model)throws Exception{
		
    	int count = 0;
    	
		PetitionDTO report = petitionDAO.reportCount(num);
		
		count = petitionDAO.getreportCount(num);
		System.out.println(id + "//id");
		if(count == 10) {
			petitionDAO.updateReport(id);
			//추후 신고횟수 조절예정
		}
		model.addAttribute("num",new Integer(num));
		model.addAttribute("id",id);
		model.addAttribute("report", report);
		return "petition/reportMs";
	}
    

}
