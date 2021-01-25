package projectB.model.discussion;

import java.sql.ResultSet;

import projectB.model.BaseDTO;

public class CommentVoteDTO implements BaseDTO {
	private int num;
	private int discussionNum;
	private int commentNum;
	private String writer;
	private int state;
	public void setInfo(ResultSet rs) {
		try {
			setNum(rs.getInt("num"));
			setDiscussionNum(rs.getInt("discussionNum"));
			setCommentNum(rs.getInt("commentNum"));
			setWriter(rs.getString("writer"));
			setState(rs.getInt("state"));
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getDiscussionNum() {
		return discussionNum;
	}
	public void setDiscussionNum(int discussionNum) {
		this.discussionNum = discussionNum;
	}
	public int getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
}
