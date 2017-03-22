package global.sesoc.gitTest.mapper;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.gitTest.MemberController;
import global.sesoc.gitTest.DAO.MemberDAO;
import global.sesoc.gitTest.vo.Member;

@Repository
public class MemberRepository {

	final static Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	SqlSession sqlsession;
	
	public int insertMember(Member member){
		int result=0;
		
		MemberDAO mDAO = sqlsession.getMapper(MemberDAO.class);
		try {
			result = mDAO.insertMember(member);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int updateMember(Member member){
		   int result=0;
		      
		   MemberDAO mDAO = sqlsession.getMapper(MemberDAO.class);
		   try {
		      result = mDAO.updateMember(member);
		   } catch (Exception e) {
		      // TODO Auto-generated catch block
		      e.printStackTrace();
		   }
		      
		   return result;
		}

	
}
