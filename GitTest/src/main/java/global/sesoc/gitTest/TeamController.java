package global.sesoc.gitTest;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.gitTest.mapper.TeamRepository;
import global.sesoc.gitTest.vo.Member;

@Controller
public class TeamController {

	@Autowired
	TeamRepository tRepository;
	
	@RequestMapping(value="/team_process", method=RequestMethod.GET)
	public String team_process(HttpSession session){
		
		Member user = (Member) session.getAttribute("user");
		
		ArrayList<HashMap<String, Object>> members = tRepository.getMembers(user.getDept_id());
		session.setAttribute("members", members);
		System.out.println(members);
	    return "Team/team_process";
	}
	
	@RequestMapping(value="/whole_process", method=RequestMethod.GET)
	public String whole_process(HttpSession session){
		
	    return "Team/whole_process";
	}
}
