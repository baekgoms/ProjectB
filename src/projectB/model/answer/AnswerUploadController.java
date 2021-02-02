package projectB.model.answer;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import projectB.model.petition.CategoryDTO;
import projectB.model.petition.PetitionDTO;
import projectB.model.petition.PetitionIndicatorDTO;
import projectB.model.answerListService.AnswerListService;
import projectB.model.answerUploadService.*;

@Controller 
@RequestMapping("answer")
public class AnswerUploadController {

    @Autowired 
    private AnswerUploadService AnswerUploadService = null;
  
    @RequestMapping("answerUpload.aa")
    public String answerUpload(@RequestParam("petitionNum") int petitionNum, Model model) throws Exception {
    
    PetitionDTO petitionDTO = AnswerUploadService.getPetitionInfo(petitionNum);
    
    /* TODO - session
    AnswerDTO answerDTO =  AnswerUploadService.getReplyInfo(id);
    model.addAttribute("answerDTO",answerDTO);
    */
    
    model.addAttribute("petitionNum", petitionNum);
    model.addAttribute("petitionDTO",petitionDTO);
    return "answer/answerUpload";
    }
  
    @RequestMapping("answerUploadPro.aa")
    public String answerUploadPro(@ModelAttribute AnswerDTO answerDTO, Model model) throws Exception {
    int petitionNum = answerDTO.getPetitionNum();
    AnswerUploadService.updateAnswerState(petitionNum);
    AnswerUploadService.updatePetitionState(petitionNum);
    AnswerUploadService.insertArticle(answerDTO);
    
    
    System.out.println(petitionNum);
    
    model.addAttribute("petitionNum", petitionNum);
    
    return "answer/answerUploadPro";
    }
  
  
}
