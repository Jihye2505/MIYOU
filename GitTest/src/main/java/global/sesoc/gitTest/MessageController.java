package global.sesoc.gitTest;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.gitTest.mapper.ConfRepository;
import global.sesoc.gitTest.mapper.MemberRepository;
import global.sesoc.gitTest.mapper.MessageRepository;
import global.sesoc.gitTest.vo.Conf_mng;
import global.sesoc.gitTest.vo.Member;
import global.sesoc.gitTest.vo.Message;

@Controller
public class MessageController {

private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	@Autowired
	MessageRepository msgRepository;
	@Autowired
	MemberRepository mRepository;
	@Autowired
	ConfRepository confRepository;
	
	//메시지함
	@RequestMapping(value = "/messages", method = RequestMethod.GET)
	public String messageList(@RequestParam(value = "searchTitle", defaultValue = "") String searchTitle,
			@RequestParam(value = "searchText", defaultValue = "") String searchText,
			HttpSession session, Model model) {

		
		Member user = (Member)session.getAttribute("user");
		int total = msgRepository.countMessage(user.getEmployee_num());
		List<Message> messageList = msgRepository.messageList(user.getEmployee_num(), searchTitle, searchText);

		List<Map<String, Object>> messageViewList = new ArrayList<>();
		for (int i = 0; i < messageList.size(); i++) {
			Map<String, Object> messageView = new HashMap<>();
			SimpleDateFormat viewDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String send_date = viewDate.format(messageList.get(i).getSend_date());
			messageView.put("send_date", send_date);
			messageView.put("message_num", messageList.get(i).getMessage_num());
			messageView.put("checked", messageList.get(i).getChecked());
			if(messageList.get(i).getContent().length()>9){
				messageView.put("title", messageList.get(i).getContent().substring(0, 10)+"...");
			}else{
				messageView.put("title", messageList.get(i).getContent());
			}
			messageView.put("employee_num", messageList.get(i).getEmployee_num());
			messageView.put("notice", messageList.get(i).getNotice());
			messageView.put("content", messageList.get(i).getContent());
			messageViewList.add(messageView);
		}
		model.addAttribute("messageList", messageViewList);
		model.addAttribute("total", total);
		model.addAttribute("searchTitle", searchTitle);
		model.addAttribute("searchText",searchText);
		return "Message/messageBox";
	}
	
	//메시지 쓰기화면전환
	@RequestMapping(value = "/messageCompose", method = RequestMethod.GET)
	public String messageWrite(String toUser, HttpSession session, Model model) {
		
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
		if (toUser==null) {
			model.addAttribute("toUser", null);
		} else {
			model.addAttribute("toUser", toUser);
		}
		
		return "Message/messageCompose";
	}
	
	//메시지쓰기
	@RequestMapping(value = "/sendMessage", method = RequestMethod.POST)
	public String sendMessage(Message message, HttpSession session) {

		Member user = (Member)session.getAttribute("user");
		message.setEmployee_num(user.getEmployee_num());
		if (message.getNotice()==null) {
			message.setNotice("R");
		}

		String receivers = message.getReceiver_num();
		String [] toList = receivers.split(",");
		for (String receiver : toList) {
			message.setReceiver_num(receiver);
			int result = msgRepository.sendMessage(message);
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

		session.removeAttribute("conf_num");
//		System.out.println("removeConf_num==="+session.getAttribute("conf_num"));
		Message message = msgRepository.readMessage(message_num);
		msgRepository.messageCheck(message_num);

		Map<String, Object> messageView = new HashMap<>();
		SimpleDateFormat viewDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String send_date = viewDate.format(message.getSend_date());
		messageView.put("send_date", send_date);
		messageView.put("message_num", message.getMessage_num());
		messageView.put("checked", message.getChecked());
		messageView.put("employee_num", message.getEmployee_num());
		messageView.put("notice", message.getNotice());
		messageView.put("content", message.getContent());
		
		model.addAttribute("message", messageView);
		
		Member user = (Member)session.getAttribute("user");
		int total = msgRepository.countMessage(user.getEmployee_num());
		int unread = msgRepository.countNotRead(user.getEmployee_num());
		session.setAttribute("total", total);
		session.setAttribute("unread", unread);
		if (message.getNotice().equals("C")) {
			confRepository.searchRoomNum(message);
		}
		return "Message/message";
	}
	
	//메시지삭제
	@RequestMapping(value = "/deleteMessage", method = RequestMethod.POST)
	public String deleteMessage(String [] check, HttpSession session) {
		if(check != null) {
			for (String message : check) {
				msgRepository.deleteMessage(Integer.parseInt(message));
			}
			Member user = (Member) session.getAttribute("user");
			int total = msgRepository.countMessage(user.getEmployee_num());
			int unread = msgRepository.countNotRead(user.getEmployee_num());
			session.setAttribute("total", total);
			session.setAttribute("unread", unread);
		}
		return "redirect:trash";
	}
		
	//내가보낸 메시지함
	@RequestMapping(value = "/sentMessage", method = RequestMethod.GET)
	public String sentMessage(HttpSession session, Model model) {

		Member user = (Member)session.getAttribute("user");
		List<Message> sentMessageList = msgRepository.sentMessages(user.getEmployee_num());
		List<Map<String, Object>> sendMessageViewList = new ArrayList<>();
		for (int i = 0; i < sentMessageList.size(); i++) {
			Map<String, Object> messageView = new HashMap<>();
			SimpleDateFormat viewDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String send_date = viewDate.format(sentMessageList.get(i).getSend_date());
			messageView.put("send_date", send_date);
			messageView.put("receiver_num", sentMessageList.get(i).getReceiver_num());
			messageView.put("checked", sentMessageList.get(i).getChecked());
			messageView.put("content", sentMessageList.get(i).getContent());
			sendMessageViewList.add(messageView);
		}
		model.addAttribute("sentMessageList", sendMessageViewList);
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
//	   System.out.println(memberList);
	   return s;
	}
	

	//메시지를 휴지통으로 
	@RequestMapping(value = "/toTrash", method = RequestMethod.POST)
	public String toTrash(String [] check) {
		
		if(check != null) {
			for (String message : check) {
				msgRepository.trashMessage(Integer.parseInt(message));
			}
		}
		return "redirect:trash";
	}
	
	//메시지를 휴지통으로 
	@RequestMapping(value = "/toTrash", method = RequestMethod.GET)
	public String toTrash(int message_num) {
		
		msgRepository.trashMessage(message_num);
		
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
		if(check != null) {
			for (String message : check) {
				msgRepository.messageCheck(Integer.parseInt(message));
				Member user = (Member) session.getAttribute("user");
				int total = msgRepository.countMessage(user.getEmployee_num());
				int unread = msgRepository.countNotRead(user.getEmployee_num());
				session.setAttribute("total", total);
				session.setAttribute("unread", unread);
			}
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
	
	//카운트다운용 메시지
	@RequestMapping(value = "/countDownEndMessage", method = RequestMethod.GET)
	public @ResponseBody Message countDownEndMessage(String conf_date, String employee_nums, HttpSession session, Model model) {
		Member user = (Member)session.getAttribute("user");
		Message message = msgRepository.countDownEndMessage(conf_date, employee_nums, user.getEmployee_num());
		session.setAttribute("message", message);
//		System.out.println("countdownendmessage"+message.getContent().toString());
		return message;
	}

}
