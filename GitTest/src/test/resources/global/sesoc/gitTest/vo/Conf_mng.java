package global.sesoc.gitTest.vo;

import java.util.Date;

public class Conf_mng {

	private int conf_num;
	private Date conf_date;
	private String employee_num;
	private String savedfile;
	private String originalfile;
	
	public Conf_mng(int conf_num, Date conf_date, String employee_num, String savedfile,
			String originalfile) {
		super();
		this.conf_num = conf_num;
		this.conf_date = conf_date;
		this.employee_num = employee_num;
		this.savedfile = savedfile;
		this.originalfile = originalfile;
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
	public String getEmployee_num() {
		return employee_num;
	}
	public void setEmployee_num(String employee_num) {
		this.employee_num = employee_num;
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
	@Override
	public String toString() {
		return "conference_management [conf_num=" + conf_num + ", conf_date=" + conf_date + ", employee_num="
				+ employee_num + ", savedfile=" + savedfile + ", originalfile=" + originalfile + "]";
	}
	
	
}
