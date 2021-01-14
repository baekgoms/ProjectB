package projectB.test.baek;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import projectB.model.petitioner.PetitionerDTO;
import projectB.model.petitionerService.PetitionerService;

@Controller
@RequestMapping("beakTest")
public class baekTest {
	@Autowired
	private PetitionerService petitionerService;
	
	@Autowired
	private MailSendService mailSendService;
	
	@RequestMapping("inputEmail.aa")
	public String test() {
		System.out.println("inputEmail run" + "/" + petitionerService);
		
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
	public String test4(PetitionerDTO dto) {
		System.out.println("sendEmail run");
		
		mailSendService.createAuthKey();
		
		String authKey = mailSendService.getAuthKey();
		
		dto.setAuthKey(authKey);
		
		petitionerService.insertPetitioner(dto);
		
		mailSendService.sendMail("asx14@naver.com");
		
		return "redirect:inputEmail.aa";
	}
	
//	@RequestMapping("insertTest.aa")
//	public String test5(PetitionerDTO dto) {
//		System.out.println("insertTest run");
//		
//		System.out.println("insertTest run/" + dto.getId());
//		System.out.println("insertTest run/" + dto.getPassword());
//		System.out.println("insertTest run/" + dto.getName());
//		System.out.println("insertTest run/" + dto.getContact());		
//		System.out.println("insertTest run/" + dto.getEmail());
//		System.out.println("insertTest run/" + dto.getGender());
//		
//		petitionerService.insertPetitioner(dto);
//		
//		return "test/baek_test/signUp";
//	}
	
	@RequestMapping("confirmId.aa")
	public @ResponseBody String confirmId2(Model model) throws Exception
	{
		System.out.println("confirmId run");
		int check = 12;
		
		return check + "";
	}
}
