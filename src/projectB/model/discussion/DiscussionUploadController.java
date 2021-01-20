package projectB.model.discussion;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import projectB.model.petition.DiscussionDTO;
import projectB.model.petitionService.PetitionService;
import projectB.model.petitionerService.PetitionerService;

@Controller
@RequestMapping("discussion")
public class DiscussionUploadController {

	@Autowired
    private PetitionService petitionDAO = null;
    
	@RequestMapping("upload.aa")
    public String discussionUpload(DiscussionDTO dto, Model model,HttpSession session) throws Exception {
        
        //임시 세션 아이디 입력
        session.setAttribute("memId", "홍우찬테스트");
        
        String id = (String) session.getAttribute("memId");
        System.out.println("session id:"+id);
        
        if(id != null) {
            
            List category = null;
            System.out.println("wooch discussionUploadForm run");
            
            model.addAttribute("dto", dto);
            dto.setWrite((String)session.getAttribute("memId"));
            System.out.println("Write:"+dto.getWrite());
        }   
        
        return "wooch/discussionUploadForm";
    }
    
   @RequestMapping("uploadPro.aa")
   public String discussionUploadPro(DiscussionDTO dto, HttpServletRequest request, HttpSession session) throws Exception{
           
       dto.setWrite((String)session.getAttribute("memId"));
       System.out.println("Write:"+dto.getWrite());
       petitionDAO.insertDiscussion(dto);
       System.out.println("discussion uploadPro run");
       
       return "wooch/discussionUploadPro";
   }
	
}
