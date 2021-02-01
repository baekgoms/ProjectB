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


@Controller 
@RequestMapping("answer")
public class AnswerContentController {

    @Autowired
    private AnswerContentService AnswerContentService= null;
  
    @RequestMapping("answerContent.aa")
    public String petContent(@ModelAttribute PetitionDTO petitionDTO, Model model) {
    model.addAttribute("petitionDTO", petitionDTO);
    return "answer/answerContent";
  }
}
