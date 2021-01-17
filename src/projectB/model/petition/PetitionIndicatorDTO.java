package projectB.model.petition;

import java.sql.ResultSet;
import java.sql.SQLException;

import projectB.model.BaseDTO;

public class PetitionIndicatorDTO implements BaseDTO{

	private int num;
	private int manCount;
	private int womanCount;
	private int teens;
	private int twenties;
	private int thirties;
	private int forties;
	private int fifties;
	private int sixties;
	
	public void setInfo(ResultSet rs) {
		try {
			setNum(rs.getInt("num"));
			setManCount(rs.getInt("manCount"));
			setWomanCount(rs.getInt("womanCount"));
			setTeens(rs.getInt("teens"));
			setTwenties(rs.getInt("twenties"));
			setThirties(rs.getInt("thirties"));
			setForties(rs.getInt("forties"));
			setFifties(rs.getInt("fifties"));
			setSixties(rs.getInt("sixties"));
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

	public int getManCount() {
		return manCount;
	}

	public void setManCount(int manCount) {
		this.manCount = manCount;
	}

	public int getWomanCount() {
		return womanCount;
	}

	public void setWomanCount(int womanCount) {
		this.womanCount = womanCount;
	}

	public int getTeens() {
		return teens;
	}

	public void setTeens(int teens) {
		this.teens = teens;
	}

	public int getTwenties() {
		return twenties;
	}

	public void setTwenties(int twenties) {
		this.twenties = twenties;
	}

	public int getThirties() {
		return thirties;
	}

	public void setThirties(int thirties) {
		this.thirties = thirties;
	}

	public int getForties() {
		return forties;
	}

	public void setForties(int forties) {
		this.forties = forties;
	}

	public int getFifties() {
		return fifties;
	}

	public void setFifties(int fifties) {
		this.fifties = fifties;
	}

	public int getSixties() {
		return sixties;
	}

	public void setSixties(int sixties) {
		this.sixties = sixties;
	}
	
}	