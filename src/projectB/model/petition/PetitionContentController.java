package projectB.model.petition;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import projectB.model.petitionContentService.PetitionContentService;
import projectB.model.petitionContentService.PetitionPetitionerMapService;
import projectB.model.petitioner.PetitionerDTO;
import projectB.model.petition.PetitionDTO;

@Controller
@RequestMapping("petition")
public class PetitionContentController {
  
    @Autowired
    private PetitionContentService PetitionContentService = null;
    
    @Autowired
    private PetitionPetitionerMapService petitionPetitionerService = null;
  
   
    @RequestMapping("petContent.aa")
    public String petContent(@RequestParam("num")int num, Model model) throws Exception{
        PetitionDTO petitionDTO = PetitionContentService.getArticle(num);
        List<CategoryDTO> categoryDTO = PetitionContentService.getCategoryList();
        String categoryName = "";
        
        for (int i=0; i<categoryDTO.size(); i++) {
            if (petitionDTO.getCategory() == categoryDTO.get(i).getNum()) {
                categoryName = categoryDTO.get(i).getCategoryName();
            }
        }
        
        PetitionIndicatorDTO petitionIndicatorDTO = PetitionContentService.getPetitionIndicator(num);
        
        int pState = 1;
        java.util.Date date = new Date();
        long time = date.getTime();
        Timestamp ts = new Timestamp(time);

        if(petitionDTO.getPetition() > 100) {
            pState = 2;
            
        }else if(ts.equals(petitionDTO.getEndDate()) && petitionDTO.getPetition() < 200000){
            pState = 3;
        }else if(ts.equals(petitionDTO.getEndDate()) && petitionDTO.getPetition() > 200000){
            pState = 4;
        }
        
        String petitionState = PetitionContentService.getPetitionState(pState);
        System.out.println(petitionState);
        
        
        
        
        
        model.addAttribute("categoryName", categoryName);       
        model.addAttribute("PetitionDTO",petitionDTO);
        model.addAttribute("petitionState",petitionState);
        model.addAttribute("petitionIndicatorDTO",petitionIndicatorDTO);
        return "petition/petitionContent";
    }
    
  
    @RequestMapping("petComment.aa")
    public String petCmtListAll(@RequestParam("petitionNum")int petitionNum,@RequestParam(defaultValue="1")int pageNum, Model model) throws Exception{
        int pageSize = 10;
        int currentPage = pageNum;
        int startRow = (currentPage - 1) * pageSize +1;
        int endRow = currentPage * pageSize;
        int count = 0;
        int number = 0;
        
        List<PetitionDTO> petCmtList = null;
        count = PetitionContentService.petCmtCount(petitionNum);
        if(count > 0) {
            petCmtList = PetitionContentService.petCmtList(petitionNum,startRow, endRow);
        } else {
            petCmtList = Collections.emptyList();
        }
        number = count-(currentPage-1)*pageSize;
        
        model.addAttribute("petitionPetitionerService", petitionPetitionerService);
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
    
    @RequestMapping("petitionCommentPro.aa")
    public String insertCmt(PetCommentDTO dto)throws Exception{
        String writerId = dto.getWriter();
        PetitionerDTO petitionerDTO = PetitionContentService.getPetitionerById(writerId);
        String gender = petitionerDTO.getGender();
        String birthday = petitionerDTO.getBirthday(); 
        
        if(Integer.parseInt(birthday) > 21) birthday = "19" + birthday;
        else birthday = "20" + birthday;
        
        int birthYear = Integer.parseInt(birthday.substring(0, 4));
        int age = LocalDate.now().getYear() - birthYear + 1;
          
        System.out.println("gender : " + gender + ", age : " + age + ", birthYear : " + birthYear);
        
        PetitionContentService.updateIndicator(dto.getPetitionNum(), gender, age);
        
        PetitionContentService.insertPetCmt(dto);
        PetitionContentService.updatePetitionCount(dto.getPetitionNum());
        petitionPetitionerService.insertMap(dto.getPetitionNum(), dto.getWriter());
        return "petition/petitionCommentPro";
    }
  


}
