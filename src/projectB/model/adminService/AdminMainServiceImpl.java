package projectB.model.adminService;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import projectB.model.petition.PetitionDTO;

@Service("adminDAO")
public class AdminMainServiceImpl implements AdminMainService{

	@Autowired
	private SqlSessionTemplate dao = null;
	
	//==========1번 라인===============
	@Override
	public int getCountPetitionerToday() throws Exception {
		
		Date time = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMdd");
		String today = format1.format(time);
		
		return dao.selectOne("adminMain.getCountPetitionerToday", today);
	}

	@Override
	public double getPercentPetitionerToday() throws Exception {
		
		Date time = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMdd");
		String today = format1.format(time);
		
		int CountTillYesterday = dao.selectOne("adminMain.getCountPetitionerTillYesterday", today);
		System.out.println("Impl CountTillYesterday : "+CountTillYesterday);
		
		double OnePercent = CountTillYesterday / 100;
		double percent = OnePercent / getCountPetitionerToday();;
		percent = Math.round(percent*100)/100.0; 
		
		if(CountTillYesterday == 0) { percent = 100; }
		
		System.out.println("Impl percent : "+percent);
		return percent;
	}

	//==========2번 라인===============
	@Override
	public List<PetitionDTO> getTopPetition() throws Exception {
		
		Date time = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMM");
		String thisMonth = format1.format(time);
		
		List<PetitionDTO> TopPetition = dao.selectList("adminMain.getTopPetition", thisMonth);
		
		return TopPetition;
	}
	
	@Override
	public int getPercentTopPetition() throws Exception {
		
		
		
		return 0;
	}


}
