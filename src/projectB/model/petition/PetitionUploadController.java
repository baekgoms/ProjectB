package projectB.model.petition;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import projectB.model.login.LoginUtils;
import projectB.model.petition.DiscussionDTO;
import projectB.model.petition.PetitionDTO;
import projectB.model.petitionService.PetitionService;
import projectB.model.petitionerService.PetitionerService;
import projectB.model.tag.TagService;

@Controller
@RequestMapping("petition")
public class PetitionUploadController {
	
	@Autowired
    private PetitionService petitionDAO = null;
	
	@Autowired
	private TagService tagService;
	
    @RequestMapping("upload.aa")
    public String upload_petition(PetitionDTO dto, Model model,HttpSession session) throws Exception {
    	System.out.println("uploadForm run");
		List category = null;

		model.addAttribute("dto", dto);
		dto.setWriter((String)session.getAttribute("memId"));
		// System.out.println("Writer:"+dto.getWriter());
		category = petitionDAO.getCategory();
		model.addAttribute("category", category);
		// System.out.println("category size:"+category.size()+"\n"+category);
        
        return "petition/uploadForm";
    }
    
   @RequestMapping("uploadPro.aa")
   public String writePro(PetitionDTO dto, HttpServletRequest request, HttpSession session) throws Exception{
	   System.out.println("uploadPro run");    
       
       dto.setWriter(LoginUtils.getLoginID(session));
       System.out.println("Writer:"+dto.getWriter());
       petitionDAO.insertArticle(dto);
       System.out.println("getTags:"+dto.getTags());
       if(dto.getTags() != null) {
	       for(String s : dto.getTags()) {
	    	   int result = tagService.checkTag(s);
				if (result > 0) {
					tagService.updateTag(s);
				} else {
					tagService.insertTag(s);
	    	   }
	       }
       }
       return "petition/uploadPro";
   }
   
   
 

}
