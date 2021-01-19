package projectB.model.discussionCommService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import projectB.model.discussion.DisBoardCommDTO;

@Service("disBoardCommService")
public class DisBoardCommServiceImpl implements DisBoardCommService {
	
	@Autowired
	private SqlSessionTemplate dao;
	
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
		System.out.println("getComments / " + map);
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
	public int deleteComment(int num) throws Exception {
		return 0;
	}

	@Override
	public void up(int num) throws Exception {
		
	}

	@Override
	public void down(int num) throws Exception {
		
	}

	@Override
	public void report(int num) throws Exception {
		
	}

	@Override
	public void openStateCheck(int num) throws Exception {
		
	}

	@Override
	public void openStateOpen(int num) throws Exception {
		
	}

	@Override
	public void openStateClose(int num) throws Exception {
		
	}

	@Override
	public int grouping() throws Exception {
		return 0;
	}

	@Override
	public void depth(DisBoardCommDTO comment) throws Exception {
		
	}

}
