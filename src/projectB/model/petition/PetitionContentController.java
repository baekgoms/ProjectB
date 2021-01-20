package projectB.model.petition;

import java.time.LocalDate;
import java.util.Collections;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import projectB.model.petitionContentService.PetitionContentService;
import projectB.model.petitionContentService.PetitionPetitionerMapService;
import projectB.model.petitioner.PetitionerDTO;

@Controller
@RequestMapping("petition")
public class PetitionContentController {
  
    @Autowired
    private PetitionContentService petitionDAO = null;
    
    @Autowired
    private PetitionPetitionerMapService petitionPetitionerService = null;
  
   
    @RequestMapping("petContent.aa")
    public String petContent(int num, Model model) throws Exception{
        PetitionDTO petDTO = petitionDAO.getArticle(num);
        List<CategoryDTO> categoryDTO = petitionDAO.getCategoryList();
        String categoryName = "";
        
        for (int i=0; i<categoryDTO.size(); i++) {
            if (petDTO.getCategory() == categoryDTO.get(i).getNum()) {
                categoryName = categoryDTO.get(i).getCategoryName();
            }
        }
        
        PetitionIndicatorDTO petitionIndicatorDTO = petitionDAO.getPetitionIndicator(num);
        
        model.addAttribute("categoryName", categoryName);       
        model.addAttribute("petDTO",petDTO);
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
        count = petitionDAO.petCmtCount(petitionNum);
        if(count > 0) {
            petCmtList = petitionDAO.petCmtList(petitionNum,startRow, endRow);
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
        PetitionerDTO petitionerDTO = petitionDAO.getPetitionerById(writerId);
        String gender = petitionerDTO.getGender();
        String birthday = petitionerDTO.getBirthday(); 
        
        if(Integer.parseInt(birthday) > 21) birthday = "19" + birthday;
        else birthday = "20" + birthday;
        
        int birthYear = Integer.parseInt(birthday.substring(0, 4));
        int age = LocalDate.now().getYear() - birthYear + 1;
          
        System.out.println("gender : " + gender + ", age : " + age + ", birthYear : " + birthYear);
        
        petitionDAO.updateIndicator(dto.getPetitionNum(), gender, age);
        
        petitionDAO.insertPetCmt(dto);
        petitionDAO.updatePetitionCount(dto.getPetitionNum());
        petitionPetitionerService.insertMap(dto.getPetitionNum(), dto.getWriter());
        return "petition/petitionCommentPro";
    }
  


}
