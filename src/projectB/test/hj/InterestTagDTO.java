package projectB.test.hj;

import java.sql.ResultSet;
import java.sql.SQLException;

import projectB.model.BaseDTO;

public class InterestTagDTO implements BaseDTO{
	private int num;
	private String tagName;
	private String userId;
	public int getNum() {
		return num;
	}
	public String getTagName() {
		return tagName;
	}
	public String getUserId() {
		return userId;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Override
	public void setInfo(ResultSet rs) {
		try {
			setNum(rs.getInt("num"));
			setUserId(rs.getString("userId"));
			setTagName(rs.getString("tagName"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
