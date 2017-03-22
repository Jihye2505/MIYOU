package global.sesoc.gitTest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.gitTest.mapper.MemberRepository;
import global.sesoc.gitTest.vo.Member;

@Controller
public class MemberController {

   final static Logger logger = LoggerFactory.getLogger(MemberController.class);
   
   @Autowired
   MemberRepository mRepository;
   
   
   
   @RequestMapping(value="/join", method=RequestMethod.GET)
   public String join(){
      
      return "Member/join";
   }
   
   @RequestMapping(value="/joinMember", method=RequestMethod.POST)
   public String join(Member member){
      try {
		int result = mRepository.insertMember(member);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
      
      return "login";
   }
   
   
   @RequestMapping(value="/update", method=RequestMethod.GET)
   public String update(){
      
      return "Member/update";
   }
   
   @RequestMapping(value="/update", method=RequestMethod.POST)
   public String update(Member member){
      try {
      int result = mRepository.insertMember(member);
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
   
   
}