package projectB.model.adminService;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import projectB.model.petition.DiscussionDTO;
import projectB.model.petition.PetitionDTO;

@Service("adminDAO")
public class AdminMainServiceImpl implements AdminMainService{

	@Autowired
	private SqlSessionTemplate dao = null;
	
	
	Date time = new Date();
	SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMdd");
	String today = format1.format(time);
	
	
	//==========새로운 회원===============
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
		
		System.out.println("Impl getCountPetitionerToday : "+getCountPetitionerToday());
		double OnePercent = CountTillYesterday / 100.00;
		System.out.println("Impl OnePercent : "+OnePercent);
		double percent =  getCountPetitionerToday() / OnePercent;
		System.out.println("Impl percent : "+percent);
		percent = Math.round(percent*100)/100.0; 
		
		if(CountTillYesterday == 0) { percent = 100; }
		else if(getCountPetitionerToday() == 0) {percent = 0;}
		System.out.println("Impl percent : "+percent+"----------");
		
		return percent;
	}

	//==========새로운 신고===============
	
	
	//==========새로운 청원===============
	@Override
	public int getCountPetitionToday() throws Exception {
		System.out.println("Impl time : "+time);
		return dao.selectOne("adminMain.getCountPetitionToday", today);
	}

	@Override
	public double getPercentPetitionToday() throws Exception {
		int CountPetitionTillYesterday = dao.selectOne("adminMain.getCountPetitionTillYesterday", today);
		System.out.println("Impl CounPetitionTillYesterday : "+CountPetitionTillYesterday);
		
		System.out.println("Impl getCountPetitionToday : "+getCountPetitionToday());
		double OnePercent = CountPetitionTillYesterday / 100.00;
		System.out.println("Impl OnePercent : "+OnePercent);
		double percent =  getCountPetitionToday() / OnePercent;
		System.out.println("Impl percent : "+percent);
		percent = Math.round(percent*100)/100.0; 
		
		if(CountPetitionTillYesterday == 0) { percent = 100; }
		else if(getCountPetitionToday() == 0) {percent = 0;}
		System.out.println("Impl percent : "+percent+"----------");
		return 0;
	}
	
	
	//==========새로운 토론===============
		@Override
		public int getCountDiscussionToday() throws Exception {
			System.out.println("Impl time : "+time);
			return dao.selectOne("adminMain.getCountDiscussionToday", today);
		}

		@Override
		public double getPercentDiscussionToday() throws Exception {
			int CountDiscussionTillYesterday = dao.selectOne("adminMain.getCountDiscussionTillYesterday", today);
			System.out.println("Impl CounDiscussionTillYesterday : "+CountDiscussionTillYesterday);
			
			System.out.println("Impl getCountDiscussionToday : "+getCountDiscussionToday());
			double OnePercent = CountDiscussionTillYesterday / 100.00;
			System.out.println("Impl OnePercent : "+OnePercent);
			double percent =  getCountDiscussionToday() / OnePercent;
			System.out.println("Impl percent : "+percent);
			percent = Math.round(percent*100)/100.0; 
			
			if(CountDiscussionTillYesterday == 0) { percent = 100; }
			else if(getCountDiscussionToday() == 0) {percent = 0;}
			System.out.println("Impl percent : "+percent+"----------");
			return 0;
		}
	
	
	//==========인기 청원===============
	@Override
	public List<PetitionDTO> getTopPetition() throws Exception {
		

		
		List<PetitionDTO> TopPetition = dao.selectList("adminMain.getTopPetition");
		
		return TopPetition;
	}

	@Override
	public int getRestDay() throws Exception {
		
		Date time = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMM");
		String thisMonth = format1.format(time);
		
		return dao.selectOne("adminMain.getRestDay", thisMonth);
	}

	
	//==========인기 토론===============
	@Override
	public List<DiscussionDTO> getTopDiscussion() throws Exception {
		
		List<DiscussionDTO> TopDiscussion = dao.selectList("adminMain.getTopDiscussion");
		
		return TopDiscussion;
	}
	


}
