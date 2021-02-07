package projectB.model.question;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import projectB.model.login.LoginUtils;
import projectB.model.questionService.QuestionService;

@Controller
@RequestMapping("question")
public class QuestionController {

	@Autowired
    private QuestionService questionDAO = null;
	
	//==========================올리기================================
	@RequestMapping("upload.aa")
    public String upload_question(QuestionDTO dto, Model model,HttpSession session) throws Exception {
		System.out.println("upload_question run");
        
		String id = LoginUtils.getLoginID(session);
		System.out.println("session id:" + id);

		List category = null;

		model.addAttribute("dto", dto);
		dto.setWriter((String) session.getAttribute("memId"));
		category = questionDAO.getCategory();
		model.addAttribute("category", category);
		
        return "question/questionUploadForm";
    }
	 
	@RequestMapping("uploadPro.aa")
	public String writePro(QuestionDTO dto, HttpServletRequest request, HttpSession session) throws Exception{
       
		dto.setWriter((String)session.getAttribute("memId"));
		System.out.println("Writer:"+dto.getWriter());
		questionDAO.insertQuestion(dto);
		System.out.println("uploadPro run");
       
		return "question/uploadPro";
	}
	
	//==========================보기================================
	@RequestMapping("board.aa")
	public String board( Model model) throws Exception {
		
        List<QuestionDTO> articleList = null;
        List category = null;
        System.out.println("wooch board run");
        
        category = questionDAO.getCategory();
        model.addAttribute("category", category);
        System.out.println("category size:"+category.size()+"\n"+category);
        
        articleList = questionDAO.getArticle();
        model.addAttribute("articleList", articleList);
        
		return "question/questionBoard";
	}
	 
	@RequestMapping("content.aa")
public String content( Model model, int num) throws Exception {
		
        List<QuestionDTO> articleList = null;
        List category = null;
        System.out.println("wooch board run");
                
        category = questionDAO.getCategory();
        model.addAttribute("category", category);
        System.out.println("category size:"+category.size()+"\n"+category);
        
        articleList = questionDAO.getOneInfo(num);
        model.addAttribute("articleList", articleList);
        
		return "question/questionContent";
	}
	
}
