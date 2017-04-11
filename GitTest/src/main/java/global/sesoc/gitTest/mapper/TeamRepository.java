package global.sesoc.gitTest.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.gitTest.DAO.TeamDAO;
import global.sesoc.gitTest.vo.Member;

@Repository
public class TeamRepository {

	@Autowired
	SqlSession sqlsession;
	
	
	public Member getManager(String manager_num){
		Member result = null;
		TeamDAO tDAO = sqlsession.getMapper(TeamDAO.class);
		
		try {
			result = tDAO.getManager(manager_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public ArrayList<HashMap<String, Object>> getMembers(String dept_id){
		ArrayList<HashMap<String, Object>> result = null;
		TeamDAO tDAO = sqlsession.getMapper(TeamDAO.class);
		
		try {
			result = tDAO.getMembers(dept_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	
}
