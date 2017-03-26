package global.sesoc.gitTest;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.gitTest.mapper.MessageRepository;
import global.sesoc.gitTest.vo.Member;
import global.sesoc.gitTest.vo.Message;

@Controller
public class MessageController {

private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	@Autowired
	MessageRepository msgRepository;

	
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
	public String messageWrite() {
		return "Message/messageCompose";
	}
	
	//메시지쓰기
	@RequestMapping(value = "/sendMessage", method = RequestMethod.POST)
	public String sendMessage(Message message, HttpSession session) {

		System.out.println("메시지 보낸다!");
		Member user = (Member)session.getAttribute("user");
		message.setEmployee_num(user.getEmployee_num());

		System.out.println(message.toString());
		int result = msgRepository.sendMessage(message);
		
		System.out.println("메시지보냇나? : " + result);
		return "redirect:messages";
	}
	
	//메시지 하나 보기
	@RequestMapping(value = "/readMessage", method = RequestMethod.GET)
	public String readMessage(int message_num, Model model) {

		System.out.println("클릭한 메시지 번호 : " + message_num);
		Message message = msgRepository.readMessage(message_num);
		msgRepository.messageCheck(message_num);
		System.out.println(message.toString());

		model.addAttribute("message", message);

		return "Message/message";
	}
	
	//메시지삭제
	@RequestMapping(value = "/deleteMessage", method = RequestMethod.GET)
	public String deleteMessage(int message_num) {

		int result = msgRepository.deleteMessage(message_num);
		return "redirect:messages";
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

}
