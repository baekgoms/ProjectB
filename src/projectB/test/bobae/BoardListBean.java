package projectB.test.bobae;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("board")
public class BoardListBean {
	
	@RequestMapping("ing_list.aa")
	public String test() {
		System.out.println("viewTest");
		return "board/ing_list";
	}
	
	@RequestMapping("finish_list.aa")
	public String test1() {
		System.out.println("finish Test");
		return "board/finish_list";
	}

	@RequestMapping("timeout_list.aa")
	public String test2() {
		System.out.println("timeout Test");
		return "board/timeout_list";
	}

	@RequestMapping("waiting_list.aa")
	public String test3() {
		System.out.println("waiting Test");
		return "board/waiting_list";
	}

}
