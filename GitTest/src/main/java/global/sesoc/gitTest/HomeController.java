package global.sesoc.gitTest;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller

public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		//ÀÎ»ý
		
		
		return "home";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String insertMeeting() {
		
		
		
		return "meeting";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String insertMeeting(Model model) {
		
		
		
		return "meeting";
	}
}
