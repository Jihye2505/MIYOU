package global.sesoc.gitTest.DAO;

import java.util.List;

import global.sesoc.gitTest.vo.DeptList;
import global.sesoc.gitTest.vo.JobList;
import global.sesoc.gitTest.vo.Member;

public interface MemberDAO {

	public int join(Member member) throws Exception;
	public int update(Member member) throws Exception;
	public Member selectOne(String loginNum) throws Exception;
	public List<Member> search(String loginNum) throws Exception;
	public List<Member> searchall() throws Exception;
	public List<JobList> jobList() throws Exception;
	public List<DeptList> deptList() throws Exception;
	public int memberUpdate(Member member) throws Exception;
	
	//전체 멤버의 사원번호 가져오기
	public List<String> toList() throws Exception;
}
