package global.sesoc.gitTest.DAO;

import java.util.List;
import java.util.Map;

import global.sesoc.gitTest.vo.Conf_mng;
import global.sesoc.gitTest.vo.Conf_topic;

public interface ConfDAO {
   public int insertConf_mng(Conf_mng conf_mng) throws Exception;
   public int insertConf_topic(Conf_topic conf_topic) throws Exception;
   public int updateConf_mng(Conf_mng conf_mng) throws Exception;
   public int updateConf_topic(Conf_topic conf_topic) throws Exception;
   public int deleteConf(int conf_num) throws Exception;
   public Conf_mng selectConf(int conf_num) throws Exception;
   public List<Conf_topic> selectConf_topic(int conf_num) throws Exception;
   public int selectInsert(Conf_mng conf_mng) throws Exception;
   public int getTotal(Map<String, String> search) throws Exception;
   public List<Conf_mng> confList(Map<String, String> search) throws Exception;
   public List<Conf_mng> calendarMyList(String employee_num) throws Exception;
   public int insertTextFile(Conf_mng conf_mng) throws Exception;
}