package projectB.test.hj;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import projectB.model.petition.CategoryDTO;
import projectB.model.petition.DiscussionDTO;
import projectB.model.petition.PetitionDTO;
import projectB.model.petition.petitionStateDTO;
import projectB.model.petitioner.PetitionerDTO;

public interface MypageService {
	public List<PetitionDTO> getMyPetitions(int start, int end, String memId) throws Exception;
	public int getArticleCount(String memId) throws Exception;
	public List<Integer> getMyAgrees(String memId) throws Exception;
	public List<PetitionDTO> getMyAgree(int start, int end, int num) throws Exception;
	public List<CategoryDTO> getCategoryList() throws Exception;
	public List<petitionStateDTO> getStateList() throws Exception;
	public int getAgreesCount (String memId) throws Exception;
	
	public int getDiscussionCount(String memId) throws Exception;
	public List<DiscussionDTO> getMyDisArticles(int start, int end, String memId) throws Exception;
	
	public int getDisCommentCount(String memId) throws Exception;
	public List<Integer> getMyDisComms(String memId) throws Exception;
	public List<DiscussionDTO> getMyDisCommArticle(int start, int end, int num) throws Exception;
	
	public PetitionerDTO getMember(String memId) throws Exception;
	public String getPasswordById(String memId) throws Exception;
	public void modifyPetitioner(PetitionerDTO member) throws Exception;
	public int passwordCheck(String password1, String password2) throws Exception;
	
	public List<InterestTagDTO> getTagList(String id) throws Exception;
	public boolean checkTag(String tag, String id) throws Exception;
	public void insertTag(String tag, String id) throws Exception;
	public void deleteTag(String tag, String id) throws Exception;
	
	public List<PetitionDTO> getArticlesHaveTag() throws Exception;
	public Map<String, Integer> matchCheck(List<String> tags, ArrayList<String> myTags, int a) throws Exception;
	public int matchKeyword(String tag, List<PetitionDTO> articleList) throws Exception;
	public List<PetitionDTO> getArticleByNum(int num) throws Exception;
}
