package projectB.model.adminPetition;


import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import projectB.model.adminPetitionService.AdminPetitionService;
import projectB.model.petition.PetitionDTO;

@Controller
@RequestMapping("adminPetition")
public class AdminPetitionController {

  @Autowired
  private AdminPetitionService adminPetitionService = null;


  @RequestMapping("content.aa")
  public String petContent(@RequestParam("num") int num, Model model, HttpServletRequest request)
      throws Exception {
    
    PetitionDTO petitionDTO = adminPetitionService.getArticle(num);
    String petitionState = adminPetitionService.getPetitionState(petitionDTO.getPetitionState());

    int categoryNum = petitionDTO.getCategory();
    String categoryName = adminPetitionService.getCategoryName(categoryNum);

    
    model.addAttribute("categoryName", categoryName);
    model.addAttribute("petitionDTO", petitionDTO);
    model.addAttribute("petitionState", petitionState);

    return "adminPetition/content";
  }
  
  @RequestMapping("contentUpdate.aa")
  public String petContentUpdate(@RequestParam("num") int num, Model model)
      throws Exception {
    
    PetitionDTO petitionDTO = adminPetitionService.getArticle(num);
    String petitionState = adminPetitionService.getPetitionState(petitionDTO.getPetitionState());
    
    
    int categoryNum = petitionDTO.getCategory();
    String categoryName = adminPetitionService.getCategoryName(categoryNum);
    
    model.addAttribute("categoryName", categoryName);
    model.addAttribute("petitionDTO", petitionDTO);
    model.addAttribute("petitionState", petitionState);

    return "adminPetition/contentUpdate";
  }

  @RequestMapping("contentUpdatePro.aa")
  public String petContentUpdatePro(@RequestParam("num") int num, @ModelAttribute PetitionDTO petitionDTO, Model model) throws Exception{
   
    String content = petitionDTO.getContent();
    content += "\r\n\r\n [본 게시물의 일부 내용이 국민 청원 요건에 위배되어 관리자에 의해 수정되었습니다]";
    petitionDTO.setContent(content);
    adminPetitionService.updateArticle(petitionDTO);
    
    model.addAttribute("num", num);
    return "adminPetition/contentUpdatePro";
  }
  
  @RequestMapping("changeClose.aa")
  public String changeClose(@RequestParam("num") int num, Model model) throws Exception{
   
    adminPetitionService.updateClose(num);
    model.addAttribute("num", num);
    return "adminPetition/changeClose";
  }
  
  @RequestMapping("changeOpen.aa")
  public String changeOpen(@RequestParam("num") int num, Model model) throws Exception{
   
    adminPetitionService.updateOpen(num);
    model.addAttribute("num", num);
    return "adminPetition/changeOpen";
  }
  
}