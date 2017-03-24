package global.sesoc.gitTest.vo;

public class Member {

	private String employee_num;
	private String password;
	private String name;
	private String manager_num;
	private String email;
	private String language;
	private String job_id;
	private String phone;
	private String dept_id;
	
	public Member() {
		super();
	}

	public Member(String employee_num, String password, String name, String manager_num, String email, String language,
			String job_id, String phone, String dept_id) {
		super();
		this.employee_num = employee_num;
		this.password = password;
		this.name = name;
		this.manager_num = manager_num;
		this.email = email;
		this.language = language;
		this.job_id = job_id;
		this.phone = phone;
		this.dept_id = dept_id;
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

	public String getManager_num() {
		return manager_num;
	}

	public void setManager_num(String manager_num) {
		this.manager_num = manager_num;
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

	public String getJob_id() {
		return job_id;
	}

	public void setJob_id(String job_id) {
		this.job_id = job_id;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDept_id() {
		return dept_id;
	}

	public void setDept_id(String dept_id) {
		this.dept_id = dept_id;
	}

	@Override
	public String toString() {
		return "Member [employee_num=" + employee_num + ", password=" + password + ", name=" + name + ", manager_num="
				+ manager_num + ", email=" + email + ", language=" + language + ", job_id=" + job_id + ", phone="
				+ phone + ", dept_id=" + dept_id + "]";
	}
	
}
