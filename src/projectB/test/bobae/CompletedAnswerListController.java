package projectB.test.bobae;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import projectB.model.answer.AnswerDTO;
import projectB.model.petition.PetitionDTO;


@Controller
@RequestMapping("answer")
public class CompletedAnswerListController {
	
	@Autowired
	private CompletedAnswerListService completedAnswerService = null;

	 @RequestMapping("completedAnswer.aa")
	    public String completedAnswer(@RequestParam(defaultValue="1")int pageNum, Model model) throws Exception{
	        
	     int pageSize = 6;
	     int currentPage = pageNum;
	     int startRow = (currentPage -1) * pageSize +1;
	     int endRow = currentPage * pageSize;
	     int count = 0;
	     int number = 0;
	     int state = 5;
	     
	     List<PetitionDTO> petitionInfo = new ArrayList<>();
	     List<AnswerDTO> comAnswer = null;
	     count = completedAnswerService.completedAnswerCount(state);
	     if(count > 0) {
	    	 comAnswer = completedAnswerService.getAnswerListbyState (state, startRow, endRow);
	    	 
	    	 for(int i=0; i <comAnswer.size(); i++) {
	    		 PetitionDTO Info = completedAnswerService.getInfobyNum(comAnswer.get(i).getPetitionNum());
	    		 petitionInfo.add(Info);
	    	 }
	    	 
	     } else {
	    	 comAnswer = Collections.emptyList();
	     }
	     number = count - (currentPage-1)*pageSize;
	     
	     System.out.println(comAnswer.size()+": size");
	     System.out.println("finish Test");
	     System.out.println(count +": count");
	     System.out.println(state+ " :state");
	     
	     
	     model.addAttribute("currentPage", new Integer(currentPage));
	     model.addAttribute("startRow", new Integer(startRow));
	     model.addAttribute("endRow", new Integer(endRow));
	     model.addAttribute("count", new Integer(count));
	     model.addAttribute("pageSize", new Integer(pageSize));
	     model.addAttribute("number", new Integer(number));
	     model.addAttribute("pageNum", new Integer(pageNum));
	     model.addAttribute("comAnswer", comAnswer);
	     model.addAttribute("petitionInfo",petitionInfo);
	     
	        return "petition/completedAnswer";
	    }
}
