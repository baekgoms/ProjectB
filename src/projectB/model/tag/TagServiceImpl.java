package projectB.model.tag;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	@Override
	public List<TagDTO> getTags(int startRow, int endRow) throws SQLException{
		Map<String, Integer> map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		return dao.selectList("tags.getTags", map);
	}
}
