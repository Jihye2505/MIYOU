package global.sesoc.gitTest.mapper;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
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

	public int insertConf(Conf_mng conf_mng, List<String> subtitles) {

		ConfDAO dao = sqlSession.getMapper(ConfDAO.class);

		/*
		String conf_date = conf_mng.getConf_date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd, hh:mm:ss");
		try {
			conf_date3 = sdf.parse(conf_date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
		Date conf_date3= conf_mng.getConf_date();
		conf_mng.setConf_date(conf_date3);
		List<Conf_topic> conf_topics = new ArrayList<>();

		for (int i = 0; i < subtitles.size(); i++) {
			Conf_topic conf_topic = new Conf_topic();
			conf_topic.setSubtitle(subtitles.get(i));
			conf_topics.add(conf_topic);
//			System.out.println("subtitle========" + conf_topics);
		}

		Date todate = new Date();
		conf_mng.setTodate(todate);
		
		
//		System.out.println(conf_mng);
		int result = 0;
		try {
			result = dao.insertConf_mng(conf_mng);
			int conf_num = dao.selectInsert(conf_mng);
//			System.out.println(conf_num);
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

	public int updateConf(Conf_mng conf_mng, String conf_date2, String todate2, List<Integer> subtitle_ids, List<String> subtitles, List<String> employee_nums, List<Integer> processes) {

		ConfDAO dao = sqlSession.getMapper(ConfDAO.class);

		
//		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd, hh:mm:ss");
		try {
			Date transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(conf_date2);
			conf_mng.setConf_date(transFormat);
//			Date conf_date = sdf2.parse(conf_date2);
//			conf_mng.setConf_date(conf_date);
			
			Date todate = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.ENGLISH).parse(todate2);
			conf_mng.setTodate(todate);
//			Date todate = sdf2.parse(todate2);
//			conf_mng.setTodate(todate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ArrayList<Conf_topic> conf_topics = new ArrayList<>();

		for (int i = 0; i < subtitle_ids.size(); i++) {
			Conf_topic conf_topic = new Conf_topic();
			conf_topic.setConf_num(conf_mng.getConf_num());
			conf_topic.setSubtitle_id(subtitle_ids.get(i));
			conf_topic.setSubtitle(subtitles.get(i));
			conf_topic.setEmployee_num(employee_nums.get(i));
			conf_topic.setProcess(processes.get(i));
			conf_topics.add(conf_topic);
		}
		
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
//			System.out.println("total============"+total);
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
	
	public int insertTextFile(Conf_mng conf_mng, String stringText){
		
		ConfDAO dao = sqlSession.getMapper(ConfDAO.class);
		
//		System.out.println(stringText);
		String[] s = stringText.split("[\r\n\t]");
		BufferedWriter out;
		try {
			out = new BufferedWriter(new FileWriter("D:\\"+conf_mng.getConf_num()+".txt"));
			for (int i = 0; i < s.length; i++) {
				out.write(s[i]);
				out.newLine();
			}
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		conf_mng.setOriginalfile(conf_mng.getConf_num()+".txt");
		conf_mng.setSavedfile(conf_mng.getConf_num()+".txt");
		
		int result= 0;
		try {
			result = dao.insertTextFile(conf_mng);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
		
	}
}