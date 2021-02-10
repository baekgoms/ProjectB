package projectB.model.answer;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import projectB.model.answerContentService.AnswerContentService;
import projectB.model.answerContentService.AnswerPetitionerMapService;
import projectB.model.answerUploadService.AnswerUploadService;
import projectB.model.login.LoginUtils;
import projectB.model.petition.PetitionDTO;
import projectB.model.petition.PetitionIndicatorDTO;
import projectB.model.petitionContentService.PetitionContentService;
import projectB.model.petitionContentService.PetitionPetitionerMapService;
import projectB.model.petitioner.PetitionerDTO;


@Controller 
@RequestMapping("answer")
public class AnswerContentController {

    @Autowired
    private AnswerContentService AnswerContentService= null;
    
    @Autowired
    private PetitionContentService PetitionContentService= null;
    
    @Autowired
    private AnswerUploadService AnswerUploadService= null;
    
    @Autowired
    private AnswerPetitionerMapService AnswerPetitionerMapService= null;
    
    @RequestMapping("answerContent.aa")
    public String answerContent(@RequestParam("petitionNum") int petitionNum, Model model,HttpSession session) throws Exception{

      PetitionDTO petitionDTO = PetitionContentService.getArticle(petitionNum);

      String petitionState = PetitionContentService.getPetitionState(petitionDTO.getPetitionState());

      int categoryNum = petitionDTO.getCategory();
      String categoryName = PetitionContentService.getCategoryName(categoryNum);
      PetitionIndicatorDTO petitionIndicatorDTO = PetitionContentService.getPetitionIndicator(petitionNum);

      String id = LoginUtils.getLoginID(session);
      PetitionerDTO petitionerDTO = AnswerUploadService.getPetitionerInfo(id);

      List<AnswerDTO> answerList = new ArrayList<>(); 
      answerList = AnswerContentService.getAnswerByPetitionNum(petitionNum);
      
      model.addAttribute("petitionerDTO",petitionerDTO);
      model.addAttribute("answerList",answerList);
      model.addAttribute("categoryName", categoryName);
      model.addAttribute("petitionDTO", petitionDTO);
      model.addAttribute("petitionState", petitionState);
      model.addAttribute("petitionIndicatorDTO", petitionIndicatorDTO);
      
      return "answer/answerContent";
    
    }
    
    @ResponseBody
    @RequestMapping(value="answerReact.aa", method=RequestMethod.POST, produces = "application/json")
    public String addAnswerReact(@ModelAttribute AnswerPetitionerMapDTO answerPetitionerMapDTO,HttpSession session) throws Exception{
      String petitioner = "1"; // TODO - session
      answerPetitionerMapDTO.setPetitioner(petitioner);
      
      String id = LoginUtils.getLoginID(session);
      PetitionerDTO petitionerDTO = AnswerUploadService.getPetitionerInfo(id);
      try {
        AnswerPetitionerMapDTO existMapDTO = AnswerPetitionerMapService.getAnswerPetitionerMap(answerPetitionerMapDTO);
          if (existMapDTO != null) {
            return "2"; // 투표 완료된 경우
          }
        AnswerPetitionerMapService.insertAnswerPetitionerMap(answerPetitionerMapDTO);
        AnswerPetitionerMapService.answerReact(answerPetitionerMapDTO);

        AnswerDTO answer = AnswerContentService.getAnswerByNum(answerPetitionerMapDTO.getAnswerNum());
        if (answer.getAddition() >= 10 && answer.getState() != 6) {
          AnswerContentService.updateAnswerStateAddition(answerPetitionerMapDTO.getAnswerNum());
        }
        return "1";
      } catch (Exception e) {
        e.printStackTrace();
        return "0";
      }
    }
    
    
    @RequestMapping("answerContentUpdate.aa")
    public String answerUpload(@RequestParam("petitionNum") int petitionNum, Model model, HttpSession session) throws Exception {

    
    String id = LoginUtils.getLoginID(session);
    PetitionerDTO petitionerDTO = AnswerUploadService.getPetitionerInfo(id);
    model.addAttribute("petitionerDTO",petitionerDTO);
    
    PetitionDTO petitionDTO = AnswerUploadService.getPetitionInfo(petitionNum);
    model.addAttribute("petitionNum", petitionNum);
    model.addAttribute("petitionDTO",petitionDTO);
    
    List<AnswerDTO> answerList = new ArrayList<>();
    answerList = AnswerContentService.getAnswerByPetitionNum(petitionNum);
    

    model.addAttribute("answerList",answerList);

    return "answer/answerContentUpdate";
    }
    
    
    @RequestMapping("answerContentUpdatePro.aa")
    public String petContentUpdatePro(@RequestParam("petitionNum") int petitionNum, @ModelAttribute AnswerDTO answerDTO, Model model) throws Exception{
      AnswerContentService.updateArticle(answerDTO);

      model.addAttribute("petitionNum", petitionNum);

      return "answer/answerContentUpdatePro";
    }
    
    
}

