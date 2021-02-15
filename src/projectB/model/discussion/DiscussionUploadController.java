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
import projectB.model.tag.TagService;

@Controller
@RequestMapping("discussion")
public class DiscussionUploadController {

	@Autowired
    private PetitionService petitionDAO = null;
	@Autowired
	private TagService tagService;
	
	@RequestMapping("upload.aa")
    public String upload_discussion(DiscussionDTO dto, Model model,HttpSession session) throws Exception {
		System.out.println("discussion uploadForm run");
		List category = null;
		model.addAttribute("dto", dto);
		dto.setWrite((String) session.getAttribute("memId"));
		
        return "discussion/discussionUploadForm";
    }
    
   @RequestMapping("uploadPro.aa")
   public String discussionUploadPro(DiscussionDTO dto, HttpServletRequest request, HttpSession session) throws Exception{
           
       dto.setWrite((String)session.getAttribute("memId"));
       System.out.println("Write:"+dto.getWrite());
       petitionDAO.insertDiscussion(dto);
       
       if (dto.getTags().get(0) != null) {
			for (String s : dto.getTags()) {
				int result = tagService.checkTag(s);
				if (result > 0) {
					tagService.updateTag(s);
				} else {

					if (s != null && s != "") {
						tagService.insertTag(s);
					}
				}
			}
		}
       
       System.out.println("discussion uploadPro run");
       
       return "discussion/discussionUploadPro";
   }
	
}
