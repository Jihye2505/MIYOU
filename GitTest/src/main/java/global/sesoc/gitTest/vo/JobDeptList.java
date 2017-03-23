package global.sesoc.gitTest.vo;

public class JobDeptList {

	private String jobId;
	private String jobName;
	private String deptId;
	private String deptName;
	
	public JobDeptList(String jobId, String jobName, String deptId, String deptName) {
		super();
		this.jobId = jobId;
		this.jobName = jobName;
		this.deptId = deptId;
		this.deptName = deptName;
	}
	public JobDeptList() {
		super();
	}
	public String getJobId() {
		return jobId;
	}
	public void setJobId(String jobId) {
		this.jobId = jobId;
	}
	public String getJobName() {
		return jobName;
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	public String getDeptId() {
		return deptId;
	}
	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	@Override
	public String toString() {
		return "JobDeptList [jobId=" + jobId + ", jobName=" + jobName + ", deptId=" + deptId + ", deptName=" + deptName
				+ "]";
	}
	
	
	
	
}
