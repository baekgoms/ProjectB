package projectB.model.discussionCommService;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import projectB.model.discussion.DisBoardCommDTO;

@Service("disBoardCommService")
public class DisBoardCommServiceImpl implements DisBoardCommService {
	
	@Autowired
	private SqlSessionTemplate dao;
	
	@Override
	public int getCommentCount(int bnum) throws Exception {
		return 0;
	}

	@Override
	public List<DisBoardCommDTO> getCommentListByDiscussionNum(int discussionNum) throws Exception {
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
