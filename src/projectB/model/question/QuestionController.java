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

import projectB.model.questionService.QuestionService;

@Controller
@RequestMapping("question")
public class QuestionController {

	@Autowired
    private QuestionService questionDAO = null;
	
	@RequestMapping("upload.aa")
    public String upload(QuestionDTO dto, Model model,HttpSession session) throws Exception {
        
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
            category = questionDAO.getCategory();
            model.addAttribute("category", category);
            System.out.println("category size:"+category.size()+"\n"+category);
        }   
        
        return "wooch/questionUploadForm";
    }
	 
	@RequestMapping("uploadPro.aa")
	public String writePro(QuestionDTO dto, HttpServletRequest request, HttpSession session) throws Exception{
       
		dto.setWriter((String)session.getAttribute("memId"));
		System.out.println("Writer:"+dto.getWriter());
		questionDAO.insertQuestion(dto);
		System.out.println("uploadPro run");
       
		return "wooch/uploadPro";
	}
	
	//==========================보기================================
	@RequestMapping("board2.aa")
    public String board2(QuestionDTO dto, Model model,HttpSession session) throws Exception {
        
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
            //category = questionDAO.getCategory();
            //model.addAttribute("category", category);
            //System.out.println("category size:"+category.size()+"\n"+category);
        }   
        
        return "wooch/questionBoard";
    }

	
	@RequestMapping("board.aa")
	public String board( Model model) throws Exception {
		//int pageSize = 12;
        //int currentPage = pageNum;
        //int startRow = (currentPage - 1) * pageSize + 1;
        //int endRow = currentPage * pageSize;
        //int count = 0;
        
        List<QuestionDTO> articleList = null;
        //count = questionDAO.getArticleCount();
        //if (count > 0) {
            articleList = questionDAO.getArticle();
        //} else {
        //    articleList = Collections.emptyList();
        //}
        //model.addAttribute("currentPage", new Integer(currentPage));
        //model.addAttribute("count", new Integer(count));
        model.addAttribute("articleList", articleList);
        //model.addAttribute("pageNum", new Integer(pageNum));
        
		return "wooch/questionBoard";
	}
	 
	
}
