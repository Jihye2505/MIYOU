package global.sesoc.gitTest.DAO;

import java.util.List;

import global.sesoc.gitTest.vo.Message;

public interface MessageDAO {

	//메시지 보내기(insert)
	public int sendMessage(Message message) throws Exception;
	
	//아이디에 따른 메시지 전체 개수 카운트
	public int countMessage(String empNum) throws Exception;
	
	//읽지않은 글 카운트
	public int countNotRead(String empNum) throws Exception;
	
	//메시지 하나 읽어오기
	public Message readMessage(int message_num) throws Exception;
	
	//메시지 전체 리스트
	public List<Message> messageList(String user) throws Exception;
	
	//메시지 삭제
	public int deleteMessage(int message_num) throws Exception;
	
	//메시지 읽음 표시
	public int messageCheck(int message_num) throws Exception;
	
	//내가 보낸 메시지
	public List<Message> sentMessages(String user) throws Exception;
}
