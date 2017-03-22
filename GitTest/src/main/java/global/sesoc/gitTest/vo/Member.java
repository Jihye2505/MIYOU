package global.sesoc.gitTest.vo;

public class Member {

	private String employee_num;
	private String password;
	private String name;
	private String job_id;
	private String dept_id;
	private String email;
	private String language;
	private String phone;
	
	
	
	public Member() {
		super();
	}
	public Member(String employee_num, String password, String name, String job_id, String dept_id, String email,
			String language, String phone) {
		super();
		this.employee_num = employee_num;
		this.password = password;
		this.name = name;
		this.job_id = job_id;
		this.dept_id = dept_id;
		this.email = email;
		this.language = language;
		this.phone = phone;
	}
	public String getEmployee_num() {
		return employee_num;
	}
	public void setEmployee_num(String employee_num) {
		this.employee_num = employee_num;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getJob_id() {
		return job_id;
	}
	public void setJob_id(String job_id) {
		this.job_id = job_id;
	}
	public String getDept_id() {
		return dept_id;
	}
	public void setDept_id(String dept_id) {
		this.dept_id = dept_id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "Member [employee_num=" + employee_num + ", password=" + password + ", name=" + name + ", job_id="
				+ job_id + ", dept_id=" + dept_id + ", email=" + email + ", language=" + language + ", phone=" + phone
				+ "]";
	}
	
	
	
	
	
	
}
