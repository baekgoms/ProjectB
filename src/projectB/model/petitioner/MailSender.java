package projectB.model.petitioner;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailSender {
    private JavaMailSender mailSender;
    private MimeMessage message;
    private MimeMessageHelper messageHelper;
    
    public MailSender(JavaMailSender _mailSnder) throws MessagingException {
    	mailSender = _mailSnder;
    	message = mailSender.createMimeMessage();
    	messageHelper = new MimeMessageHelper(message, true, "UTF-8");
    }
    
    public void setSubject(String subject) throws MessagingException {
    	messageHelper.setSubject(subject);
    }
    
    public void setHtmlText(String content) throws MessagingException {
    	messageHelper.setText(content, true);
    }
    
    public void setFrom(String fromEmail, String name) throws UnsupportedEncodingException, MessagingException {
    	messageHelper.setFrom(fromEmail, name);
    }
    
    public void setTo(String toEmail) throws MessagingException {
    	messageHelper.setTo(toEmail);
    }
    
    public void sendMail() {
    	mailSender.send(message);
    }
}
