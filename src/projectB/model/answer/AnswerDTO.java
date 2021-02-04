package projectB.model.answer;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import projectB.model.BaseDTO;

public class AnswerDTO implements BaseDTO{

  private int num;
  private int petitionNum;
  private int state;
  private int category;
  private String content;
  private String answerLink;
  private String name;
  private String department;
  private Timestamp answerDate;
  private int recommend;
  private int opposite;
  private int addition;
  private String id;
  private String content2;
  private int recommend2;
  private int opposite2;
  private int addition2;

  
  
  public void setInfo(ResultSet rs) {
    try {
        setNum(rs.getInt("num"));
        setPetitionNum(rs.getInt("petitionNum"));
        setCategory(rs.getInt("category"));
        setContent(rs.getString("content"));
        setAnswerLink(rs.getString("answerLink"));
        setName(rs.getString("name"));
        setDepartment(rs.getString("department"));
        setAnswerDate(rs.getTimestamp("answerDate"));
        setRecommend(rs.getInt("recommend"));
        setOpposite(rs.getInt("opposite"));
        setAddition(rs.getInt("addition"));
        setId(rs.getString("id"));
        setState(rs.getInt("state"));
        setContent2(rs.getString("content2"));
        setRecommend2(rs.getInt("recommend2"));
        setOpposite2(rs.getInt("opposite2"));
        setAddition2(rs.getInt("addition2"));
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
  public int getPetitionNum() {
    return petitionNum;
  }
  public void setPetitionNum(int petitionNum) {
    this.petitionNum = petitionNum;
  }
  public int getCategory() {
    return category;
  }
  public void setCategory(int category) {
    this.category = category;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public String getAnswerLink() {
    return answerLink;
  }
  public void setAnswerLink(String answerLink) {
    this.answerLink = answerLink;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getDepartment() {
    return department;
  }
  public void setDepartment(String department) {
    this.department = department;
  }
  public Timestamp getAnswerDate() {
    return answerDate;
  }
  public void setAnswerDate(Timestamp answerDate) {
    this.answerDate = answerDate;
  }
  public int getRecommend() {
    return recommend;
  }
  public void setRecommend(int recommend) {
    this.recommend = recommend;
  }
  public int getOpposite() {
    return opposite;
  }
  public void setOpposite(int oppsite) {
    this.opposite = oppsite;
  }
  public int getAddition() {
    return addition;
  }
  public void setAddition(int addition) {
    this.addition = addition;
  }
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }
 
  public int getState() {
    return state;
  }


  public void setState(int state) {
    this.state = state;
  }

  public String getContent2() {
    return content2;
  }


  public void setContent2(String content2) {
    this.content2 = content2;
  }


  public int getRecommend2() {
    return recommend2;
  }


  public void setRecommend2(int recommend2) {
    this.recommend2 = recommend2;
  }


  public int getOpposite2() {
    return opposite2;
  }


  public void setOpposite2(int opposite2) {
    this.opposite2 = opposite2;
  }


  public int getAddition2() {
    return addition2;
  }


  public void setAddition2(int addition2) {
    this.addition2 = addition2;
  }

}
