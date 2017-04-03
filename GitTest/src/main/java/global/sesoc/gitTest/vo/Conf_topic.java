package global.sesoc.gitTest.vo;

import java.io.Serializable;

public class Conf_topic implements Serializable{

	private int subtitle_id;
	private int conf_num;
	private String subtitle;
	private int employee_num;
	private int process;
	
	
	public Conf_topic() {
		super();
	}

	public Conf_topic(int subtitle_id, int conf_num, String subtitle, int employee_num, int process) {
		super();
		this.subtitle_id = subtitle_id;
		this.conf_num = conf_num;
		this.subtitle = subtitle;
		this.employee_num = employee_num;
		this.process = process;
	}

	public int getSubtitle_id() {
		return subtitle_id;
	}

	public void setSubtitle_id(int subtitle_id) {
		this.subtitle_id = subtitle_id;
	}

	public int getConf_num() {
		return conf_num;
	}

	public void setConf_num(int conf_num) {
		this.conf_num = conf_num;
	}

	public String getSubtitle() {
		return subtitle;
	}

	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}

	public int getEmployee_num() {
		return employee_num;
	}

	public void setEmployee_num(int employee_num) {
		this.employee_num = employee_num;
	}

	public int getProcess() {
		return process;
	}

	public void setProcess(int process) {
		this.process = process;
	}

	@Override
	public String toString() {
		return "Conf_topic [subtitle_id=" + subtitle_id + ", conf_num=" + conf_num + ", subtitle=" + subtitle
				+ ", employee_num=" + employee_num + ", process=" + process + "]";
	}
	
	
}
