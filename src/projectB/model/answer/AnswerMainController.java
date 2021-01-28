package projectB.model.answer;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import projectB.model.answerList.AnswerListService;
import projectB.model.petition.PetitionDTO;

@Controller
@RequestMapping("answer")
public class AnswerMainController {
	@Autowired
	private AnswerListService AnswerListService = null;

	@RequestMapping("answerMain.aa")
	public String answerMain(Model model) {

		System.out.println("answerMain run");
		try {
			// 추천 많은 정렬 리스트
			List<AnswerDTO> recommends = AnswerListService.getAnswerByRecommends(1, 10);
			// 반대 많은 정렬 리스트
			List<AnswerDTO> oppsites = AnswerListService.getAnswerByOpposites(1, 10);
			// 추가답변 대기 리스트
			List<AnswerDTO> additions = AnswerListService.getAnswerByAdditions(1, 10);

			List<PetitionDTO> petitionRecommends = new ArrayList<>();
			for (AnswerDTO answerDTO : recommends) {
				PetitionDTO dto = AnswerListService.getPetitionInfo(answerDTO.getPetitionNum());
				petitionRecommends.add(dto);
			}

			List<PetitionDTO> petitionOppsites = new ArrayList<>();
			for (AnswerDTO answerDTO : oppsites) {
				PetitionDTO dto = AnswerListService.getPetitionInfo(answerDTO.getPetitionNum());
				petitionOppsites.add(dto);
			}

			List<PetitionDTO> petitionAdditions = new ArrayList<>();
			for (AnswerDTO answerDTO : additions) {
				PetitionDTO dto = AnswerListService.getPetitionInfo(answerDTO.getPetitionNum());
				petitionAdditions.add(dto);
			}

//			model.addAttribute("recommends", recommends);
//			model.addAttribute("oppsites", oppsites);
//			model.addAttribute("additions", additions);
			model.addAttribute("petitionRecommends", petitionRecommends);
			model.addAttribute("petitionOppsites", petitionOppsites);
			model.addAttribute("petitionAdditions", petitionAdditions);

			// 인기 태그
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "answer/answerMain";
	}
}
