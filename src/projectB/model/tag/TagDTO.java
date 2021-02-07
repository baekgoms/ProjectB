package projectB.model.tag;

import java.sql.ResultSet;

import projectB.model.BaseDTO;

public class TagDTO implements BaseDTO {
	private String name;
	private int cumulative;

	public void setInfo(ResultSet rs) {
		try {
			setName(rs.getString("name"));
			setCumulative(rs.getInt("cumulative"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getName() { return name; }
	public int getCumulative() { return cumulative; }

	public void setName(String name) { this.name = name; }
	public void setCumulative(int cumulative) { this.cumulative = cumulative; }
}
