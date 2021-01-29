package projectB.model.tag;

import java.sql.SQLException;

public interface TagService {
	public void insertTag(String tagName) throws SQLException;
	public void updateTag(String tagName) throws SQLException;
	public int checkTag(String tagName) throws SQLException;
}
