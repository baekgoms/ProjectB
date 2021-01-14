package projectB.test.hj;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import projectB.model.BaseDTO;

public class DisBoardCommDTO implements BaseDTO{

	private int num;
	private String write;
	private String content;
	private int imgState;
	private int up;
	private int down;
	private int grouping;
	private int depth;
	private int level;
	private Timestamp reg;
	private int report;
	private int publicState;
	private int discussionNum;
	
	@Override
	public void setInfo(ResultSet rs) {
		try {
			setNum(rs.getInt("num"));
			setWrite(rs.getString("write"));
			setContent(rs.getString("content"));
			setImgState(rs.getInt("imgState"));
			setUp(rs.getInt("up"));
			setDown(rs.getInt("down"));
			setGrouping(rs.getInt("grouping"));
			setDepth(rs.getInt("depth"));
			setLevel(rs.getInt("level"));
			setReg(rs.getTimestamp("reg"));
			setReport(rs.getInt("report"));
			setPublicState(rs.getInt("publicState"));
			setDiscussionNum(rs.getInt("discussionNum"));
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int getDiscussionNum() {
		return discussionNum;
	}
	public int getNum() {
		return num;
	}
	public String getWrite() {
		return write;
	}
	public String getContent() {
		return content;
	}
	public int getImgState() {
		return imgState;
	}
	public int getUp() {
		return up;
	}
	public int getDown() {
		return down;
	}
	public int getGrouping() {
		return grouping;
	}
	public int getDepth() {
		return depth;
	}
	public int getLevel() {
		return level;
	}
	public Timestamp getReg() {
		return reg;
	}
	public int getReport() {
		return report;
	}
	public int getPublicState() {
		return publicState;
	}
	
	public void setNum(int num) {
		this.num = num;
	}
	public void setWrite(String write) {
		this.write = write;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setImgState(int imgState) {
		this.imgState = imgState;
	}
	public void setUp(int up) {
		this.up = up;
	}
	public void setDown(int down) {
		this.down = down;
	}
	public void setGrouping(int grouping) {
		this.grouping = grouping;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public void setReg(Timestamp reg) {
		this.reg = reg;
	}
	public void setReport(int report) {
		this.report = report;
	}
	public void setPublicState(int publicState) {
		this.publicState = publicState;
	}
	public void setDiscussionNum(int discussionNum) {
		this.discussionNum = discussionNum;
	}
}
