package projectB.model.answer;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import projectB.model.petition.CategoryDTO;
import projectB.model.petition.PetitionDTO;
import projectB.model.answerList.AnswerListService;

@Controller 
@RequestMapping("answer")
public class AnswerListController {

  @Autowired
  private AnswerListService AnswerListService = null;
  
  @RequestMapping("list.aa")
  public String AnswerList(@RequestParam(defaultValue="1")int pageNum, @ModelAttribute AnswerDTO paramDTO,
      HttpServletRequest request, Model model) throws Exception {

      int pageSize = 10;
      int currentPage = pageNum;
      int startRow = (currentPage - 1) * pageSize +1;
      int endRow = currentPage * pageSize;
      int count = 0;
      int number = 0;

      String keyword = request.getParameter("keyword");
      String sort = request.getParameter("sort"); // 정렬 1:최신, 2:동의
      String department = "dep_1"; // TODO - session에서 가져오기
      
      List<PetitionDTO> petitionList = new ArrayList<>();
      
      List<AnswerDTO> articleList = null;
      count = AnswerListService.getArticleCount(paramDTO.getState(),department, paramDTO.getCategory(), keyword);
      if(count > 0) {
          articleList = AnswerListService.getArticleAll(paramDTO.getState(),startRow, endRow,department, paramDTO.getCategory(), keyword, sort);
          
          for(int i=0; i < articleList.size() ; i++) {
            PetitionDTO pDTO = AnswerListService.getPetitionInfo(articleList.get(i).getPetitionNum());
            petitionList.add(pDTO);
          }
      } else {
          articleList = Collections.emptyList();
      }
      number = count-(currentPage-1)*pageSize;
      

      model.addAttribute("petitionList",petitionList);
      model.addAttribute("state",paramDTO.getState());
      model.addAttribute("answerDTO",paramDTO);
      model.addAttribute("keyword", keyword);
      model.addAttribute("sort", sort);
      
      List<CategoryDTO> getCategory = AnswerListService.getCategoryList();
      model.addAttribute("category", getCategory);
  
      
      model.addAttribute("currentPage", currentPage);
      model.addAttribute("startRow", startRow);
      model.addAttribute("endRow", endRow);
      model.addAttribute("count", count);
      model.addAttribute("pageSize", pageSize);
      model.addAttribute("number", number);
      model.addAttribute("articleList", articleList);
      model.addAttribute("pageNum", pageNum);
  
      return "answer/list";
  }
  
}
