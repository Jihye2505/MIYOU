package global.sesoc.gitTest;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.gitTest.mapper.MemberRepository;
import global.sesoc.gitTest.mapper.MessageRepository;
import global.sesoc.gitTest.vo.Member;
import global.sesoc.gitTest.vo.Message;

@Controller
public class MessageController {

private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	@Autowired
	MessageRepository msgRepository;
	@Autowired
	MemberRepository mRepository;

	
	//메시지함
	@RequestMapping(value = "/messages", method = RequestMethod.GET)
	public String messageList(HttpSession session, Model model) {

		Member user = (Member)session.getAttribute("user");
		List<Message> messageList = msgRepository.messageList(user.getEmployee_num());
		int total = msgRepository.countMessage(user.getEmployee_num());

		
		model.addAttribute("messageList", messageList);
		model.addAttribute("total", total);
		return "Message/messageBox";
	}
	
	//메시지 쓰기화면전환
	@RequestMapping(value = "/messageCompose", method = RequestMethod.GET)
	public String messageWrite(HttpSession session) {
		
		List<String> toList = null;
		ArrayList<String> toList2 = new ArrayList<>();
		try {
			toList = mRepository.toList();
			for (String empNum : toList) {
				toList2.add("'"+empNum+"'");
			}
			toList = toList2;
		   } catch (Exception e) {
		      e.printStackTrace();
		   }
		session.setAttribute("toList", toList);
		
		return "Message/messageCompose";
	}
	
	//메시지쓰기
	@RequestMapping(value = "/sendMessage", method = RequestMethod.POST)
	public String sendMessage(Message message, HttpSession session) {

		System.out.println("메시지 보낸다!");
		Member user = (Member)session.getAttribute("user");
		message.setEmployee_num(user.getEmployee_num());
		if (message.getNotice()==null) {
			message.setNotice("R");
		}

		String receivers = message.getReceiver_num();
		String [] toList = receivers.split(",");
		System.out.println(message.toString());
		for (String receiver : toList) {
			message.setReceiver_num(receiver);
			int result = msgRepository.sendMessage(message);
			System.out.println(receiver+"에게 메시지보냇나? : " + result);
		}
		
		int total = msgRepository.countMessage(user.getEmployee_num());
		int unread = msgRepository.countNotRead(user.getEmployee_num());
		session.setAttribute("total", total);
		session.setAttribute("unread", unread);
		return "redirect:messages";
	}
	
	//메시지 하나 보기
	@RequestMapping(value = "/readMessage", method = RequestMethod.GET)
	public String readMessage(int message_num, Model model, HttpSession session) {

		System.out.println("클릭한 메시지 번호 : " + message_num);
		Message message = msgRepository.readMessage(message_num);
		msgRepository.messageCheck(message_num);
		System.out.println(message.toString());

		model.addAttribute("message", message);
		
		Member user = (Member)session.getAttribute("user");
		int total = msgRepository.countMessage(user.getEmployee_num());
		int unread = msgRepository.countNotRead(user.getEmployee_num());
		session.setAttribute("total", total);
		session.setAttribute("unread", unread);

		return "Message/message";
	}
	
	//메시지삭제
	@RequestMapping(value = "/deleteMessage", method = RequestMethod.POST)
	public String deleteMessage(String [] check, HttpSession session) {
		for (String message : check) {
			msgRepository.deleteMessage(Integer.parseInt(message));
		}
		Member user = (Member) session.getAttribute("user");
		int total = msgRepository.countMessage(user.getEmployee_num());
		int unread = msgRepository.countNotRead(user.getEmployee_num());
		session.setAttribute("total", total);
		session.setAttribute("unread", unread);
		return "redirect:trash";
	}
		
	//내가보낸 메시지함
	@RequestMapping(value = "/sentMessage", method = RequestMethod.GET)
	public String sentMessage(HttpSession session, Model model) {

		Member user = (Member)session.getAttribute("user");
		List<Message> sentMessageList = msgRepository.sentMessages(user.getEmployee_num());
		
		model.addAttribute("sentMessageList", sentMessageList);
		return "Message/sentMessages";
	}
	
	@RequestMapping(value = "/messageTest", method = RequestMethod.GET)
	public String messgeTest() {

		return "Message/messageTest";
	}
	
	//받는사람이 디비에 있는지 체크
	@RequestMapping(value = "/receiverCheck", method = RequestMethod.GET)
	public @ResponseBody String idCheck(String receiver_num, HttpSession session) {
	   
	   List<Member> memberList = null;
	   String s = "";
	   try {
		      memberList = mRepository.search(receiver_num);
		   } catch (Exception e) {
		      e.printStackTrace();
		   }
	   for(int i = 0; i < memberList.size(); i++) {
		   s = s + memberList.get(i).getEmployee_num() + "\n";
	   }
	   session.setAttribute("memberList", memberList);
	   System.out.println(memberList);
	   return s;
	}
	

	//메시지를 휴지통으로 
	@RequestMapping(value = "/toTrash", method = RequestMethod.POST)
	public String toTrash(String [] check) {
		for (String message : check) {
			msgRepository.trashMessage(Integer.parseInt(message));
		}
		return "redirect:trash";
	}
	
	//휴지통으로 화면 이동
	@RequestMapping(value = "/trash", method = RequestMethod.GET)
	public String trash(HttpSession session, Model model) {
		
		Member user = (Member)session.getAttribute("user");
		List<Message> trashMessageList = msgRepository.trash(user.getEmployee_num());
		
		model.addAttribute("trashMessageList", trashMessageList);
		
		return "Message/trash";
	}
	
	//메시지를 읽음으로 표시
	@RequestMapping(value = "/toRead", method = RequestMethod.POST)
	public String toRead(String [] check, HttpSession session) {
		for (String message : check) {
			msgRepository.messageCheck(Integer.parseInt(message));
			Member user = (Member) session.getAttribute("user");
			int total = msgRepository.countMessage(user.getEmployee_num());
			int unread = msgRepository.countNotRead(user.getEmployee_num());
			session.setAttribute("total", total);
			session.setAttribute("unread", unread);
		}
		return "redirect:messages";
	}
	
	//notice 화면 이동
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice(HttpSession session, Model model) {
		
		Member user = (Member)session.getAttribute("user");
		List<Message> noticeList = msgRepository.notice(user.getEmployee_num());
		model.addAttribute("noticeList", noticeList);
		
		return "Message/notice";
	}

}
