package projectB.test.hj;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("discussion")
public class Discussion {
	@Autowired
	private DisBoardService boardDAO = null;
	
	@RequestMapping("main.aa")
	public String main(int pageNum, Model model) throws Exception {
		int pageSize = 20;
        int currentPage = pageNum;
        int startRow = (currentPage - 1) * pageSize + 1;
        int endRow = currentPage * pageSize;
        int count = 0;
        int number=0;
        
        List<DisBoardDTO> articleList = null;
        count = boardDAO.getArticleCount();
        if (count > 0) {
            articleList = boardDAO.getArticles(startRow, endRow);//현재 페이지에 해당하는 글 목록
        } else {
            articleList = Collections.emptyList();
        }
        number=count-(currentPage-1)*pageSize;

        model.addAttribute("currentPage", new Integer(currentPage));
        model.addAttribute("startRow", new Integer(startRow));
        model.addAttribute("endRow", new Integer(endRow));
        model.addAttribute("count", new Integer(count));
        model.addAttribute("pageSize", new Integer(pageSize));
        model.addAttribute("number", new Integer(number));
        model.addAttribute("articleList", articleList);
        model.addAttribute("pageNum", new Integer(pageNum));
        
		return "discussion/main";
	}
	
	@RequestMapping("writeForm.aa")
    public String writeForm(Model model, DisBoardDTO dto, int pageNum){
		model.addAttribute("dto", dto);
        model.addAttribute("pageNum", new Integer(pageNum));
		return "discussion/writeForm";
	}
	
	@RequestMapping("writePro.aa")
    public String writePro(DisBoardDTO dto, int pageNum,Model model) throws Exception{
		boardDAO.insertArticle(dto);
        model.addAttribute("pageNum", new Integer(pageNum));
		return "discussion/writePro";
	}
	
	@RequestMapping("updatePro.aa")
    public String updatePro(){
		return "discussion/updatePro";
	}

	@RequestMapping("updateForm.aa")
    public String updateForm(int num, Model model) throws Exception{
		DisBoardDTO article = boardDAO.updateGetArticle(num);
		model.addAttribute("article", article);
		return "discussion/updateForm";
	}
	
	@RequestMapping("deletePro.aa")
    public String deletePro(int num, int pageNum, Model model) throws Exception{
		boardDAO.deleteArticle(num);
        model.addAttribute("pageNum", new Integer(pageNum));
		return "discussion/deletePro";
	}
	
	@RequestMapping("content.aa")
    public String content(int num, int pageNum, Model model) throws Exception{
		DisBoardDTO article = boardDAO.getArticle(num);
		
		model.addAttribute("num", new Integer(num));
        model.addAttribute("pageNum", new Integer(pageNum));
        model.addAttribute("article", article);
		return "discussion/content";
	}
}
