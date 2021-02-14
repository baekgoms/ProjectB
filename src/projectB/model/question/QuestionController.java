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
       
		return "question/redirect";
	}
	
	//==========================보기================================
	@RequestMapping("board.aa")
	public String board( Model model, HttpSession session) throws Exception {
		System.out.println("question board start");
		String writer = LoginUtils.getLoginID(session);
		
        List<QuestionDTO> articleList = null;
        List category = null;
       
        
        category = questionDAO.getCategory();
        model.addAttribute("category", category);
        System.out.println("category size:"+category.size()+"\n"+category);
        
        articleList = questionDAO.getArticle(writer);
        model.addAttribute("articleList", articleList);
        System.out.println("question board finish");
		return "question/questionBoard";
	}
	 
	@RequestMapping("content.aa")
	public String content( Model model, int num, HttpSession session) throws Exception {
		System.out.println("===question content start===");
		
		String writer = LoginUtils.getLoginID(session);
		System.out.println("writer : " + writer);
		int same = 0;
        List<QuestionDTO> articleList = null;
        List category = null;
                
        category = questionDAO.getCategory();
        model.addAttribute("category", category);
        System.out.println("category size:"+category.size()+"\n"+category);
        
        articleList = questionDAO.getOneInfo(num);
        System.out.println("getWriter : " + articleList.get(0).getWriter());
        if(writer.equals(articleList.get(0).getWriter())) {
        	System.out.println("same writer.");
        	same = 1;
        }
        model.addAttribute("num", num);
        model.addAttribute("same", same);
        model.addAttribute("articleList", articleList);
        System.out.println("===question content finish===");
		return "question/questionContent";
	}
	
	@RequestMapping("delete.aa")
	public String delete( Model model, int num) throws Exception {
		System.out.println("question delete run.");
	       
        questionDAO.deleteQuestion(num);
       
		return "question/redirect";
	}
	

}
