package projectB.model.petitionService;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import projectB.model.petition.PetitionDTO;


@Controller
@RequestMapping("petition")
public class PetitionBean {
	
	@Autowired
	private PetitionService dao = null;
	
	@RequestMapping("uploadForm.aa")
	public String upload(PetitionDTO dto, Model model) throws Exception {
		//List category = null;
		System.out.println("wooch uploadForm run");
		model.addAttribute("dto", dto);
		//category = dao.getCategory();
		
		//System.out.println(category);
		
		return "wooch/uploadForm";
	}
	
   @RequestMapping("uploadPro.aa")
   public String writePro(PetitionDTO dto, HttpServletRequest request) throws Exception{
	   	   
	   dao.insertArticle(dto);
	   
	   System.out.println("uploadPro run");
	   
	   return "wooch/uploadPro";
   }
	
	
	
	
	
	
	
	
	
}

