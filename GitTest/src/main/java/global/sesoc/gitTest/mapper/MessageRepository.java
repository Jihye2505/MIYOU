package global.sesoc.gitTest.mapper;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.gitTest.MessageController;
import global.sesoc.gitTest.DAO.MessageDAO;
import global.sesoc.gitTest.vo.Message;

@Repository
public class MessageRepository {

	final static Logger logger = LoggerFactory.getLogger(MessageController.class);
	@Autowired
	SqlSession sqlsession;
	
	public int sendMessage(Message message){
		int result=0;
		
		MessageDAO msgDAO = sqlsession.getMapper(MessageDAO.class);
		try {
			result = msgDAO.sendMessage(message);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	public List<Message> messageList(String user){
		List<Message> messageList=null;
		MessageDAO msgDAO = sqlsession.getMapper(MessageDAO.class);
		try {
			messageList = msgDAO.messageList(user);
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
}
