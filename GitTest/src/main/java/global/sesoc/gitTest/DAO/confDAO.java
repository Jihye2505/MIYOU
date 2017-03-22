package global.sesoc.gitTest.DAO;

import java.util.List;

import global.sesoc.gitTest.vo.Conf_mng;
import global.sesoc.gitTest.vo.Conf_topic;

public interface confDAO {
	public int insertConf_mng(Conf_mng conf_mng) throws Exception;
	public int insertConf_topic(String conf_topic) throws Exception;
	public int updateConf_mng(Conf_mng conf_mng) throws Exception;
	public int updateConf_topic(Conf_topic conf_topic) throws Exception;
	public int deleteConf(int conf_num) throws Exception;
	public Conf_mng selectConf(int conf_num) throws Exception;
	public List<Conf_mng> selectAllConf() throws Exception;
}
