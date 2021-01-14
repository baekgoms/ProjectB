package projectB.test.hj;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("disBoardCommDAO")
public class DisBoardCommDAO implements DisBoardCommService {
	
	@Override
	public int getCommentCount(int bnum) throws Exception {
		return 0;
	}

	@Override
	public List<DisBoardCommDTO> getCommentList(int bnum) throws Exception {
		return null;
	}

	@Override
	public void insertComment(DisBoardCommDTO comment) throws Exception {
		
	}

	@Override
	public int deleteComment(int num) throws Exception {
		return 0;
	}

	@Override
	public void up(int num) throws Exception {
		
	}

	@Override
	public void down(int num) throws Exception {
		
	}

	@Override
	public void report(int num) throws Exception {
		
	}

	@Override
	public void openStateCheck(int num) throws Exception {
		
	}

	@Override
	public void openStateOpen(int num) throws Exception {
		
	}

	@Override
	public void openStateClose(int num) throws Exception {
		
	}

	@Override
	public int grouping() throws Exception {
		return 0;
	}

	@Override
	public void depth(DisBoardCommDTO comment) throws Exception {
		
	}

}
