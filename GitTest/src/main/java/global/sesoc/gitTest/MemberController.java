package global.sesoc.gitTest;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import global.sesoc.gitTest.mapper.MemberRepository;
import global.sesoc.gitTest.mapper.MessageRepository;
import global.sesoc.gitTest.vo.DeptList;
import global.sesoc.gitTest.vo.JobList;
import global.sesoc.gitTest.vo.Member;

@Controller
@SessionAttributes()
public class MemberController {

   final static Logger logger = LoggerFactory.getLogger(MemberController.class);
   
   @Autowired
   MemberRepository mRepository;
   
   @Autowired
   MessageRepository msgRepository;
   
   
   @RequestMapping(value="/join", method=RequestMethod.GET)
   public String join(HttpSession session){
      List<JobList> jobList = mRepository.jobList();
      List<DeptList> deptList = mRepository.deptList();
      session.setAttribute("jobList", jobList);
      session.setAttribute("deptList", deptList);
      return "Member/join";
   }
   
   @RequestMapping(value="/joinMember", method=RequestMethod.POST)
   public String join(Member member){
      try {
		int result = mRepository.insert(member);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
      
      return "login";
   }
   
   @RequestMapping(value="/login", method=RequestMethod.GET)
   public String login(HttpSession session){
      session.removeAttribute("user");
      return "login";
   }
   
   @RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Member member, HttpSession session) {
	   String loginNum = member.getEmployee_num();
		String loginPw = member.getPassword();
		Member user = mRepository.selectOne(loginNum);
		int total = msgRepository.countMessage(user.getEmployee_num());
		int unread = msgRepository.countNotRead(user.getEmployee_num());
		if(user.getEmployee_num().equals(loginNum) && user.getPassword().equals(loginPw)) {
			session.setAttribute("user", user);
			session.setAttribute("total", total);
			session.setAttribute("unread", unread);
			return "main";
		}
		else {
			//안됐을경우 안됐다고 팝업을 띄우고싶은데... 
		}
		return "redirect:/";
	}
   
   
   @RequestMapping(value="/update", method=RequestMethod.GET)
   public String update(){
      
      return "Member/update";
   }
   
   @RequestMapping(value="/update", method=RequestMethod.POST)
   public String update(Member member){
	   try {
	      int result = mRepository.update(member);
	   } catch (Exception e) {
	      // TODO Auto-generated catch block
	      e.printStackTrace();
	   }
	      
	     return "login";
   }

   @RequestMapping(value="/delete", method=RequestMethod.GET)
   public String delete(){
      
      return "Member/delete";
   }
   
   @RequestMapping(value="/check", method=RequestMethod.GET)
   public String check(){
      
      return "Member/check";
   }
   
   @RequestMapping(value="/lockscreen", method=RequestMethod.GET)
   public String lockscreen(){
      
      return "Member/lockscreen";
   }
   
   @RequestMapping(value="/lockscreen", method=RequestMethod.POST)
   public String lockscreen(Member member, HttpSession session){
	   String loginNum = member.getEmployee_num();
	   Member user = mRepository.selectOne(loginNum);
	   session.setAttribute("user", user);
	   
	   return "main";
   }
   
   @RequestMapping(value="/myInfo", method=RequestMethod.GET)
   public String myInfo(Member member, HttpSession session){
	   /*String loginNum = member.getEmployee_num();
	   Member user = mRepository.selectOne(loginNum);
	   session.setAttribute("user", user);*/
	   
      return "Member/myInfo";
   }
   
   @RequestMapping(value="/memberUpdate", method=RequestMethod.GET)
   public String memberUpdate(){
      
      return "Member/memberUpdate";
   }
   
   @RequestMapping(value="/memberUpdate", method=RequestMethod.POST)
   public String memberUpdate(Member member){
	   try {
	      int result = mRepository.memberUpdate(member);
	   } catch (Exception e) {
	      // TODO Auto-generated catch block
	      e.printStackTrace();
	   }
	      
	     return "login";
   }
   
   @RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	public @ResponseBody String idCheck(String employee_num) {
	   
	   Member member = null;
	   try {
		      member = mRepository.selectOne(employee_num);
		   } catch (Exception e) {
		      e.printStackTrace();
		   }
	   if(member == null) return "false";
	   else	return "true";
	}
   
   
}