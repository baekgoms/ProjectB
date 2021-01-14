package projectB.test.baek;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("beakTest")
public class baekTest {
	@Autowired
	private MailSendService mailSendService;
	
	@RequestMapping("inputEmail.aa")
	public String test() {
		System.out.println("inputEmail run");
		
		return "test/baek_test/inputEmail";
	}
	
	@RequestMapping("inputAuthEmail.aa")
	public String test2() {
		System.out.println("inputAuthEmail run");
		
		return "test/baek_test/inputAuthEmail";
	}
	
	@RequestMapping("signUp.aa")
	public String test3() {
		System.out.println("signUp run");
		
		return "test/baek_test/signUp";
	}
	
	@RequestMapping("sendEmail.aa")
	public String test4() {
		System.out.println("sendEmail run //" + mailSendService);
		
		//DB에 사용자 추가
		
		//authKey 생성
		mailSendService.createAuthKey();
		//System.out.println(mailSendService.getAuthKey() + "/getAuthKey");
		//이메일 발송
		mailSendService.sendMail("asx14@naver.com");

		//authKey 유저 정보에 업데이트
		
		
		return "test/baek_test/inputEmail";
	}
	
	@RequestMapping("confirmId.aa")
	public @ResponseBody String confirmId2(Model model) throws Exception
	{
		System.out.println("confirmId run");
		int check = 12;
		
		return check + "";
	}
}
