package projectB.test.minnni;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import projectB.model.BaseDTO;

public class PetCommentDTO implements BaseDTO{
	private int num;
	private String writer;
	private String content;
	private Timestamp reg;
	private int petitionNum;
		
	public void setInfo(ResultSet rs) {
		try {
			setNum(rs.getInt("num"));
			setWriter(rs.getString("writer"));
			setContent(rs.getString("content"));
			setReg(rs.getTimestamp("reg"));
			setPetitionNum(rs.getInt("petitionNum"));
				
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getReg() {
		return reg;
	}

	public void setReg(Timestamp reg) {
		this.reg = reg;
	}

	public int getPetitionNum() {
		return petitionNum;
	}

	public void setPetitionNum(int petitionNum) {
		this.petitionNum = petitionNum;
	}
}

