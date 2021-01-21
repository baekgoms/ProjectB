package projectB.model.discussionCommService;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import projectB.model.discussion.CommentVoteDTO;
import projectB.model.discussion.DisBoardCommDTO;

@Service("disBoardCommService")
public class DisBoardCommServiceImpl implements DisBoardCommService {
	@Autowired
	private SqlSessionTemplate dao;	
	
	@Override
	public CommentVoteDTO getCmmVote(int discussionNum, int commentNum, String writer) {
		Map<String, Object> map = new HashMap<>();
		map.put("discussionNum", discussionNum);
		map.put("commentNum", commentNum);
		map.put("writer", writer);
		return dao.selectOne("disBoardComment.getCommentVote", map);
	}
	@Override
	public int checkCommentVote(int discussionNum, int commentNum, String writer) {
		Map<String, Object> map = new HashMap<>();
		map.put("discussionNum", discussionNum);
		map.put("commentNum", commentNum);
		map.put("writer", writer);
		return dao.selectOne("disBoardComment.checkCommentVote", map);
	}
	
	@Override
	public int getMaxNumber(int discussionNum) throws Exception {
		return dao.selectOne("disBoardComment.getMaxNumber", discussionNum);
	}
	
	@Override
	public int getNextDepth(int discussionNum, int grouping) throws Exception{
		Map<String, Integer> map = new HashMap<>();
		map.put("discussionNum", discussionNum);
		map.put("grouping", grouping);
		return dao.selectOne("disBoardComment.getNextDepth", map);
	}
	
	@Override
	public int getCommentCount(int discussionNum) throws Exception {
		return dao.selectOne("disBoardComment.getCommentCountByDiscussionNum", discussionNum);
	}
	
	@Override
	public List<DisBoardCommDTO> getComments(int discussionNum, int startRow, int endRow) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		map.put("discussionNum", discussionNum);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return dao.selectList("disBoardComment.getCommentsByStartAndEnd", map);
	}

	@Override
	public List<DisBoardCommDTO> getCommentsByDiscussionNum(int discussionNum) throws Exception {
		return dao.selectList("disBoardComment.selectCommentByDiscussionNum", discussionNum);
	}

	@Override
	public void insertComment(DisBoardCommDTO comment) throws Exception {
		dao.insert("disBoardComment.insertComment", comment);
	}
	
	@Override
	public void updateDepth(int grouping, int depth) {
		Map<String, Integer> map = new HashMap<>();
		map.put("grouping", grouping);
		map.put("depth", depth);
		
		dao.insert("disBoardComment.updateDepth", map);
	}
	
	@Override
	public void updateGrouping(int num) {
		dao.insert("disBoardComment.updateGrouping", num);
	}
	
	@Override
	public void addUp(int num) throws Exception {
		dao.update("disBoardComment.add_up", num);
	}
	
	@Override
	public void addDown(int num) throws Exception {
		dao.update("disBoardComment.add_down", num);
	}
	
	@Override
	public void subUp(int num) throws Exception {
		dao.update("disBoardComment.sub_up", num);
	}
	
	@Override
	public void subDown(int num) throws Exception {
		dao.update("disBoardComment.sub_down", num);
	}
	
	@Override
	public void insertCommentVote(CommentVoteDTO parameter) {
		dao.insert("disBoardComment.insertCommentVote", parameter);
	}
	
	@Override
	public void deleteCmVote(CommentVoteDTO parameter) {
		dao.delete("disBoardComment.deleteCmVote", parameter);
	}
	
	@Override
	public List<CommentVoteDTO> getCmmVotes(int discussionNum, String writer) {
		Map<String, Object> map = new HashMap<>();
		map.put("discussionNum", discussionNum);
		map.put("writer", writer);
		return dao.selectList("disBoardComment.getCmmVotes", map);
	}
	
	@Override
	public int getCmmVoteCount(int discussionNum, String writer) {
		Map<String, Object> map = new HashMap<>();
		map.put("discussionNum", discussionNum);
		map.put("writer", writer);
		return dao.selectOne("disBoardComment.getCmmVoteCount", map);
	}

	
	/*
	 * @Override public List<DisBoardCommDTO> getCommentsByDiscussionNum(int
	 * discussionNum) throws Exception { return
	 * dao.selectList("disBoardComment.selectCommentByDiscussionNum",
	 * discussionNum); }
	 */

//	@Override
//	public int deleteComment(int num) throws Exception {
//		return 0;
//	}

}