package global.sesoc.gitTest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.gitTest.mapper.ConfRepository;
import global.sesoc.gitTest.vo.Conf_mng;
import global.sesoc.gitTest.vo.Conf_topic;

@Controller
public class ConferenceController {

	@Autowired
	ConfRepository repository;
	
	@RequestMapping(value = "insertConf", method = RequestMethod.GET)
	public String conf_mng(Model model) {
		
		
		
		return "insertConf";
	}
	
	@RequestMapping(value = "insertConf", method = RequestMethod.POST)
	public String conf_mng(Conf_mng conf_mng, List<Conf_topic> conf_topics ,Model model) {
		
		int result = repository.insertConf(conf_mng, conf_topics);
		
		return "redirect:/";
	}
	
	
}
