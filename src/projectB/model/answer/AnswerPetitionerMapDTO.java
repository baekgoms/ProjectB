package projectB.model.answer;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AnswerPetitionerMapDTO {

  private int num;
  private int answerNum;
  private String petitioner;
  private int type;
  
  
  public void setInfo(ResultSet rs) {
    try {
        setNum(rs.getInt("num"));
        setAnswerNum(rs.getInt("answerNum"));
        setPetitioner(rs.getString("petitioner"));
        setType(rs.getInt("type"));
    }
    catch(SQLException e) {
        e.printStackTrace();
    }
}
  
  public int getNum() {
    return num;
  }
  public void setNum(int num) {
    this.num = num;
  }
  public int getAnswerNum() {
    return answerNum;
  }
  public void setAnswerNum(int answerNum) {
    this.answerNum = answerNum;
  }
  public String getPetitioner() {
    return petitioner;
  }
  public void setPetitioner(String petitioner) {
    this.petitioner = petitioner;
  }
  public int getType() {
    return type;
  }
  public void setType(int type) {
    this.type = type;
  }
}
