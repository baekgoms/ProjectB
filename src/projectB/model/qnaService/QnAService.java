package projectB.model.qnaService;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import projectB.model.qna.QnADTO;

@Service("qnaService")
public class QnAService {
	@Autowired
	private SqlSessionTemplate dao;
	
	public QnADTO content(String keyword) {
		return dao.selectOne("qna.getContent", keyword);
	}
}
