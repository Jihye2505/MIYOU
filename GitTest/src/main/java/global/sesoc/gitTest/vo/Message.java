package global.sesoc.gitTest.vo;

import java.util.Date;

public class Message {

	private int message_num;
	private String employee_num;
	private Date send_date;
	private String receiver_num;
	private String content;
	private String notice;
	private String checked;

	public Message() {
	}

	public Message(int message_num, String employee_num, Date send_date, String receiver_num, String content,
			String notice, String checked) {
		super();
		this.message_num = message_num;
		this.employee_num = employee_num;
		this.send_date = send_date;
		this.receiver_num = receiver_num;
		this.content = content;
		this.notice = notice;
		this.checked = checked;
	}

	public int getMessage_num() {
		return message_num;
	}

	public void setMessage_num(int message_num) {
		this.message_num = message_num;
	}

	public String getEmployee_num() {
		return employee_num;
	}

	public void setEmployee_num(String employee_num) {
		this.employee_num = employee_num;
	}

	public Date getSend_date() {
		return send_date;
	}

	public void setSend_date(Date send_date) {
		this.send_date = send_date;
	}

	public String getReceiver_num() {
		return receiver_num;
	}

	public void setReceiver_num(String receiver_num) {
		this.receiver_num = receiver_num;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getNotice() {
		return notice;
	}

	public void setNotice(String notice) {
		this.notice = notice;
	}

	public String getChecked() {
		return checked;
	}

	public void setChecked(String checked) {
		this.checked = checked;
	}

	@Override
	public String toString() {
		return "Message [message_num=" + message_num + ", employee_num=" + employee_num + ", send_date=" + send_date
				+ ", receiver_num=" + receiver_num + ", content=" + content + ", notice=" + notice + ", checked="
				+ checked + "]";
	}
	
}