package projectB.model.question;

import java.sql.ResultSet;
import java.sql.Timestamp;

import projectB.model.BaseDTO;

public class QuestionCommentDTO implements BaseDTO{

	private int num;
	private String content;
	private String writer;
	private Timestamp reg;
	
	@Override
	public void setInfo(ResultSet rs) {
		try {
			setNum(rs.getInt("num"));
			setContent(rs.getString("content"));
			setWriter(rs.getString("writer"));
			setReg(rs.getTimestamp("reg"));
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

	public int getNum() { return num; }
	public void setNum(int num) { this.num = num; }
	public String getContent() { return content; }
	public void setContent(String content) { this.content = content; }
	public String getWriter() { return writer; }
	public void setWriter(String writer) { this.writer = writer; }
	public Timestamp getReg() { return reg; }
	public void setReg(Timestamp reg) { this.reg = reg; }

}
