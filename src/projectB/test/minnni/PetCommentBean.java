package projectB.test.minnni;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/petition/")
public class PetCommentBean {
	@Autowired
	private PetitionService petitionContentService = null;
	
	@RequestMapping("petComment.aa")
	public String insertCmt(PetCommentDTO dto,Model model)throws Exception{
		petitionContentService.insertCmt(dto);
		return "board/petitionComment";
	}
	
	@RequestMapping("petComment.aa")
	public String petCmtList(int petitionNum) throws Exception{
		return "board/petitionComment";
	}
	
	@RequestMapping("petComment.aa")
	public String petCmtCount()throws Exception{
		petitionContentService.petCmtCount();
		return "board/petitionComment";
	}
}
