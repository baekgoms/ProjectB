package projectB.model.question;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import projectB.model.petition.PetitionDTO;

@Controller
@RequestMapping("question")
public class QuestionController {

	 @RequestMapping("upload.aa")
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
	            //category = petitionDAO.getCategory();
	            //model.addAttribute("category", category);
	            //System.out.println("category size:"+category.size()+"\n"+category);
	        }   
	        
	        return "wooch/questionUploadForm";
	    }
	
}
