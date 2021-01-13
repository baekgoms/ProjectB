package projectB.model;

import java.sql.Timestamp;

public class PetitionDTO {
	
	private int num;
	private String title;
	private String content;
	private int category;
	private Timestamp startDate;
	private Timestamp endDate;
	private String writer;
	private int petition;
	private int petitionSate;
	private String link;
	private int indicatorNum;
	private String tag;
	private int report;
	private int open;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public Timestamp getStartDate() {
		return startDate;
	}
	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}
	public Timestamp getEndDate() {
		return endDate;
	}
	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getPetition() {
		return petition;
	}
	public void setPetition(int petition) {
		this.petition = petition;
	}
	public int getPetitionSate() {
		return petitionSate;
	}
	public void setPetitionSate(int petitionSate) {
		this.petitionSate = petitionSate;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public int getIndicatorNum() {
		return indicatorNum;
	}
	public void setIndicatorNum(int indicatorNum) {
		this.indicatorNum = indicatorNum;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public int getReport() {
		return report;
	}
	public void setReport(int report) {
		this.report = report;
	}
	public int getOpen() {
		return open;
	}
	public void setOpen(int open) {
		this.open = open;
	}
	

}
