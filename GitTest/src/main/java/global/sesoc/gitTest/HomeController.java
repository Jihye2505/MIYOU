package global.sesoc.gitTest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller

public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		return "login";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String insertMeeting(Model model) {
		return "main";
	}
	
	@RequestMapping(value = "/about_us", method = RequestMethod.GET)
	public String aboutUs(Model model) {
		return "about_us";
	}
}
