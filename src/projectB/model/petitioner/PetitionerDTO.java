package projectB.model.petitioner;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import projectB.model.BaseDTO;

public class PetitionerDTO implements BaseDTO{
	private int num;
	private String id;
	private String password;
	private String name;
	private String contact;
	private String email;
	private String gender;
	private int report;
	private int state;
	private int emailArg;	
	private Timestamp reg;
	private Timestamp blockReg;
	private int authKey;
	private String birthday;
	private Timestamp loginTime;
	private int warning;

	public void setInfo(ResultSet rs) {
		try {
			setNum(rs.getInt("num"));
			setId(rs.getString("id"));
			setPassword(rs.getString("password"));
			setName(rs.getString("name"));
			setContact(rs.getString("contact"));
			setEmail(rs.getString("email"));
			setGender(rs.getString("gender"));
			setReport(rs.getInt("report"));
			setState(rs.getInt("state"));
			setEmailArg(rs.getInt("emailArg"));
			setReg(rs.getTimestamp("reg"));
			setBlockReg(rs.getTimestamp("blockReg"));
			setAuthKey(rs.getInt("authKey"));
            setBirthday(rs.getString("birthday"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int getNum() { return num; }
	public void setNum(int num) { this.num = num; }
	public String getId() { return id; }
	public void setId(String id) { this.id = id; }
	public String getPassword() { return password; }
	public void setPassword(String password) { this.password = password; }
	public String getName() { return name; }
	public void setName(String name) { this.name = name; }
	public String getContact() { return contact; }
	public void setContact(String contact) { this.contact = contact; }
	public String getEmail() { return email; }
	public void setEmail(String email) { this.email = email; }
	public String getGender() { return gender; }
	public void setGender(String gender) { this.gender = gender; }
	public int getReport() { return report; }
	public void setReport(int report) { this.report = report; }
	public int getState() { return state; }
	public void setState(int state) { this.state = state; }
	public int getEmailArg() { return emailArg; }
	public void setEmailArg(int emailArg) { this.emailArg = emailArg; }
	public Timestamp getReg() { return reg; }
	public void setReg(Timestamp reg) { this.reg = reg; }
	public Timestamp getBlockReg() { return blockReg; }
	public void setBlockReg(Timestamp blockReg) { this.blockReg = blockReg; }
	public int getAuthKey() { return authKey; }
	public void setAuthKey(int authKey) { this.authKey = authKey; }
	public String getBirthday() { return birthday; }
	public void setBirthday(String birthday) { this.birthday = birthday; }
	public Timestamp getLoginTime() { return loginTime; }
	public void setLoginTime(Timestamp loginTime) { this.loginTime = loginTime; }
	public int getWarning() { return warning; }
	public void setWarning(int warning) { this.warning = warning; }
	
}
