package projectB.model.petitioner;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		System.out.println("signUp run");

		return "petitioner/signUp";
	}

	@RequestMapping("confirmId.aa")
	public @ResponseBody String confirmId(String id) throws Exception {
		System.out.println("confrimId run / " + id);

		int confrimResult = petitionerService.confirmId(id);
		System.out.println("confrimResult - " + confrimResult);
		return "" + confrimResult;
	}

	@RequestMapping("mailSend.aa")
	public String mailSend(PetitionerDTO dto) {
		System.out.println("mailSend run");

		mailSendService.createAuthKey();
		String authKey = mailSendService.getAuthKey();

		dto.setAuthKey(authKey);
		dto.setState(PetitionerService.NOT_AUTH_STATE);
		
		try {
			petitionerService.insertPetitioner(dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		mailSendService.sendMail(dto.getEmail());
		return "redirect:signUp.aa";
	}

	@RequestMapping("mailAuth.aa")
	public String mailAuth(PetitionerDTO dto, Model model) {
		int confirmResult = NOT_CONFIRM;
		PetitionerDTO dbData = null;

		try {
			if (dto.getEmail() != null && dto.getAuthKey() != null) {
				dbData = petitionerService.getPetitionerByEmailAndAuthKey(dto.getEmail(), dto.getAuthKey());
			}

			if (dbData != null) {
				confirmResult = CONFIRM;
				petitionerService.updatePetitionerState(dbData.getId());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		model.addAttribute("confirmResult", confirmResult);
		
		return "petitioner/mailAuth";
	}
}
