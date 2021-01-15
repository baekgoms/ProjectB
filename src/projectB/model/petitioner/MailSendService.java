package projectB.model.petitioner;

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
	
	public void createAuthKey() {
		authKeyService.createAuthKey();
	}
	
	public int getEncodingKey() {
		return authKeyService.getEncodingKey();
	}
	
	public boolean isDecoding(int mailEncodingKey, int dbEncodingKey) {
		return authKeyService.isDecoding(mailEncodingKey, dbEncodingKey);
	}
	
	public void sendMail(String toEmail, int authKey) {		
		try {
			MailSender mailSender = new MailSender(mailSenderImpl);
			
			mailSender.setSubject("회원가입 메일 인증");
			StringBuffer bf = new StringBuffer()
					.append("<h1>[이메일 인증]</h1>")
					.append("<p>버튼 클릭하면 이메일 인증이 완료됩니다.</p>")
					.append("<form method = 'post'")
					.append("action = 'http://localhost:8080/projectB/petitioner/mailAuth.aa'>")
					.append("<input type='hidden' name= 'email'")
					.append("value=" + toEmail + ">")
					.append("<input type='hidden' name= 'authKey'")
					.append("value=" + authKey + ">")
					.append("<button type='submit'")
					.append("class='btn waves-effect waves-light btn-outline-dark'>")
					.append("인증하기</button>")
					.append("</from>");

			mailSender.setHtmlText(bf.toString());
			mailSender.setFrom("projectB", "관리자");
			mailSender.setTo(toEmail);
			mailSender.sendMail();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
