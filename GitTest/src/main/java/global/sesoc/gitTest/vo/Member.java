package global.sesoc.gitTest.vo;

public class Member {

	private String employee_id;
	private String password;
	private String name;
	private String job_name;
	private String dept_name;
	private String email;
	private String language;
	private String phone;
	
	public Member() {
	}
	
	public Member(String employee_id, String password, String name, String job_name, String dept_name, String email,
			String language, String phone) {
		super();
		this.employee_id = employee_id;
		this.password = password;
		this.name = name;
		this.job_name = job_name;
		this.dept_name = dept_name;
		this.email = email;
		this.language = language;
		this.phone = phone;
	}

	public String getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
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

	public String getJob_name() {
		return job_name;
	}

	public void setJob_name(String job_name) {
		this.job_name = job_name;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
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
		return "member [employee_id=" + employee_id + ", password=" + password + ", name=" + name + ", job_name="
				+ job_name + ", dept_name=" + dept_name + ", email=" + email + ", language=" + language + ", phone="
				+ phone + "]";
	}
	
	
}
