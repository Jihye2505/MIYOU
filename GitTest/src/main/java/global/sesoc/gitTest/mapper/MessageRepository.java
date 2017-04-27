package global.sesoc.gitTest.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.gitTest.MessageController;
import global.sesoc.gitTest.DAO.MessageDAO;
import global.sesoc.gitTest.vo.Conf_mng;
import global.sesoc.gitTest.vo.Member;
import global.sesoc.gitTest.vo.Message;

@Repository
public class MessageRepository {

	final static Logger logger = LoggerFactory.getLogger(MessageController.class);
	@Autowired
	SqlSession sqlsession;
	
	public int sendMessage(Message message){
		int result=0;
//		System.out.println(message);
		MessageDAO msgDAO = sqlsession.getMapper(MessageDAO.class);
		try {
			result = msgDAO.sendMessage(message);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	public List<Message> messageList(String user, String searchTitle, String searchText){
		List<Message> messageList=null;
		MessageDAO msgDAO = sqlsession.getMapper(MessageDAO.class);
		
		Map<String, String> search = new HashMap<>();
		
		search.put("user", user);
		search.put("searchTitle", searchTitle);
		search.put("searchText", searchText);
		try {
			messageList = msgDAO.messageList(search);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return messageList;
	}
	
	public List<Message> sentMessages(String user){
		List<Message> sentMessages=null;
		MessageDAO msgDAO = sqlsession.getMapper(MessageDAO.class);
		try {
			sentMessages = msgDAO.sentMessages(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sentMessages;
	}
	
	public int countMessage(String user){
		int result=0;
		
		MessageDAO msgDAO = sqlsession.getMapper(MessageDAO.class);
		try {
			result = msgDAO.countMessage(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	public Message readMessage (int message_num){
		Message message = null;
		MessageDAO msgDAO = sqlsession.getMapper(MessageDAO.class);
		try {
			message = msgDAO.readMessage(message_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return message;
	}
	
	public int messageCheck(int message_num){
		int result=0;
		
		MessageDAO msgDAO = sqlsession.getMapper(MessageDAO.class);
		try {
			result = msgDAO.messageCheck(message_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int deleteMessage(int message_num){
		int result=0;
		MessageDAO msgDAO = sqlsession.getMapper(MessageDAO.class);
		try {
			result = msgDAO.deleteMessage(message_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public int countNotRead(String user){
		int result=0;
		
		MessageDAO msgDAO = sqlsession.getMapper(MessageDAO.class);
		try {
			result = msgDAO.countNotRead(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int trashMessage(int message_num){
		int result=0;
		
		MessageDAO msgDAO = sqlsession.getMapper(MessageDAO.class);
		try {
			result = msgDAO.trashMessage(message_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	public List<Message> trash(String user){
		List<Message> trashMessages=null;
		MessageDAO msgDAO = sqlsession.getMapper(MessageDAO.class);
		try {
			trashMessages = msgDAO.trashMessages(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return trashMessages;
	}
	
	public List<Message> notice(String user){
		List<Message> noticeList = null;
		MessageDAO msgDAO = sqlsession.getMapper(MessageDAO.class);
		try {
			noticeList = msgDAO.notice(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return noticeList;
	}

	public Message countDownEndMessage(String conf_date, String employee_nums, String user) {

		MessageDAO msgDAO = sqlsession.getMapper(MessageDAO.class);
		
		Map<String, String> search = new HashMap<>();
		search.put("conf_date", conf_date);
		search.put("employee_nums", employee_nums);
		search.put("user", user);
		
		Message message = null;
		
		try {
			message = msgDAO.countDownEndMessage(search);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return message;
	}
	
	public int sendConfMessage(Conf_mng conf_mng, String conf_date2, String employee_num) {

		int result=0;
		
		MessageDAO msgDAO = sqlsession.getMapper(MessageDAO.class);
		
		Message message = new Message();
		
		String content = 
				"Conference Notice"
				+"<br>Date : "+conf_date2
				+"<br>Conf Num : "+conf_mng.getConf_num()
				+"<br>Conf Topic : "+conf_mng.getTitle()
				+"<br>Participant : "+conf_mng.getEmployee_nums()
				+"<br><br><form action='videocall'><input type='submit' value='MIYOU!' class='btn purple btn-outline btn-sm'></form>";
//		System.out.println(content);
		message.setContent(content);
		message.setEmployee_num(employee_num);
		message.setNotice("C");

		String receivers = conf_mng.getEmployee_nums();
		String [] toList = receivers.split(",");
		for (String receiver : toList) {
			message.setReceiver_num(receiver);
			result = sendMessage(message);
		}
		return result;
	}
}
