package projectB.model.answer;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import projectB.model.answerContentService.AnswerContentService;
import projectB.model.petition.PetitionDTO;
import projectB.model.petition.PetitionIndicatorDTO;
import projectB.model.petitionContentService.PetitionContentService;


@Controller 
@RequestMapping("answer")
public class AnswerContentController {

    @Autowired
    private AnswerContentService AnswerContentService= null;
    
    @Autowired
    private PetitionContentService PetitionContentService= null;
  
    @RequestMapping("answerContent.aa")
    public String petContent(@RequestParam("petitionNum") int petitionNum, Model model) throws Exception{

      PetitionDTO petitionDTO = PetitionContentService.getArticle(petitionNum);

      String petitionState = PetitionContentService.getPetitionState(petitionDTO.getPetitionState());

      int categoryNum = petitionDTO.getCategory();
      String categoryName = PetitionContentService.getCategoryName(categoryNum);
      PetitionIndicatorDTO petitionIndicatorDTO = PetitionContentService.getPetitionIndicator(petitionNum);

      
      System.out.println(petitionDTO.getNum());
      AnswerDTO answerDTO = AnswerContentService.getArticle(petitionNum);
      
      model.addAttribute("categoryName", categoryName);
      model.addAttribute("petitionDTO", petitionDTO);
      model.addAttribute("petitionState", petitionState);
      model.addAttribute("petitionIndicatorDTO", petitionIndicatorDTO);
    
      return "answer/answerContent";
    
    }
}

