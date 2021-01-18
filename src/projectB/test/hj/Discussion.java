package projectB.test.hj;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import projectB.model.petition.DiscussionDTO;

@Controller
@RequestMapping("discussion")
public class Discussion {
	
	@Autowired
	private DisBoardService disBoardDAO = null;
	
	@Autowired
	private DisBoardCommService disBoardCommDAO = null;
	
	@RequestMapping("main.aa")
	public String main(
			@RequestParam(defaultValue="1" , required = true)int pageNum, Model model) throws Exception {
		int pageSize = 12;
        int currentPage = pageNum;
        int startRow = (currentPage - 1) * pageSize + 1;
        int endRow = currentPage * pageSize;
        int count = 0;
        
        List<DiscussionDTO> articleList = null;
        count = disBoardDAO.getArticleCount();
        if (count > 0) {
            articleList = disBoardDAO.getArticles(startRow, endRow);
        } else {
            articleList = Collections.emptyList();
        }
        model.addAttribute("currentPage", new Integer(currentPage));
        model.addAttribute("startRow", new Integer(startRow));
        model.addAttribute("endRow", new Integer(endRow));
        model.addAttribute("count", new Integer(count));
        model.addAttribute("pageSize", new Integer(pageSize));
        model.addAttribute("articleList", articleList);
        model.addAttribute("pageNum", new Integer(pageNum));
        
		return "discussion/main";
	}
	@RequestMapping("mainBest.aa")
	public String mainBest(@RequestParam(defaultValue="1" , required = true)int sort, Model model) throws Exception {
		int listSize = 5;
		int number = 1;
        
        List<DiscussionDTO> articleList = null;
        List<DiscussionDTO> articleCList = null;
        if(sort == 1) {
	        articleList = disBoardDAO.getBestArticles(1,listSize, sort);
	        articleCList = disBoardDAO.getBestCArticles(1, listSize, sort);
        } else {
        	articleList = disBoardDAO.getBestArticles(1,listSize, sort);
	        articleCList = disBoardDAO.getBestCArticles(1, listSize, sort);
        }
        
        model.addAttribute("listSize", new Integer(listSize));
        model.addAttribute("articleList", articleList);
        model.addAttribute("articleCList", articleCList);
        model.addAttribute("sort", new Integer(sort));
        model.addAttribute("number", new Integer(number));
        
		return "discussion/mainBest";
	}
	@RequestMapping("mainSearch.aa")
	public String mainSearch(
			@RequestParam(defaultValue="1" , required = true)int pageNum, Model model, String keyword) throws Exception {
		int pageSize = 12;
        int currentPage = pageNum;
        int startRow = (currentPage - 1) * pageSize + 1;
        int endRow = currentPage * pageSize;
        int count = 0;
        
        List<DiscussionDTO> articleList = null;
        count = disBoardDAO.getArticleCount(keyword);
        if (count > 0) {
            articleList = disBoardDAO.getArticles(startRow, endRow, keyword);
        } else {
            articleList = Collections.emptyList();
        }
        
        model.addAttribute("currentPage", new Integer(currentPage));
        model.addAttribute("startRow", new Integer(startRow));
        model.addAttribute("endRow", new Integer(endRow));
        model.addAttribute("count", new Integer(count));
        model.addAttribute("pageSize", new Integer(pageSize));
        model.addAttribute("articleList", articleList);
        model.addAttribute("pageNum", new Integer(pageNum));
        model.addAttribute("keyword", keyword);
        
		return "discussion/main";
	}
	
	@RequestMapping("writeForm.aa")
    public String writeForm(Model model, DiscussionDTO dto, int pageNum){
		model.addAttribute("dto", dto);
        model.addAttribute("pageNum", new Integer(pageNum));
		return "discussion/writeForm";
	}
	
	@RequestMapping("writePro.aa")
    public String writePro(DiscussionDTO dto, int pageNum, Model model) throws Exception{
		disBoardDAO.insertArticle(dto);
        model.addAttribute("pageNum", new Integer(pageNum));
		return "discussion/writePro";
	}
	
	@RequestMapping("updatePro.aa")
    public String updatePro(){
		return "discussion/updatePro";
	}

	@RequestMapping("updateForm.aa")
    public String updateForm(int num, Model model) throws Exception{
		DiscussionDTO article = disBoardDAO.getArticle(num);
		model.addAttribute("article", article);
		return "discussion/updateForm";
	}
	
	@RequestMapping("deletePro.aa")
    public String deletePro(int num, int pageNum, Model model) throws Exception{
		disBoardDAO.deleteArticle(num);
        model.addAttribute("pageNum", new Integer(pageNum));
		return "discussion/deletePro";
	}
	
	@RequestMapping("content.aa")
    public String content(@RequestParam(defaultValue="356" , required = true)int num, 
    		@RequestParam(defaultValue="1" , required = true)int pageNum, Model model) throws Exception {
		System.out.println("content run/" + num);
		
		DiscussionDTO article = disBoardDAO.getArticle(num);
		if (article == null) {
			return "redriect:dadasd.aa"; // 게시물이 없다는 오류 페이지로 보여주기!
		}
		
		List<String> tags = new ArrayList<>(
				Arrays.asList(article.getTag().split(","))
		);	
		// System.out.println(tags);
		
		model.addAttribute("num", num);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("article", article);
        model.addAttribute("tags", tags);
        
		return "discussion/content";
	}

	@RequestMapping("commentWritePro.aa")
    public String writePro(DisBoardCommDTO dto, Model model) throws Exception{
		disBoardCommDAO.insertComment(dto);
		return "discussion/commentWritePro";
	}
}
