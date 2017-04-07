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
		
		String token = "cHJvdmlzaW9uAG1peW91QDkyYzZlNi52aWR5by5pbwAxMDYzNjU4M"
				+ "jMxMTk1AAA5ODA1NzVkYTljYjJmNDhkOTY5ZTc1YzkyMDQzN2FhNjg1YjA3"
				+ "NmIzNGVmNTUwODRiYThjY2JmNmFjMDRjZjYzZjRiMjYxM2NjMDFmYzAwZjg"
				+ "0NDA1NmQ3MjE0MjMwMzg=";
		session.setAttribute("token", token);
		return "connection";
	}
	
	@RequestMapping(value="catchVoice", method=RequestMethod.GET)
	public String getVoice(){
		return "videocall/catchVoice";
	}
	
			
}
