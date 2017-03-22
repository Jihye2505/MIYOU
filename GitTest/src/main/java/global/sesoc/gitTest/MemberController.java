package global.sesoc.gitTest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {

   final static Logger logger = LoggerFactory.getLogger(MemberController.class);
   
   
   @RequestMapping(value="/join", method=RequestMethod.GET)
   public String join(){
      
      return "Member/join";
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