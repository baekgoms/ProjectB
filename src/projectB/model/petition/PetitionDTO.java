package projectB.model.petition;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import projectB.model.BaseDTO;

public class PetitionDTO implements BaseDTO{
	private int num;
	private String title;
	private String content;
	private int category;
	private Timestamp stateDate;
	private Timestamp endDate;
	private String writer;
	private int petition;
	private int petitionSate;
	private String link;
	private int indicatorNum;
	private String tag;
	private int report;
	private int open;
	
	public void setInfo(ResultSet rs) {
		try {
			setNum(rs.getInt("num"));
			setTitle(rs.getString("title"));
			setContent(rs.getString("content"));
			setCategory(rs.getInt("category"));
			setStateDate(rs.getTimestamp("stateDate"));
			setEndDate(rs.getTimestamp("endDate"));
			setWriter(rs.getString("writer"));
			setPetition(rs.getInt("petition"));
			setPetitionSate(rs.getInt("petitionSate"));
			setLink(rs.getString("link"));
			setIndicatorNum(rs.getInt("indicatorNum"));
			setTag(rs.getString("tag"));
			setReport(rs.getInt("report"));
			setOpen(rs.getInt("open"));
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}

	public int getNum() { return num; }
	public void setNum(int num) { this.num = num; }
	public String getTitle() { return title; }
	public void setTitle(String title) { this.title = title; }
	public String getContent() { return content; }
	public void setContent(String content) { this.content = content; }
	public int getCategory() { return category; }
	public void setCategory(int category) { this.category = category; }
	public Timestamp getStateDate() { return stateDate; }
	public void setStateDate(Timestamp stateDate) { this.stateDate = stateDate; }
	public Timestamp getEndDate() { return endDate; }
	public void setEndDate(Timestamp endDate) { this.endDate = endDate; }
	public String getWriter() { return writer; }
	public void setWriter(String writer) { this.writer = writer; }
	public int getPetition() { return petition; }
	public void setPetition(int petition) { this.petition = petition; }
	public int getPetitionSate() { return petitionSate; }
	public void setPetitionSate(int petitionSate) { this.petitionSate = petitionSate; }
	public String getLink() { return link; }
	public void setLink(String link) { this.link = link; }
	public int getIndicatorNum() { return indicatorNum; }
	public void setIndicatorNum(int indicatorNum) { this.indicatorNum = indicatorNum; }
	public String getTag() { return tag; }
	public void setTag(String tag) { this.tag = tag; }
	public int getReport() { return report; }
	public void setReport(int report) { this.report = report; }
	public int getOpen() { return open; }
	public void setOpen(int open) { this.open = open; }
}