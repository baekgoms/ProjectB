package projectB.model.discussionCommService;

import java.util.List;

import projectB.model.discussion.DisBoardCommDTO;

public interface DisBoardCommService {
	public int getMaxNumber(int discussionNum) throws Exception;
	public int getCommentCount(int discussionNum) throws Exception;
	public List<DisBoardCommDTO> getComments(int discussionNum, int startRow, int endRow) throws Exception;
	public List<DisBoardCommDTO> getCommentsByDiscussionNum(int discussionNum) throws Exception;
	public void insertComment(DisBoardCommDTO comment) throws Exception;
	int deleteComment(int num) throws Exception;
	public void up(int num) throws Exception;
	public void down(int num) throws Exception;
	public void report (int num) throws Exception;
	public void openStateCheck (int num) throws Exception;
	public void openStateOpen (int num) throws Exception;
	public void openStateClose (int num) throws Exception;
	
	public int grouping() throws Exception;
	public int getNextDepth(int discussionNum, int grouping) throws Exception;
	
	public void updateDepth(int grouping, int depth);
	public void updateGrouping(int num);
	

}
