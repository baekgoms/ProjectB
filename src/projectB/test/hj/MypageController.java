package projectB.test.hj;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import projectB.model.petition.CategoryDTO;
import projectB.model.petition.DiscussionDTO;
import projectB.model.petition.PetitionDTO;
import projectB.model.petition.petitionStateDTO;
import projectB.model.petitioner.PetitionerDTO;


@Controller
@RequestMapping("mypage")
public class MypageController {
	
	@Autowired
	private MypageService mypageService = null;
	
	@RequestMapping("main.aa")
		public String main(@RequestParam(defaultValue="1")int pageNum, 
				@RequestParam(defaultValue="1")int content,
				Model model,HttpSession session) throws Exception{
			//임시 세션 아이디 입력
			session.setAttribute("memId", "123");
			String memId = (String) session.getAttribute("memId");

			int pageSize = 10;
			int currentPage = pageNum;
			int startRow = (currentPage - 1) * pageSize +1;
			int endRow = currentPage * pageSize;
			int count = 0;
			int number = 0;
			List<PetitionDTO> myPetitionList = null;
			List<Integer> numList = null;
			ArrayList<List<PetitionDTO>> agreesList = new ArrayList<List<PetitionDTO>>();
			
			if (content == 1) {
				count = mypageService.getArticleCount(memId);
				if(count > 0) {
					myPetitionList = mypageService.getMyPetitions(startRow, endRow, memId);
				} else {
					myPetitionList = Collections.emptyList();
				}
			}
			if(content == 2) {
				count = mypageService.getAgreesCount(memId);
				if(count > 0) {
					numList = mypageService.getMyAgrees(memId);
					for(int i = 0; i < numList.size(); i++) {
					
					myPetitionList = mypageService.getMyAgree(startRow, endRow, numList.get(i));
					agreesList.add(i, myPetitionList);
					}
				} else {
					myPetitionList = Collections.emptyList();
				}
			}
	        number = count-(currentPage-1)*pageSize;
	        
	        System.out.println(count + "//count");
	        System.out.println(myPetitionList.size() + "//size");
	        
	        List<CategoryDTO> getCategory = mypageService.getCategoryList();
	        List<petitionStateDTO> state = null;
	        state = mypageService.getStateList();
	        
	        model.addAttribute("currentPage", new Integer(currentPage));
	        model.addAttribute("count", new Integer(count));
	        model.addAttribute("pageSize", new Integer(pageSize));
	        model.addAttribute("number", new Integer(number));
	        model.addAttribute("myPetitionList", myPetitionList);
	        model.addAttribute("pageNum", new Integer(pageNum));
	        model.addAttribute("category", getCategory);
	        model.addAttribute("state", state);
	        model.addAttribute("agreesList", agreesList);
	        model.addAttribute("content", content);
			return "mypage/main";
		}
	
	@RequestMapping("mydiscussion.aa")
		public String mydiscussion(@RequestParam(defaultValue="1" , required = true)int pageNum, 
				@RequestParam(defaultValue="1" , required = true)int content,
				Model model,HttpSession session) throws Exception{
		
		session.setAttribute("memId", "asd");
		String memId = (String) session.getAttribute("memId");
		
		int pageSize = 12;
        int currentPage = pageNum;
        int startRow = (currentPage - 1) * pageSize + 1;
        int endRow = currentPage * pageSize;
        int count = 0;
        
        List<DiscussionDTO> myDiscussionList = null;
        List<Integer> numList = null;
        ArrayList<List<DiscussionDTO>> commList = new ArrayList<List<DiscussionDTO>>();
        
        if (content == 1) {
			count = mypageService.getDiscussionCount(memId);
			if(count > 0) {
				myDiscussionList = mypageService.getMyDisArticles(startRow, endRow, memId);
			} else {
				myDiscussionList = Collections.emptyList();
			}
		}
		if(content == 2) {
			count = mypageService.getDisCommentCount(memId);
			if(count > 0) {
				numList = mypageService.getMyDisComms(memId);
				for(int i = 0; i < numList.size(); i++) {
				
				myDiscussionList = mypageService.getMyDisCommArticle(startRow, endRow, numList.get(i));
				commList.add(i, myDiscussionList);
				}
			} else {
				myDiscussionList = Collections.emptyList();
			}
		}

        model.addAttribute("currentPage", new Integer(currentPage));
        model.addAttribute("count", new Integer(count));
        model.addAttribute("pageSize", new Integer(pageSize));
        model.addAttribute("myDiscussionList", myDiscussionList);
        model.addAttribute("pageNum", new Integer(pageNum));
        model.addAttribute("commList", commList);
        model.addAttribute("content", content);

		return "mypage/mydiscussion";
	}
	
	@RequestMapping("modify.aa")
	public String modify(Model model, HttpSession session) throws Exception{
		//임시 ID
		session.setAttribute("memId", "123");
		
		String memId = (String) session.getAttribute("memId");
		PetitionerDTO member = mypageService.getMember(memId);
		
		model.addAttribute("member", member);

	return "mypage/modify";
	}
	@RequestMapping("modifyPro.aa")
	public String modifyPro(PetitionerDTO member, HttpSession session, 
			@RequestParam(defaultValue="" , required = true)String newPassword, Model model) throws Exception{
		//임시 ID
		session.setAttribute("memId", "123");
		
		String memId = (String) session.getAttribute("memId");
		String inputPassword = member.getPassword();
		String dbPassword = mypageService.getPasswordById(memId);
		int check = mypageService.passwordCheck(inputPassword, dbPassword);
		if(!newPassword.equals(inputPassword)) {
			member.setPassword(newPassword);
		}
		
		mypageService.modifyPetitioner(member);

		model.addAttribute("check", new Integer(check));
		return "mypage/modifyPro";
	}
	
	@RequestMapping("keyword.aa")
	public String keyword(Model model,HttpSession session) throws Exception{
	
		session.setAttribute("memId", "123");
		String memId = (String) session.getAttribute("memId");
		List<InterestTagDTO> tagList = mypageService.getTagList(memId);
		model.addAttribute("tagList", tagList);

		return "mypage/keyword";
	}
	
	@RequestMapping("keywordInsert.aa")
	public String keywordInsert(String tag, HttpSession session) throws Exception{
		
		session.setAttribute("memId", "123");
		String memId = (String) session.getAttribute("memId");
		System.out.println("컨트롤러"+tag);
		boolean check = mypageService.checkTag(tag, memId);
		if(!check) {
			return "mypage/same";
		}
		mypageService.insertTag(tag, memId);
		
		return "redirect:/mypage/keyword.aa";
	}
	
	@RequestMapping("keywordDelete.aa")
	public String keywordDelete(String tag,HttpSession session) throws Exception{
		
		session.setAttribute("memId", "123");
		String memId = (String) session.getAttribute("memId");
		mypageService.deleteTag(tag, memId);
		
		return "redirect:/mypage/keyword.aa";
	}
	
	@RequestMapping("keywordNews.aa")
	public String keywordNews(@RequestParam(defaultValue="1" , required = true)int pageNum,
				Model model,HttpSession session) throws Exception{
		
		session.setAttribute("memId", "123");
		String memId = (String) session.getAttribute("memId");
		
		int pageSize = 10;
        int currentPage = pageNum;
        int start = (currentPage - 1) * pageSize;
        int end = currentPage * pageSize-1;
        
        //사용자 아이디로 등록된 키워드 검색
		List<InterestTagDTO> tagList = mypageService.getTagList(memId);
		if(tagList == null){
			return "mypage/nokeyword";
		}
		
		ArrayList<String> myTags = new ArrayList<String>();
		for(int i = 0; i < tagList.size() ; i ++) {
			String tag = tagList.get(i).getTagName();
			myTags.add(tag);
		}
		
		List<PetitionDTO> finalArticleList = new ArrayList<PetitionDTO>();
		List<Integer> matchNumList = new ArrayList<Integer>();
		
		// 태그가 있는 청원리스트 가져오기
		List<PetitionDTO> articleList= mypageService.getArticlesHaveTag();
		Map<String, Integer> result = new HashMap<String, Integer>();
		int a = 0;
		for(int i = 0 ; i < articleList.size() ; i++ ){
			PetitionDTO article = articleList.get(i);
			List<String> tags = Arrays.asList(article.getTag().split(","));
			result = mypageService.matchCheck(tags, myTags, i);
			int ha = result.get("check");
			if(ha == 1) {
				int num = result.get("num");
				matchNumList.add(a, num);
				a++;
			}
		}
		System.out.println("matchNumList"+matchNumList);
		
		for(int i = 0; i < matchNumList.size(); i++) {
			int num = matchNumList.get(i);
			PetitionDTO article = articleList.get(num);
			finalArticleList.add(article);
		}
		
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("pageNum", new Integer(pageNum));
		model.addAttribute("tagArticleList", finalArticleList);
		
		return "mypage/keywordNews";
	}
}
