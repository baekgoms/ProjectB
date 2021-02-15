package projectB.model.admin;

import java.sql.ResultSet;
import java.sql.SQLException;

import projectB.model.BaseDTO;

public class AdminReportDTO implements BaseDTO{

	private int num;
	private int sort;
	private String title;
	private String writer;
	private int report;
	
	@Override
	public void setInfo(ResultSet rs) {
		try {
			setNum(rs.getInt("num"));
			setSort(rs.getInt("sort"));
			setTitle(rs.getString("title"));
			setWriter(rs.getString("writer"));
			setReport(rs.getInt("report"));
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int getNum() {return num;}
	public void setNum(int num) {this.num = num;}
	public String getTitle() { return title; }
	public void setTitle(String title) { this.title = title; }
	public String getWriter() { return writer; }
	public void setWriter(String writer) { this.writer = writer; }
	public int getReport() { return report; }
	public void setReport(int report) { this.report = report; }
	public int getSort() { return sort; }
	public void setSort(int sort) { this.sort = sort; } 
	
}
