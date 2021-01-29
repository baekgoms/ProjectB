package projectB.model.tag;

import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("tagService")
public class TagServiceImpl implements TagService {
	@Autowired
	private SqlSessionTemplate dao = null;
	
	@Override
	public void insertTag(String tagName) throws SQLException {
		dao.insert("tags.insertTag", tagName);
	}
	
	@Override
	public void updateTag(String tagName) throws SQLException {
		dao.update("tags.updateCumulativeTag", tagName);
	}
	
	@Override
	public int checkTag(String tagName) throws SQLException {
		return dao.selectOne("tags.checkTag", tagName);
	}
}
