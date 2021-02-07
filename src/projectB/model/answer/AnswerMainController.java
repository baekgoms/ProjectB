package projectB.model.answer;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import projectB.model.answerListService.AnswerListService;
import projectB.model.petition.PetitionDTO;
import projectB.model.tag.TagDTO;
import projectB.model.tag.TagService;

enum answerType {
	RECOMMEND, OPPSITE, ADDITION,
}

@Controller
@RequestMapping("answer")
public class AnswerMainController {
	@Autowired
	private AnswerListService AnswerListService = null;

	@Autowired
	private TagService tagService;

	private static int MIN_LENGTH = 1;
	private static int MAX_LENGTH = 10;

	@RequestMapping("answerMain.aa")
	public String answerMain(@RequestParam(defaultValue = "ALL", required = true) String sort, Model model) {
		System.out.println("answerMain run/" + sort);

		try {
			List<AnswerDTO> recommends = answers(sort, answerType.RECOMMEND);
			List<AnswerDTO> oppsites = answers(sort, answerType.OPPSITE);
			List<AnswerDTO> additions = answers(sort, answerType.ADDITION);
			List<TagDTO> tags = tagService.getTags(1, 5);

			model.addAttribute("sort", sort);

			model.addAttribute("tags", tags);
			model.addAttribute("petitionRecommends", petitions(recommends));
			model.addAttribute("petitionOppsites", petitions(oppsites));
			model.addAttribute("petitionAdditions", petitions(additions));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "answer/answerMain";
	}

	private List<String> enums() {
		List<String> enums = new ArrayList<>();
		enums.add("ALL"); // 0
		enums.add("WEEK"); // 1
		enums.add("MONTH"); // 2
		enums.add("HALF_YEAR"); // 3
		enums.add("YEAR"); // 4

		return enums;
	}

	private List<AnswerDTO> answers(String sort, answerType type) throws Exception {
		List<AnswerDTO> answers = Collections.emptyList();

		List<String> enums = enums();
		for (int i = 0; i < enums.size(); ++i) {
			String s = enums.get(i);
			if (s.equals(sort)) {
				if (type == answerType.RECOMMEND) {
					answers = AnswerListService.getAnswerByRecommends(MIN_LENGTH, MAX_LENGTH, i);
				} else if (type == answerType.OPPSITE) {
					answers = AnswerListService.getAnswerByOpposites(MIN_LENGTH, MAX_LENGTH, i);
				} else if (type == answerType.ADDITION) {
					answers = AnswerListService.getAnswerByAdditions(MIN_LENGTH, MAX_LENGTH, i);
				}
			}
		}

		return answers;
	}

	private List<PetitionDTO> petitions(List<AnswerDTO> answers) {
		List<PetitionDTO> petitions = new ArrayList<>();
		try {
			for (AnswerDTO answerDTO : answers) {
				PetitionDTO dto = AnswerListService.getPetitionInfo(answerDTO.getPetitionNum());
				petitions.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return petitions;
	}
}
