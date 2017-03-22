package global.sesoc.gitTest.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.gitTest.DAO.confDAO;
import global.sesoc.gitTest.vo.Conf_mng;
import global.sesoc.gitTest.vo.Conf_topic;

@Repository
public class confRepository {

	@Autowired
	SqlSession sqlSession;

	public int insertConf(Conf_mng conf_mng, List<Conf_topic> conf_topics) {

		confDAO dao = sqlSession.getMapper(confDAO.class);

		int result = 0;

		try {
//			result = dao.insertConf_mng(conf_mng);
//			for (int i = 0; i < conf_topics.size(); i++) {
//				if (result == 1) {
//					String conf_topic = conf_topics.get(i).getSubtitle();
//					result = dao.insertConf_topic(conf_topic);
//				}
//			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public List<Conf_mng> confList() {

		confDAO dao = sqlSession.getMapper(confDAO.class);

		List<Conf_mng> list = new ArrayList<>();
		try {
//			list = dao.selectAllConf();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public int deleteConf(int conf_num) {

		confDAO dao = sqlSession.getMapper(confDAO.class);

		int result = 0;
		try {
//			result = dao.deleteConf(conf_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public int updateConf(Conf_mng conf_mng, List<Conf_topic> conf_topics) {

		confDAO dao = sqlSession.getMapper(confDAO.class);

		int result = 0;
		try {
//			result = dao.updateConf_mng(conf_mng);
//			for (int i = 0; i < conf_topics.size(); i++) {
//				if (result == 1) {
//					Conf_topic conf_topic = conf_topics.get(i);
//					result = dao.updateConf_topic(conf_topic);
//				}
//			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public Conf_mng confList(int conf_num) {

		confDAO dao = sqlSession.getMapper(confDAO.class);

		Conf_mng conf_mng = null;
		try {
//			conf_mng = dao.selectConf(conf_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conf_mng;
	}
}
