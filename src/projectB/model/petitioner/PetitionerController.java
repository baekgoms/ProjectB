package projectB.model.petitioner;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import projectB.model.mail.MailSendService;
import projectB.model.petitionerService.PetitionerService;

@Controller
@RequestMapping("petitioner")
public class PetitionerController {
	private static final int NOT_CONFIRM = 0;
	private static final int CONFIRM = 1;

	@Autowired
	private PetitionerService petitionerService;

	@Autowired
	private MailSendService mailSendService;

	@RequestMapping("signUp.aa")
	public String signUp() {
		return "petitioner/signUp";
	}

	@RequestMapping("confirmId.aa")
	public @ResponseBody String confirmId(String id) throws Exception {

		int confrimResult = petitionerService.confirmId(id);
		return "" + confrimResult;
	}

	@RequestMapping("mailSend.aa")
	public String mailSend(PetitionerDTO dto) {
		System.out.println("mailSend run");
		
		mailSendService.createAuthKey();
		int authKey = mailSendService.getEncodingKey();

		dto.setAuthKey(authKey);
		dto.setState(PetitionerService.NOT_AUTH_STATE);
		
		try {
			petitionerService.insertPetitioner(dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		mailSendService.sendMail(dto.getEmail(), authKey);
		return "redirect:signUp.aa";
	}

	@RequestMapping("mailAuth.aa")
	public String mailAuth(PetitionerDTO dto, Model model) {
		int confirmResult = NOT_CONFIRM;
		PetitionerDTO dbDTO = null;
		
		String email = dto.getEmail();
		int userAuthKey = dto.getAuthKey();
		int dbAuthKey = 0;
		try {
			if (email != null) {
				dbDTO = petitionerService.getPetitionerByEmailAndAuthKey(email, userAuthKey);
				dbAuthKey = dbDTO.getAuthKey();
			}
			
			boolean isDecoding = mailSendService.isDecoding(userAuthKey, dbAuthKey);
			if (isDecoding) {
				confirmResult = CONFIRM;
				petitionerService.updatePetitionerState(dbDTO.getId());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		model.addAttribute("confirmResult", confirmResult);
		
		return "petitioner/mailAuth";
	}
}
