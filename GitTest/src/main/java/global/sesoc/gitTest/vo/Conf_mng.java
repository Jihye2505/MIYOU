package global.sesoc.gitTest.vo;

import java.util.Date;

public class Conf_mng {

	private int conf_num;
	private Date conf_date;
	private String todate;
	private String employee_nums;
	private String title;
	private String savedfile;
	private String originalfile;
	private String writer;
	private int deleteCheck;
	
	
	public Conf_mng() {
		super();
	}


	public Conf_mng(int conf_num, Date conf_date, String todate, String employee_nums, String title, String savedfile,
			String originalfile, String writer, int deleteCheck) {
		super();
		this.conf_num = conf_num;
		this.conf_date = conf_date;
		this.todate = todate;
		this.employee_nums = employee_nums;
		this.title = title;
		this.savedfile = savedfile;
		this.originalfile = originalfile;
		this.writer = writer;
		this.deleteCheck = deleteCheck;
	}


	public int getConf_num() {
		return conf_num;
	}


	public void setConf_num(int conf_num) {
		this.conf_num = conf_num;
	}


	public Date getConf_date() {
		return conf_date;
	}


	public void setConf_date(Date conf_date) {
		this.conf_date = conf_date;
	}


	public String getTodate() {
		return todate;
	}


	public void setTodate(String todate) {
		this.todate = todate;
	}


	public String getEmployee_nums() {
		return employee_nums;
	}


	public void setEmployee_nums(String employee_nums) {
		this.employee_nums = employee_nums;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getSavedfile() {
		return savedfile;
	}


	public void setSavedfile(String savedfile) {
		this.savedfile = savedfile;
	}


	public String getOriginalfile() {
		return originalfile;
	}


	public void setOriginalfile(String originalfile) {
		this.originalfile = originalfile;
	}


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}


	public int getDeleteCheck() {
		return deleteCheck;
	}


	public void setDeleteCheck(int deleteCheck) {
		this.deleteCheck = deleteCheck;
	}


	@Override
	public String toString() {
		return "Conf_mng [conf_num=" + conf_num + ", conf_date=" + conf_date + ", todate=" + todate + ", employee_nums="
				+ employee_nums + ", title=" + title + ", savedfile=" + savedfile + ", originalfile=" + originalfile
				+ ", writer=" + writer + ", deleteCheck=" + deleteCheck + "]";
	}

}
