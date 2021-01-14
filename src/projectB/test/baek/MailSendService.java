package projectB.test.baek;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

@Service("mailSendService")
public class MailSendService {
	@Autowired
    private JavaMailSenderImpl mailSenderImpl;
	
	@Autowired
	private AuthKeyService authKeyService;
	
	public MailSendService() {}
	
	//인증키 생성
	public void createAuthKey() {
		authKeyService.createAuthKey();
	}
	
	//인증키 얻기
	public String getAuthKey() {
		return authKeyService.getAuthKey();
	}
	
	//인증키 생성 및 인증 메일 보내기
	public void sendMail(String toEmail) {		
		String authKey = authKeyService.getAuthKey();
		
		try {
			MailSender mailSender = new MailSender(mailSenderImpl);
			
			mailSender.setSubject("회원가입 메일 인증");
			
			mailSender.setHtmlText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
					.append("<p>아래 링크를 클릭하면 이메일 인증이 완료됩니다.</p>")
					.append("<a href = '주소?email=")
					.append(toEmail)
					.append("&authKey=")
					.append(authKey)
					.append("'")
					.append("target='_blenk'>이메일 인증 확인</a>")
					.toString());
			mailSender.setFrom("projectB", "관리자");
			mailSender.setTo(toEmail);
			mailSender.sendMail();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
