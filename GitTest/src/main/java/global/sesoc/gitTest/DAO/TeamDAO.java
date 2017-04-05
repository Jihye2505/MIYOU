package global.sesoc.gitTest.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import global.sesoc.gitTest.vo.Member;

public interface TeamDAO {

	public Member getManager(String manager_num) throws Exception;
	public ArrayList<HashMap<String, Object>> getMembers(String manager_num) throws Exception;
	public Member getDepartment(String manager_num) throws Exception;
	public Member getPosition(String manager_num) throws Exception;
}
