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
	
	List<Map<String, Object>> stringTextList = new ArrayList<>();
	Map<String, Object> stringTextMap = new HashMap<>();

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
		int conf_num = 0;
		try {
			result = dao.insertConf_mng(conf_mng);
			conf_num = dao.selectInsert(conf_mng);
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
		return conf_num;
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

	public int updateConf(Conf_mng conf_mng, List<Integer> subtitle_ids, List<String> subtitles, List<String> employee_nums, List<Integer> processes) {

		ConfDAO dao = sqlSession.getMapper(ConfDAO.class);
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

	public List<Map<String, Object>> confList(String searchTitle, String searchText, int start, int end) {

		ConfDAO dao = sqlSession.getMapper(ConfDAO.class);

		Map<String, String> search = new HashMap<>();
		
		search.put("searchTitle", searchTitle);
		search.put("searchText", searchText);
		search.put("firstnum", start+"");
		search.put("endnum", end+"");
		
		List<Conf_mng> list = null;
		List<Map<String, Object>> confList = new ArrayList<Map<String,Object>>();
		
		try {
			list = dao.confList(search);
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> conf_mng = new HashMap<>();
				conf_mng.put("conf_num", list.get(i).getConf_num());
				conf_mng.put("title", list.get(i).getTitle());
				conf_mng.put("employee_nums", list.get(i).getEmployee_nums());
				SimpleDateFormat viewDate = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				String viewConf_date = viewDate.format(list.get(i).getConf_date());
				conf_mng.put("viewConf_date", viewConf_date);
				String viewTodate = viewDate.format(list.get(i).getTodate());
				conf_mng.put("viewTodate", viewTodate);
				confList.add(conf_mng);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return confList;
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
	
//	public void saveText(String conf_num, String stringText){
//		
//		for (int i = 0; i < stringTextList.size(); i++) {
//			if(stringTextList.get(i).get("conf_num").equals(conf_num)){
//				stringText = stringTextList.get(i).get("stringText") + " <br><br> " + stringText;
//				stringTextList.get(i).put("stringText", stringText);
//				System.out.println("cunf_num"+conf_num+"text==="+stringText);
//			}
//		}
//		stringTextMap.put("conf_num", conf_num);
//		stringTextMap.put("stringText", stringText);
//		stringTextList.add(stringTextMap);
//		System.out.println("newCunf_num"+conf_num+"text==="+stringText);
//	}
//	
	public int insertTextFile(int conf_num, String confText){
		
		ConfDAO dao = sqlSession.getMapper(ConfDAO.class);
		Conf_mng conf_mng = null;
		try {
			conf_mng = dao.selectConf(conf_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		String conf_num2 = conf_num+"";
//		String stringText = null;
//		System.out.println(stringTextList.size());
//		for (int i = 0; i < stringTextList.size(); i++) {
//			if(stringTextList.get(i).get("conf_num").equals(conf_num2)){
//				stringText = (String) stringTextList.get(i).get("stringText");
//				System.out.println("save===="+stringText);
//				stringTextList.get(i).remove("conf_num");
//				stringTextList.get(i).remove("stringText");
//			}
//		}
//		
//		System.out.println(stringText);
		
		String[] confTextList = confText.split("<br>");
		BufferedWriter out;
		try {
			out = new BufferedWriter(new FileWriter("D:\\"+conf_mng.getConf_num()+".txt"));
			for (int j = 0; j < confTextList.length; j++) {
				out.write(confTextList[j]);
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
	
	public Conf_mng countDown(String employee_num) {
		ConfDAO dao = sqlSession.getMapper(ConfDAO.class);
		Conf_mng conf_mng = null;
		try {
			List<Conf_mng> conf_mngs = dao.countDown(employee_num);
			for (int i = 0; i < conf_mngs.size(); i++) {
				String[] employee_nums = conf_mngs.get(i).getEmployee_nums().split(",");
				for (int j = 0; j < employee_nums.length; j++) {
					if(employee_nums[j].equals(employee_num)){
						conf_mng = conf_mngs.get(i);
						return conf_mng;
					};
				}
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}