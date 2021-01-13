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
            articleList = Collections.EMPTY_LIST;
        }
        number=count-(currentPage-1)*pageSize;

        model.addAttribute("currentPage", new Integer(currentPage));
        model.addAttribute("startRow", new Integer(startRow));
        model.addAttribute("endRow", new Integer(endRow));
        model.addAttribute("count", new Integer(count));
        model.addAttribute("pageSize", new Integer(pageSize));
        model.addAttribute("number", new Integer(number));
        model.addAttribute("articleList", articleList);
        
		return "discussion/main";
	}
	
	@RequestMapping("writeForm.aa")
    public String WriteForm(){
		return "discussion/writeForm";
	}
	
	@RequestMapping("writePro.aa")
    public String WritePro(){
		return "discussion/writePro";
	}

}
