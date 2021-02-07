package projectB.model.discussion;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import projectB.model.BaseDTO;

public class DisBoardCommDTO implements BaseDTO{

	private int num;
	private int discussionNum;
	private String writer;
	private String content;
	private int imgState;
	private int up;
	private int down;
	private int report;
	private int open;	
	private int grouping;
	private int depth;
//	private int level;
	private Timestamp reg;
	
	@Override
	public void setInfo(ResultSet rs) {
		try {
			setNum(rs.getInt("num"));
			setWriter(rs.getString("writer"));
			setContent(rs.getString("content"));
			setImgState(rs.getInt("imgState"));
			setUp(rs.getInt("up"));
			setDown(rs.getInt("down"));
			setGrouping(rs.getInt("grouping"));
			setDepth(rs.getInt("depth"));
//			setLevel(rs.getInt("level"));
			setReg(rs.getTimestamp("reg"));
			setReport(rs.getInt("report"));
			setOpen(rs.getInt("open"));
			setDiscussionNum(rs.getInt("discussionNum"));
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int getDiscussionNum() { return discussionNum; }
	public int getNum() { return num; }
	public String getWriter() { return writer; }
	public String getContent() { return content; }
	public int getImgState() { return imgState; }
	public int getUp() { return up;	}
	public int getDown() { return down; }
	public Timestamp getReg() { return reg; }
	public int getReport() { return report; }
	public int getOpen() { return open; }
	public int getGrouping() { return grouping; }
	public int getDepth() { return depth; }
//	public int getLevel() {
//		return level;
//	}
	
	
	public void setNum(int num) { this.num = num; }
	public void setWriter(String writer) { this.writer = writer; }
	public void setContent(String content) { this.content = content; }
	public void setImgState(int imgState) { this.imgState = imgState; }
	public void setUp(int up) { this.up = up; }
	public void setDown(int down) { this.down = down; }
	public void setReg(Timestamp reg) { this.reg = reg; }
	public void setReport(int report) { this.report = report; }
	public void setOpen(int open) { this.open = open; }
	public void setDiscussionNum(int discussionNum) { this.discussionNum = discussionNum; }
	public void setGrouping(int grouping) { this.grouping = grouping; }
	public void setDepth(int depth) { this.depth = depth; }
//	public void setLevel(int level) {
//		this.level = level;
//	}
	
}
