package projectB.model.petition;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import projectB.model.BaseDTO;

public class DiscussionDTO implements BaseDTO{
	private int num;
	private String write;
	private String content;
	private Timestamp reg;
	private int agreement;
	private int opposition;
	private String tag;
	private int report;
	private int open;
	private String subject;
	private String link;
	
	@Override
	public void setInfo(ResultSet rs) {
		try {
			setNum(rs.getInt("num"));
			setWrite(rs.getString("write"));
			setContent(rs.getString("content"));
			setReg(rs.getTimestamp("reg"));
			setAgreement(rs.getInt("agreement"));
			setOpposition(rs.getInt("opposition"));
			setTag(rs.getString("tag"));
			setReport(rs.getInt("report"));
			setOpen(rs.getInt("open"));
			setSubject(rs.getString("subject"));
			setLink(rs.getString("link"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public String getSubject() { return subject; }
	public int getNum() { return num; }
	public String getWrite() { return write; }
	public String getContent() { return content; }
	public Timestamp getReg() { return reg; }
	public int getAgreement() { return agreement; }
	public int getOpposition() { return opposition; }
	public String getTag() { return tag; }
	public int getReport() { return report; }
	public int getOpen() { return open; }
	public String getLink() { return link; }
	
	public void setNum(int num) { this.num = num; }
	public void setWrite(String write) { this.write = write; }
	public void setContent(String content) { this.content = content; }
	public void setReg(Timestamp reg) { this.reg = reg; }
	public void setAgreement(int agreement) { this.agreement = agreement; }
	public void setOpposition(int opposition) { this.opposition = opposition; }
	public void setTag(String tag) { this.tag = tag; }
	public void setReport(int report) { this.report = report; }
	public void setOpen(int open) { this.open = open; }
	public void setSubject(String subject) { this.subject = subject; } 
	public void setLink(String link) { this.link = link; }
	
	
}
