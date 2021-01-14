package projectB.test.hj;

import java.util.List;

public interface DisBoardCommService {
	public int getCommentCount(int bnum) throws Exception;
	public List<DisBoardCommDTO> getCommentList(int bnum) throws Exception;
	public void insertComment(DisBoardCommDTO comment) throws Exception;
	int deleteComment(int num) throws Exception;
	public void up(int num) throws Exception;
	public void down(int num) throws Exception;
	public void report (int num) throws Exception;
	public void openStateCheck (int num) throws Exception;
	public void openStateOpen (int num) throws Exception;
	public void openStateClose (int num) throws Exception;
	
	public int grouping() throws Exception;
	public void depth(DisBoardCommDTO comment) throws Exception;
	

}
