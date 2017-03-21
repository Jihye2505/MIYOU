package global.sesoc.gitTest.vo;

import java.util.Date;

public class Massage {

	private String employee_num;
	private Date send_date;
	private String receiverenum;
	private String text;
	private int notice;
	private int check;
	
	public Massage(String employee_num, Date send_date, String receiverenum, String text, int notice, int check) {
		super();
		this.employee_num = employee_num;
		this.send_date = send_date;
		this.receiverenum = receiverenum;
		this.text = text;
		this.notice = notice;
		this.check = check;
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

	public String getReceiverenum() {
		return receiverenum;
	}

	public void setReceiverenum(String receiverenum) {
		this.receiverenum = receiverenum;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public int getNotice() {
		return notice;
	}

	public void setNotice(int notice) {
		this.notice = notice;
	}

	public int getCheck() {
		return check;
	}

	public void setCheck(int check) {
		this.check = check;
	}

	@Override
	public String toString() {
		return "massage [employee_num=" + employee_num + ", send_date=" + send_date + ", receiverenum=" + receiverenum
				+ ", text=" + text + ", notice=" + notice + ", check=" + check + "]";
	}
	
}
