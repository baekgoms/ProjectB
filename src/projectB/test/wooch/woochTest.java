package projectB.test.wooch;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import projectB.model.petition.DiscussionDTO;
import projectB.model.petition.PetitionDTO;
import projectB.model.petitioner.PetitionerDTO;

@Controller
@RequestMapping("wooch")
public class woochTest {
	
	@Autowired
	private SqlSessionTemplate dao = null;
	
	@RequestMapping("test.aa")
	public String test(Model model) {
		System.out.println("====wooch test controller start===");
		
		int open = 0;
		List<PetitionDTO> petition = dao.selectList("adminReport.getPetition", open);
		List<DiscussionDTO> discussion = dao.selectList("adminReport.getDiscussion", open);
		
		model.addAttribute("petition", petition);
		model.addAttribute("discussion", discussion);
		
		
		System.out.println("====wooch test controller finish===");
		return "wooch/test";
	}
	
}

