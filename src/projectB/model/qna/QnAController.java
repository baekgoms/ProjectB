package projectB.model.qna;

//import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("qan")
public class QnAController {
	@RequestMapping("qna.aa")
	public String main() {
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("chat/chat");
		return "chat/chat";
	}
}
