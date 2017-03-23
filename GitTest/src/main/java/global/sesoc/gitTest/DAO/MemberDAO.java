package global.sesoc.gitTest.DAO;

import java.util.List;

import global.sesoc.gitTest.vo.DeptList;
import global.sesoc.gitTest.vo.JobList;
import global.sesoc.gitTest.vo.Member;

public interface MemberDAO {

	public int insertMember(Member member) throws Exception;
	public int updateMember(Member member) throws Exception;
	public Member selectOne(String loginNum) throws Exception;
	public List<JobList> jobList() throws Exception;
	public List<DeptList> deptList() throws Exception;
	
}
