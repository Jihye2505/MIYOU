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
public class ProgressController {

	@Autowired
	TeamRepository tRepository;
	
	@RequestMapping(value="/my_dept", method=RequestMethod.GET)
	public String my_dept(HttpSession session){
		
		Member user = (Member) session.getAttribute("user");
		
		ArrayList<HashMap<String, Object>> members = tRepository.getMembers(user.getDept_id());
		session.setAttribute("members", members);
	    return "Progress/my_dept";
	}
	
	@RequestMapping(value="/selected_team_progress", method=RequestMethod.GET)
	public String team_progress(HttpSession session, String dept_id){
		
		ArrayList<HashMap<String, Object>> members = tRepository.getMembers(dept_id);
		session.setAttribute("members", members);
	    return "Progress/my_dept";
	}
	
	@RequestMapping(value="/whole_dept", method=RequestMethod.GET)
	public String whole_dept(HttpSession session){
		
		ArrayList<HashMap<String, Object>> whole = tRepository.getWhole();
		session.setAttribute("whole", whole);
	    return "Progress/whole_dept";
	}
}
