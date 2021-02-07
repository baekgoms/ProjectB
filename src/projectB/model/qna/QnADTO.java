package projectB.model.qna;

import java.sql.ResultSet;
import java.sql.SQLException;

import projectB.model.BaseDTO;

public class QnADTO implements BaseDTO {

	private int num;
	private String keyword;
	private String content;
	
	@Override
	public void setInfo(ResultSet rs) {
		try {
			setNum(rs.getInt("num"));
			setKeyword(rs.getString("keyword"));
			setContent(rs.getString("content"));		
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
