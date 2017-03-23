package global.sesoc.gitTest.vo;

public class JobList {

	private String job_id;
	private String job_name;
	public JobList(String job_id, String job_name) {
		super();
		this.job_id = job_id;
		this.job_name = job_name;
	}
	public JobList() {
		super();
	}
	public String getJob_id() {
		return job_id;
	}
	public void setJob_id(String job_id) {
		this.job_id = job_id;
	}
	public String getJob_name() {
		return job_name;
	}
	public void setJob_name(String job_name) {
		this.job_name = job_name;
	}
	@Override
	public String toString() {
		return "JobList [job_id=" + job_id + ", job_name=" + job_name + "]";
	}
	
	

	
	
}
