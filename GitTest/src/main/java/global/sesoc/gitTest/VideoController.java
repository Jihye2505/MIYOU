package global.sesoc.gitTest;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class VideoController {

	private static final Logger logger = LoggerFactory.getLogger(VideoController.class);
	
	@RequestMapping(value="/videocall",method = RequestMethod.GET)
	public String videocall(HttpSession session){
		
		String token = "cHJvdmlzaW9uAEpIQGZjOTgzNC52aWR5by5pbwA2MzY2OTI0MTAyMgAAMTM4Y2NlY2JmOTViMWMwMzYzYzliYTVjMjI5MTIzMWI5YmE3MDlmOThhYjA2OWU5MDA5YTBmMmY4ZWY1ODc0YzU4NDRjMjdlOWRjZGExMWYzYzk0YjQyOTlhYzliOWYx";
		session.setAttribute("token", token);
		return "VidyoConnector";
	}
			
}
