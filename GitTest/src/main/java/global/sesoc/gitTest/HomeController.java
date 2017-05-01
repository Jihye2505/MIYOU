package global.sesoc.gitTest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.gitTest.mapper.MemberRepository;
import global.sesoc.gitTest.vo.Member;

@Controller

public class HomeController {
	
	@Autowired
	MemberRepository mRepository;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "login";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String insertMeeting() {
		return "main";
	}
	
	@RequestMapping(value = "/about_us", method = RequestMethod.GET)
	public String aboutUs() {
		return "about_us";
	}
	
	@RequestMapping(value="/lockscreen", method=RequestMethod.GET)
	public String lockscreen(HttpServletRequest request, HttpSession session){
		String lastRequest = request.getHeader("referer");
		session.setAttribute("lastRequest", lastRequest);
		
	    return "Member/lockscreen";
	}
	   
	@RequestMapping(value="/lockscreen", method=RequestMethod.POST)
	public String lockscreen(Member member, HttpSession session){
		
		String loginNum = member.getEmployee_num();
		Member user = mRepository.selectOne(loginNum);
		session.setAttribute("user", user);
		session.setAttribute("lockCheck", "false");
		
		return "lastRequest";
	}
	
	@RequestMapping(value="/getlastRequest", method=RequestMethod.GET)
	public @ResponseBody String getlastRequest(HttpServletRequest request, HttpSession session){
		String lastRequest = (String) (session.getAttribute("lastRequest") + "");
		
	    return lastRequest;
	}
	
	@RequestMapping(value = "/locking", method = RequestMethod.GET)
	public @ResponseBody String locking(HttpSession session) {
		
		session.setAttribute("lockCheck", "true");
		
		return "true";
	}
	
	@RequestMapping(value = "/lockCheck", method = RequestMethod.GET)
	public @ResponseBody String lockCheck(HttpSession session) {
		
		String lockCheck = (String) (session.getAttribute("lockCheck") + "");
		if(lockCheck.equals("true")) {
			return "false";
		}
		
		return "true";
	}
	
}
