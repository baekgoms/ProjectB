package projectB.model.petition;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import projectB.model.petitionContentService.PetitionContentService;
import projectB.model.petitionContentService.PetitionPetitionerMapService;
import projectB.model.petitioner.PetitionerDTO;
import projectB.model.answer.AnswerDTO;
import projectB.model.answer.AnswerPetitionerMapDTO;
import projectB.model.login.LoginUtils;
import projectB.model.petition.PetitionDTO;

@Controller
@RequestMapping("petition")
public class PetitionContentController {

  @Autowired
  private PetitionContentService PetitionContentService = null;

  @Autowired
  private PetitionPetitionerMapService PetitionPetitionerMapService = null;


  @RequestMapping("petContent.aa")
  public String petContent(@RequestParam("num") int num, Model model, HttpServletRequest request)
      throws Exception {
    PetitionDTO petitionDTO = PetitionContentService.getArticle(num);
    String commentYn = request.getParameter("commentYn");

    if (petitionDTO.getOpen() == 1) {
      // 비공개 글이면 리턴
      return "petition/petitionContentClosed";
    }

    // PetitionContentService.updatePetitionState(petitionDTO.getNum(),totalPetition,endDate);

    String petitionState = PetitionContentService.getPetitionState(petitionDTO.getPetitionState());

    int categoryNum = petitionDTO.getCategory();
    String categoryName = PetitionContentService.getCategoryName(categoryNum);
    PetitionIndicatorDTO petitionIndicatorDTO = PetitionContentService.getPetitionIndicator(num);

    model.addAttribute("categoryName", categoryName);
    model.addAttribute("petitionDTO", petitionDTO);
    model.addAttribute("petitionState", petitionState);
    model.addAttribute("petitionIndicatorDTO", petitionIndicatorDTO);
    model.addAttribute("commentYn", commentYn);
    return "petition/petitionContent";
  }
  
  
  @RequestMapping(value="petComment.aa", produces = "application/json")
  public String petCmtListAll(@RequestParam("petitionNum") int petitionNum,
      @RequestParam(defaultValue = "1") int pageNum, Model model,HttpSession session) throws Exception {
    int pageSize = 10;
    int currentPage = pageNum;
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;
    int number = 0;

    List<PetitionDTO> petCmtList = null;
    count = PetitionContentService.petCmtCount(petitionNum);
    if (count > 0) {
      petCmtList = PetitionContentService.petCmtList(petitionNum, startRow, endRow);
    } else {
      petCmtList = Collections.emptyList();
    }
    number = count - (currentPage - 1) * pageSize;
    PetitionDTO petitionDTO = PetitionContentService.getArticle(petitionNum);

    String petitionerId = LoginUtils.getLoginID(session);
    
    
    model.addAttribute("petitionerId", petitionerId);
    model.addAttribute("currentPage", new Integer(currentPage));
    model.addAttribute("startRow", new Integer(startRow));
    model.addAttribute("endRow", new Integer(endRow));
    model.addAttribute("count", new Integer(count));
    model.addAttribute("pageSize", new Integer(pageSize));
    model.addAttribute("number", new Integer(number));
    model.addAttribute("petitionNum", new Integer(petitionNum));
    model.addAttribute("petCmtList", petCmtList);
    model.addAttribute("petitionDTO", petitionDTO);
    return "petition/petitionComment";
  }

  @ResponseBody
  @RequestMapping(value="agreePetition.aa", method=RequestMethod.POST)
  public String agreePetition(@ModelAttribute PetitionPetitionerMapDTO petitionPetitionerMapDTO,PetCommentDTO petCommentDTO,HttpSession session) throws Exception{
    
    try {
      String petitionerId = LoginUtils.getLoginID(session);
      petitionPetitionerMapDTO.setpetitionerId(petitionerId);
      PetitionerDTO petitionerDTO = PetitionContentService.getPetitionerById(petitionerId);
      PetitionPetitionerMapDTO existMapDTO = PetitionPetitionerMapService.getPetitionPetitionerMap(petitionPetitionerMapDTO);
        if (existMapDTO != null) {
          return "2"; // 투표 완료된 경우 
        }
      PetitionPetitionerMapService.insertPetitionPetitionerMap(petitionPetitionerMapDTO); 
      PetitionPetitionerMapService.agreePetition(petitionPetitionerMapDTO);
      
      String birthday = petitionerDTO.getBirthday();
      String gender = petitionerDTO.getGender();
      
      int age = LocalDate.now().getYear() - Integer.parseInt(birthday) + 1;

      System.out.println("gender : " + gender + ", age : " + age + ", birthYear : " + birthday);

      int num = petCommentDTO.getPetitionNum();
      PetitionContentService.updateIndicator(num, gender, age);
      System.out.println(num);
      
      PetitionContentService.insertPetCmt(petCommentDTO);
      PetitionContentService.updatePetitionState(num);
      
      return "1";
    } catch (Exception e) {
      e.printStackTrace();
      return "0";
    }
  }
  
  @RequestMapping("petitionCommentPro.aa")
  public String insertCmt(PetCommentDTO petCommentDTO,PetitionDTO petitionDTO,HttpSession session,Model model,PetitionPetitionerMapDTO petitionPetitionerMapDTO ) throws Exception {
      /*
      String petitionerId = LoginUtils.getLoginID(session);
      petitionPetitionerMapDTO.setpetitionerId(petitionerId);
      PetitionerDTO petitionerDTO = PetitionContentService.getPetitionerById(petitionerId);
      
      String birthday = petitionerDTO.getBirthday();
      String gender = petitionerDTO.getGender();
      
      int age = LocalDate.now().getYear() - Integer.parseInt(birthday) + 1;

      System.out.println("gender : " + gender + ", age : " + age + ", birthYear : " + birthday);

      PetitionContentService.updateIndicator(petCommentDTO.getPetitionNum(), gender, age);

      PetitionContentService.insertPetCmt(petCommentDTO);
      PetitionContentService.updatePetitionState(petCommentDTO.getPetitionNum());
      */

      model.addAttribute("num", petCommentDTO.getPetitionNum());
      
      return "petition/petitionCommentPro";
    

    /*
    if(petitionDTO.getPetitionState() == 4) {
      PetitionContentService.insertAnswerDTO(petitionDTO);
    }
    */
    
  }

  
  @RequestMapping("deletePetition.aa")
  public String deletePetition(PetCommentDTO dto) throws Exception {
    PetitionContentService.deletePetition(dto.getPetitionNum());

    return "petition/deletePetition";
  }
}