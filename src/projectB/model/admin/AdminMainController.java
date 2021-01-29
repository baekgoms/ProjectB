package projectB.model.admin;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdminMainController {
	
	@RequestMapping("main.aa")
	public String main() {
		
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat format2 = new SimpleDateFormat ( "yyyy년 MM월dd일");
				
		Date time = new Date();
				
		String time1 = format1.format(time);
		String time2 = format2.format(time);
				
		System.out.println(time1);
		System.out.println(time2);
		
		
		
		System.out.println("admin main controller");
		return "wooch/AdminMain";
	}
	
}

