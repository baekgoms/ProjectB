package projectB.model.petition;

import java.sql.ResultSet;
import java.sql.SQLException;
import projectB.model.BaseDTO;

public class petitionStateDTO implements BaseDTO{
    private int num;
    private String state;
    
    
    public void setInfo(ResultSet rs) {
      try {
          setNum(rs.getInt("num"));
          setState(rs.getString("state"));
          
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
    public String getState() {
      return state;
    }
    public void setState(String state) {
      this.state = state;
    }
}
