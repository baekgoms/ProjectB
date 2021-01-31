package projectB.model.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import projectB.model.question.QuestionDTO;
import projectB.model.questionService.QuestionService;

@Controller
@RequestMapping("admin")
public class AdminQuestionController {
	private static final int QUESTION_LENGTH = 20;
	private static final int QUESTION_PAGE_LENGTH = 10;
	
	@Autowired
    private QuestionService questionDAO = null;
	
	@RequestMapping("question.aa")
	public String question(@RequestParam(defaultValue="1", required = true)int pageNum,
			@RequestParam(defaultValue="0", required = true)int sort,
			Model model) {
		try {
			
			
			int questionTotalCount = questionDAO.questionCount(sort);
			int startRow = (pageNum - 1) * QUESTION_LENGTH + 1;
			int endRow = (pageNum) * QUESTION_LENGTH;
			
			int pageTotalCount = questionTotalCount / QUESTION_LENGTH;
			if (questionTotalCount % QUESTION_LENGTH > 0)
				pageTotalCount++;
			
			int startPageIndex = (((pageNum - 1) / QUESTION_PAGE_LENGTH) * QUESTION_PAGE_LENGTH) + 1;
			int endPageIndex = startPageIndex + QUESTION_PAGE_LENGTH - 1;
			if (endPageIndex > pageTotalCount)
				endPageIndex = pageTotalCount;
			
			List<QuestionDTO> questions = questionDAO.questions(startRow, endRow, sort);
			
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("sort", sort);			
			model.addAttribute("questions", questions);
			model.addAttribute("questionCount", questions.size());
			model.addAttribute("pageTotalCount", pageTotalCount);
			model.addAttribute("startPageIndex", startPageIndex);
			model.addAttribute("endPageIndex", endPageIndex);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return "adminQuestion/adminQuestion";
	}
}
