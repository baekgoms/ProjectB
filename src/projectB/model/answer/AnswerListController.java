package projectB.model.answer;

import java.util.Collections;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import projectB.model.petition.CategoryDTO;
import projectB.model.answerList.AnswerListService;

@Controller
@RequestMapping("answer")
public class AnswerListController {

  @Autowired
  private AnswerListService AnswerListService = null;
  
  @RequestMapping("standbyAnswerList.aa")
  public String stanbyAnswerList(@RequestParam(defaultValue="1")int pageNum, Model model) throws Exception {

      int pageSize = 10;
      int currentPage = pageNum;
      int startRow = (currentPage - 1) * pageSize +1;
      int endRow = currentPage * pageSize;
      int count = 0;
      int number = 0;
      
      List<AnswerDTO> articleList = null;
      count = AnswerListService.getArticleCount();
      if(count > 0) {
          articleList = AnswerListService.getArticles(startRow, endRow);
      } else {
          articleList = Collections.emptyList();
      }
      number = count-(currentPage-1)*pageSize;
      

       List<CategoryDTO> getCategory = AnswerListService.getCategoryList();
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
      
      
      return "answer/standbyAnswerList";
  }
  
  @RequestMapping("standbyAnswerListCategory.aa")
  public String stanbyAnswerListbyCategory(@RequestParam(defaultValue="1")int pageNum, Model model, int category) throws Exception {
      
      System.out.println("viewTest");
      int pageSize = 10;
      int currentPage = pageNum;
      int startRow = (currentPage - 1) * pageSize +1;
      int endRow = currentPage * pageSize;
      int count = 0;
      int number = 0;
      
      List<AnswerDTO> articleList = null;
      count = AnswerListService.getArticleCountbyCategory(category);
      if(count > 0) {
          articleList = AnswerListService.getArticles(startRow, endRow, category);
      } else {
          articleList = Collections.emptyList();
      }
      number = count-(currentPage-1)*pageSize;
      
    
      List<CategoryDTO> getCategory = AnswerListService.getCategoryList();
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
      
      return "answer/standbyAnswerList";
  }
  
  @RequestMapping("standbyAnswerListSort.aa")
  public String stanbyAnswerListSort(@RequestParam(defaultValue="1")int pageNum, Model model, int sort) throws Exception {

      int pageSize = 10;
      int currentPage = pageNum;
      int startRow = (currentPage - 1) * pageSize +1;
      int endRow = currentPage * pageSize;
      int count = 0;
      int number = 0;
      
      List<AnswerDTO> articleList = null;
      count = AnswerListService.getArticleCount();
      if(count > 0) {
          articleList = AnswerListService.getArticlesSort(startRow, endRow, sort);
      } else {
          articleList = Collections.emptyList();
      }
      number = count-(currentPage-1)*pageSize;
      

      List<CategoryDTO> getCategory = AnswerListService.getCategoryList();
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
  
      return "answer/standbyAnswerList";
  }
  @RequestMapping("standbyAnswerSearch.aa")
  public String stnadbyAnswerSearch(@RequestParam(defaultValue="1")int pageNum, Model model, String keyword) throws Exception {
      
      System.out.println("viewTest");
      int pageSize = 10;
      int currentPage = pageNum;
      int startRow = (currentPage - 1) * pageSize +1;
      int endRow = currentPage * pageSize;
      int count = 0;
      int number = 0;
      
      List<AnswerDTO> articleList = null;
      count = AnswerListService.getArticleCount(keyword);
      if(count > 0) {
          articleList = AnswerListService.getArticlesSearch(startRow, endRow, keyword);
      } else {
          articleList = Collections.emptyList();
      }
      number = count-(currentPage-1)*pageSize;
      
      List<CategoryDTO> getCategory = AnswerListService.getCategoryList();
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
  
      return "answer/standbyAnswerList";
  }
  @RequestMapping("finishAnswerList.aa")
  public String finishAnswerList(@RequestParam(defaultValue="1")int pageNum, Model model) throws Exception {
      
      System.out.println("timeout Test");
      int pageSize = 10;
      int currentPage = pageNum;
      int startRow = (currentPage - 1) * pageSize +1;
      int endRow = currentPage * pageSize;
      int count = 0;
      int number = 0;
      int state= 5;
      
      List<AnswerDTO> articleList = null;
      count = AnswerListService.getArticleCountbyState(state);
      if(count > 0) {
          articleList = AnswerListService.getArtilclebyState(state,startRow, endRow);
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
      model.addAttribute("articleList", articleList);
      
      return "answer/finishAnswerList";
  }
}
