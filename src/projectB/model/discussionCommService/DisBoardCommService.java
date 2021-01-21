package projectB.model.discussionCommService;

import java.util.List;

import projectB.model.discussion.CommentVoteDTO;
import projectB.model.discussion.DisBoardCommDTO;

public interface DisBoardCommService {
	public int getMaxNumber(int discussionNum) throws Exception;
	public int getCommentCount(int discussionNum) throws Exception;
	public List<DisBoardCommDTO> getComments(int discussionNum, int startRow, int endRow) throws Exception;
	public List<DisBoardCommDTO> getCommentsByDiscussionNum(int discussionNum) throws Exception;
	public void insertComment(DisBoardCommDTO comment) throws Exception;
	
	//int deleteComment(int num) throws Exception;
	
	public void addUp(int num) throws Exception;
	public void addDown(int num) throws Exception;
	public void subUp(int num) throws Exception;
	public void subDown(int num) throws Exception;

	public int getNextDepth(int discussionNum, int grouping) throws Exception;
	
	public void updateDepth(int grouping, int depth);
	public void updateGrouping(int num);
	
	public void insertCommentVote(CommentVoteDTO parameter);
	public List<CommentVoteDTO> getCmmVotes(int discussionNum, String writer);
	public CommentVoteDTO getCmmVote(int discussionNum, int commentNum, String writer);
	public int checkCommentVote(int discussionNum, int commentNum, String writer);
	public void deleteCmVote(CommentVoteDTO parameter);
	public int getCmmVoteCount(int discussionNum, String writer);
}
