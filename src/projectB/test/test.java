package projectB.test;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import projectB.model.petition.PetitionDTO;
import projectB.model.petitionService.PetitionService;
import projectB.test.hj.DisBoardDTO;
import projectB.test.hj.DisBoardService;

@Controller
@RequestMapping("myTest")
public class test {
	@Autowired
	private DisBoardService disBoardDAO = null;
	
	@Autowired
	private PetitionService petitionDAO = null;
	
	@RequestMapping("testing.aa")
	public String testing() {

		System.out.println("test run~~~!");
		System.out.println("//"+petitionDAO);
		
//		Random rd = new Random();
//		for(int i = 1; i <= 115; ++i) {
//			PetitionDTO dto = new PetitionDTO();
//			int tagCount = rd.nextInt(4) + 1;
//			int report = rd.nextInt(10) + 1;
//			
//			dto.setTitle("제목_" + i);
//			dto.setContent("점심 뭐먹을까?_" + i);
//			dto.setWriter("청원자_" + i);
//			dto.setLink("");
//			dto.setReport(report);
//			if(report >= 10)
//				dto.setOpen(1);
//
//			String strSplit[] = ("호빵,토론,지코바,치킨").split(",");
//			String str = "";
//			for(int j = 0; j < tagCount; ++j) {
//				str += strSplit[j];
//				if( j < tagCount - 1 )
//					str += ",";
//			}	
//			dto.setTag(str);
//						
//			try {
//				petitionDAO.insertArticle(dto);
//			}
//			catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//		
//		for(int i = 1; i <= 105; ++i) {
//			DisBoardDTO dto = new DisBoardDTO();
//			int agreement = rd.nextInt(10) + 1;
//			int opposition = rd.nextInt(10) + 1;
//			int report = rd.nextInt(10) + 1;
//			int tagCount = rd.nextInt(4);
//			
//			dto.setSubject("토론_" + i);
//			dto.setWrite("작성자_" + i);
//			dto.setContent("아침에 호빵 마싯다_" + i);
//			String strSplit[] = ("호빵,토론,지코바,치킨").split(",");
//			String str = "";
//			for(int j = 0; j < tagCount; ++j) {
//				str += strSplit[j];
//				if( j < tagCount - 1 )
//					str += ",";
//			}	
//			dto.setTag(str);
//			dto.setAgreement(agreement);
//			dto.setOpposition(opposition);
//			dto.setReport(report);
//			if(report >= 10)
//				dto.setOpen(1);
//					
//			try {
//				disBoardDAO.insertArticle(dto);	
//			}
//			catch (Exception e) {
//				e.printStackTrace();
//			}	
//		}
			
		

		return "test/Test";
	}
	
	@RequestMapping("nana1.aa")
	public String num01() {
		System.out.println("test run");
		return "test/n1";
	}
	@RequestMapping("nana2.aa")
	public String num02() {
		System.out.println("test run");
		return "test/n2";
	}

}
