package projectB.model.petition;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import projectB.model.petition.DiscussionDTO;
import projectB.model.petition.PetitionDTO;
import projectB.model.petitionService.PetitionService;
import projectB.model.petitionerService.PetitionerService;

@Controller
@RequestMapping("petition")
public class PetitionUploadController {
	
	@Autowired
    private PetitionService petitionDAO = null;
    
    //====================================우찬=================================
    @RequestMapping("uploadForm.aa")
    public String upload(PetitionDTO dto, Model model,HttpSession session) throws Exception {
        
        //임시 세션 아이디 입력
        session.setAttribute("memId", "홍우찬테스트");
        
        String id = (String) session.getAttribute("memId");
        System.out.println("session id:"+id);
        
        if(id != null) {
            
            List category = null;
            System.out.println("wooch uploadForm run");
            
            model.addAttribute("dto", dto);
            dto.setWriter((String)session.getAttribute("memId"));
            System.out.println("Writer:"+dto.getWriter());
            category = petitionDAO.getCategory();
            model.addAttribute("category", category);
            System.out.println("category size:"+category.size()+"\n"+category);
        }   
        
        return "petition/uploadForm";
    }
    
   @RequestMapping("uploadPro.aa")
   public String writePro(PetitionDTO dto, HttpServletRequest request, HttpSession session) throws Exception{
           
       
       dto.setWriter((String)session.getAttribute("memId"));
       System.out.println("Writer:"+dto.getWriter());
       petitionDAO.insertArticle(dto);
       System.out.println("uploadPro run");
       
       return "petition/uploadPro";
   }
   
   
   

}
