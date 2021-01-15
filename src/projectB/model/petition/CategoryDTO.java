package projectB.model.petition;

import java.sql.ResultSet;
import java.sql.SQLException;

import projectB.model.BaseDTO;

public class CategoryDTO implements BaseDTO{

	private int num;
	private String categoryName;
	
	@Override
	public void setInfo(ResultSet rs) {
		try {
			setNum(rs.getInt("num"));
			setCategoryName(rs.getString("categoryName"));
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int getNum() {return num;}
	public void setNum(int num) {this.num = num;}
	public String getCategoryName() {return categoryName;}
	public void setCategoryName(String categoryName) {this.categoryName = categoryName;}

}
