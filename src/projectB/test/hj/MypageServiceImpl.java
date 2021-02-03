package projectB.test.hj;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import projectB.model.petition.CategoryDTO;
import projectB.model.petition.DiscussionDTO;
import projectB.model.petition.PetitionDTO;
import projectB.model.petition.petitionStateDTO;
import projectB.model.petitioner.PetitionerDTO;

@Service("mypageService")
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	private SqlSessionTemplate dao = null;
	
	@Autowired
	private MypageService mypageService = null;
	
	
	@Override
	public List<PetitionDTO> getMyPetitions(int start, int end, String memId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start",start);
		map.put("end",end);
		map.put("memId",memId);
		List<PetitionDTO> articleList = dao.selectList("mypage.getArticles", map);
		return articleList;
	}

	@Override
	public int getArticleCount(String memId) throws Exception {
		int a = dao.selectOne("mypage.getArticleCount", memId);
		return a;
	}
	
	
	@Override
	public int getAgreesCount(String memId) throws Exception {
		int a = dao.selectOne("mypage.getAgreesCount", memId);
		return a;
	}
	
	@Override
	public List<Integer> getMyAgrees(String memId) throws Exception {
		List<Integer> numList = null;
		numList = dao.selectList("mypage.getAgrees",memId);
		return numList;
	}

	@Override
	public List<PetitionDTO> getMyAgree(int start, int end, int num) throws Exception {
		List<PetitionDTO> agreeList = null;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start",start);
		map.put("end",end);
		map.put("num",num);
		agreeList = dao.selectList("mypage.getAgree", map);
		return agreeList;
	}
	
	@Override
    public List<CategoryDTO> getCategoryList() throws Exception {
		List<CategoryDTO> categoryList = dao.selectList("petition.getCategoryList");
        return categoryList;
    }

	@Override
	public List<petitionStateDTO> getStateList() throws Exception {
		List<petitionStateDTO> state = null;
		state = dao.selectList("mypage.getStateList");
		return state;
	}

	@Override
	public int getDiscussionCount(String memId) throws Exception {
		int a = dao.selectOne("mypage.getDisCount", memId);
		return a;
	}

	@Override
	public List<DiscussionDTO> getMyDisArticles(int start, int end, String memId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start",start);
		map.put("end",end);
		map.put("memId",memId);
		List<DiscussionDTO> discussionList = dao.selectList("mypage.getDis", map);
		return discussionList;
	}

	@Override
	public int getDisCommentCount(String memId) throws Exception {
		int a = dao.selectOne("mypage.getDisCommCount", memId);
		return a;
	}

	@Override
	public List<Integer> getMyDisComms(String memId) throws Exception {
		List<Integer> numList = dao.selectList("mypage.getDisCommNum", memId);
		return numList;
	}

	@Override
	public List<DiscussionDTO> getMyDisCommArticle(int start, int end, int num) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start",start);
		map.put("end",end);
		map.put("num",num);
		List<DiscussionDTO> discussionList = dao.selectList("mypage.getDisByNum", map);
		return discussionList;
	}

	@Override
	public PetitionerDTO getMember(String memId) throws Exception {
		PetitionerDTO member = dao.selectOne("mypage.getMember", memId);
		return member;
	}
	
	@Override
	public String getPasswordById(String memId) throws Exception {
		String password = dao.selectOne("mypage.getPassword", memId);
		return password;
	}
	
	@Override
	public void modifyPetitioner(PetitionerDTO member) throws Exception {
		dao.update("mypage.modifyPetitioner", member);
	}

	@Override
	public int passwordCheck(String password1, String password2) throws Exception {
		int check = 0;
		if(password1.equals(password2)) {
			check = 1;
		}
		return check;
	}

	@Override
	public List<InterestTagDTO> getTagList(String memId) throws Exception {
		List<InterestTagDTO> tagList = dao.selectList("mypage.getTagList",memId);
		return tagList;
	}
	
	@Override
	public boolean checkTag(String tag, String memId) throws Exception {
		boolean check = false;
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId",memId);
		map.put("tagName",tag);
		int a = dao.selectOne("mypage.checkTag", map);
		if(a == 0) {
			check = true;
		}
		return check;
	}

	@Override
	public void insertTag(String tag, String memId) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("tagName",tag);
		map.put("userId",memId);
		dao.update("mypage.insertTag", map);
	}

	@Override
	public void deleteTag(String tag, String memId) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("tagName",tag);
		map.put("userId",memId);
		dao.delete("mypage.deleteTag", map);
	}

	@Override
	public List<PetitionDTO> getArticlesHaveTag() throws Exception {
		List<PetitionDTO> tagArticle = null; 
		tagArticle = dao.selectList("mypage.getArticlesHaveTag");
		return tagArticle;
	}

	@Override
	public Map<String, Integer> matchCheck(List<String> tags, ArrayList<String> myTags, int ab) throws Exception {
		Map<String, Integer> result = new HashMap<String, Integer>();
		loop:
		for(int a = 0 ; a < tags.size(); a++) {
			String tag = tags.get(a);
			for(int i = 0 ; i < myTags.size() ; i ++){
				if(tag.equals(myTags.get(i))){
					result.put("check", 1);
					result.put("num", ab);
					break loop;
				}
			}
			result.put("check", 0);
			result.put("num", 0);
		}
		return result;
	}

	@Override
	public int matchKeyword(String tag, List<PetitionDTO> articleList) throws Exception {
		int a = articleList.size();
		int num = 0;
		for(int i = 0; i < a ; i++){
			PetitionDTO article = articleList.get(i);
			//System.out.println(article);
			List<String> tags = Arrays.asList(article.getTag().split(","));
			//System.out.println("태그들 : "+tags);
			if(tags.contains(tag)) {
				num = article.getNum();
			}
		} return num;
	}


	@Override
	public List<PetitionDTO> getArticleByNum(int num) throws Exception {
		List<PetitionDTO> article = dao.selectList("mypage.getMatchArticle", num);
		return article;
	}
}
