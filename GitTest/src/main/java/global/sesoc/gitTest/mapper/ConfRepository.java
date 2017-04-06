package global.sesoc.gitTest.mapper;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.gitTest.DAO.ConfDAO;
import global.sesoc.gitTest.vo.Conf_mng;
import global.sesoc.gitTest.vo.Conf_topic;

@Repository
public class ConfRepository {

	@Autowired
	SqlSession sqlSession;

	public int insertConf(Conf_mng conf_mng, List<Conf_topic> conf_topics) {

		ConfDAO dao = sqlSession.getMapper(ConfDAO.class);

		System.out.println(conf_mng);
		int result = 0;
		try {
			result = dao.insertConf_mng(conf_mng);
			int conf_num = dao.selectInsert(conf_mng);
			System.out.println(conf_num);
			for (int i = 0; i < conf_topics.size(); i++) {
				conf_topics.get(i).setConf_num(conf_num);
			}
			for (int i = 0; i < conf_topics.size(); i++) {
				if (result == 1) {
					Conf_topic conf_topic = conf_topics.get(i);
					result = dao.insertConf_topic(conf_topic);
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public int deleteConf(int conf_num) {

		ConfDAO dao = sqlSession.getMapper(ConfDAO.class);

		int result = 0;
		try {
			result = dao.deleteConf(conf_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public int updateConf(Conf_mng conf_mng, ArrayList<Conf_topic> conf_topics) {

		ConfDAO dao = sqlSession.getMapper(ConfDAO.class);

		int result = 0;
		try {
			result = dao.updateConf_mng(conf_mng);
			for (int i = 0; i < conf_topics.size(); i++) {
				if (result == 1) {
					Conf_topic conf_topic = conf_topics.get(i);
					result = dao.updateConf_topic(conf_topic);
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public Conf_mng selectConf(int conf_num) {

		ConfDAO dao = sqlSession.getMapper(ConfDAO.class);
		
		
		Conf_mng conf_mng = null;
		try {
			conf_mng = dao.selectConf(conf_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conf_mng;
	}
	
	public List<Conf_topic> selectConf_topic(int conf_num) {

		ConfDAO dao = sqlSession.getMapper(ConfDAO.class);

		
		List<Conf_topic> list_topic = null;
		try {
			list_topic = dao.selectConf_topic(conf_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list_topic;
	}

	public List<Conf_mng> confList(String searchTitle, String searchText, int start, int end) {

		ConfDAO dao = sqlSession.getMapper(ConfDAO.class);

		Map<String, String> search = new HashMap<>();
		
		search.put("searchTitle", searchTitle);
		search.put("searchText", searchText);
		search.put("firstnum", start+"");
		search.put("endnum", end+"");
		
		List<Conf_mng> list = null;
		
		try {
			list = dao.confList(search);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public int getTotal(String searchTitle, String searchText){
		
		ConfDAO dao = sqlSession.getMapper(ConfDAO.class);
		
		Map<String, String> search = new HashMap<>();
		
		search.put("searchTitle", searchTitle);
		search.put("searchText", searchText);
		
		int total = 0;
		
		try {
			total = dao.getTotal(search);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return total;
		
	}
	
public List<Conf_mng> calendarMyList(String employee_num){
		
		ConfDAO dao = sqlSession.getMapper(ConfDAO.class);
		
		List<Conf_mng> calendarMyList = null;
		try {
			calendarMyList = dao.calendarMyList(employee_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return calendarMyList;
		
	}
}