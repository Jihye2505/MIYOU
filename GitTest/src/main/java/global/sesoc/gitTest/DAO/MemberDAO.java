package global.sesoc.gitTest.DAO;

import global.sesoc.gitTest.vo.Member;

public interface MemberDAO {

	public int insertMember(Member member) throws Exception;
	public int updateMember(Member member) throws Exception;

	
}
