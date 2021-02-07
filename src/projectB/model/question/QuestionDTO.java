package projectB.model.question;

import java.sql.ResultSet;
import java.sql.Timestamp;

import projectB.model.BaseDTO;

public class QuestionDTO implements BaseDTO{

	private int num;
	private int category;
	private String title;
	private String content;
	private String writer;
	private int reply;
	private int grouping;
	private int group_depth;
	private int group_level;
	private int open;
	private Timestamp reg;
	
	@Override
	public void setInfo(ResultSet rs) {
		try {
			setNum(rs.getInt("num"));
			setCategory(rs.getInt("category"));
			setTitle(rs.getString("title"));
			setContent(rs.getString("content"));
			setWriter(rs.getString("writer"));
			setReply(rs.getInt("reply"));
			setGrouping(rs.getInt("grouping"));
			setGroup_depth(rs.getInt("group_depth"));
			setGroup_level(rs.getInt("group_level"));
			setOpen(rs.getInt("open"));
			setReg(rs.getTimestamp("reg"));
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

	public int getNum() { return num; }
	public void setNum(int num) { this.num = num; }
	public int getCategory() { return category; }
	public void setCategory(int category) { this.category = category; }
	public String getTitle() { return title; }
	public void setTitle(String title) { this.title = title; }
	public String getContent() { return content; }
	public void setContent(String content) { this.content = content; }
	public String getWriter() { return writer; }
	public void setWriter(String writer) { this.writer = writer; }
	public int getReply() { return reply; }
	public void setReply(int reply) { this.reply = reply; }
	public int getGrouping() { return grouping; }
	public void setGrouping(int grouping) { this.grouping = grouping; }
	public int getGroup_depth() { return group_depth; }
	public void setGroup_depth(int group_depth) { this.group_depth = group_depth; }
	public int getGroup_level() { return group_level; }
	public void setGroup_level(int group_level) { this.group_level = group_level; }
	public int getOpen() { return open; }
	public void setOpen(int open) { this.open = open; }
	public Timestamp getReg() { return reg; }
	public void setReg(Timestamp reg) { this.reg = reg; }

}
