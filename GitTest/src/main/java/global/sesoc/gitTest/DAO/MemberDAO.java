package global.sesoc.gitTest.DAO;

import java.util.List;

import global.sesoc.gitTest.vo.JobDeptList;
import global.sesoc.gitTest.vo.Member;

public interface MemberDAO {

	public int insertMember(Member member) throws Exception;
	public int updateMember(Member member) throws Exception;
	public Member selectOne(String loginNum, String loginPw) throws Exception;
	public List<JobDeptList> jobDeptList() throws Exception;
}
