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

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.gitTest.DAO.ConfDAO;
import global.sesoc.gitTest.vo.Conf_mng;
import global.sesoc.gitTest.vo.Conf_topic;
import global.sesoc.gitTest.vo.Member;
import global.sesoc.gitTest.vo.Message;

@Repository
public class ConfRepository {

	@Autowired
	SqlSession sqlSession;

	@Autowired
	HttpSession session;

	List<Map<String, Object>> stringTextList = new ArrayList<>();
	Map<String, Object> stringTextMap = new HashMap<>();

	public int insertConf(Conf_mng conf_mng, List<String> subtitles) {

		ConfDAO dao = sqlSession.getMapper(ConfDAO.class);
		Date conf_date3 = conf_mng.getConf_date();
		conf_mng.setConf_date(conf_date3);
		List<Conf_topic> conf_topics = new ArrayList<>();

		for (int i = 0; i < subtitles.size(); i++) {
			Conf_topic conf_topic = new Conf_topic();
			conf_topic.setSubtitle(subtitles.get(i));
			conf_topics.add(conf_topic);
		}

		Date todate = new Date();
		conf_mng.setTodate(todate);

		int result = 0;
		int conf_num = 0;
		try {
			result = dao.insertConf_mng(conf_mng);
			conf_num = dao.selectInsert(conf_mng);
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
			e.printStackTrace();
		}
		return result;
	}

	public int updateConf(Conf_mng conf_mng, List<Integer> subtitle_ids, List<String> subtitles,
			List<String> employee_nums, List<Integer> processes) {

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
			e.printStackTrace();
		}
		return list_topic;
	}

	public List<Map<String, Object>> confList(String searchTitle, String searchText, int start, int end) {

		ConfDAO dao = sqlSession.getMapper(ConfDAO.class);

		Map<String, String> search = new HashMap<>();

		Member user = (Member) session.getAttribute("user");

		search.put("searchTitle", searchTitle);
		search.put("searchText", searchText);
		search.put("firstnum", start + "");
		search.put("endnum", end + "");

		List<Conf_mng> searchConfList = null;
		List<Map<String, Object>> confList = new ArrayList<Map<String, Object>>();

		try {
			searchConfList = dao.confList(search);
			for (int i = 0; i < searchConfList.size(); i++) {
				String[] employee_num = searchConfList.get(i).getEmployee_nums().split(",");
				for (int j = 0; j < employee_num.length; j++) {
					if (user.getEmployee_num().equals(employee_num[j])) {
						Map<String, Object> conf_mng = new HashMap<>();
						conf_mng.put("conf_num", searchConfList.get(i).getConf_num());
						conf_mng.put("title", searchConfList.get(i).getTitle());
						conf_mng.put("employee_nums", searchConfList.get(i).getEmployee_nums());
						SimpleDateFormat viewDate = new SimpleDateFormat("yyyy-MM-dd HH:mm");
						String viewConf_date = viewDate.format(searchConfList.get(i).getConf_date());
						conf_mng.put("viewConf_date", viewConf_date);
						String viewTodate = viewDate.format(searchConfList.get(i).getTodate());
						conf_mng.put("viewTodate", viewTodate);
						confList.add(conf_mng);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return confList;
	}

	public int getTotal(String searchTitle, String searchText) {

		ConfDAO dao = sqlSession.getMapper(ConfDAO.class);

		Map<String, String> search = new HashMap<>();

		search.put("searchTitle", searchTitle);
		search.put("searchText", searchText);

		int total = 0;

		try {
			total = dao.getTotal(search);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return total;

	}

	public List<Conf_mng> calendarMyList(String employee_num) {

		ConfDAO dao = sqlSession.getMapper(ConfDAO.class);

		Member user = (Member) session.getAttribute("user");

		List<Conf_mng> calendarMyList = new ArrayList<>();
		List<Conf_mng> searchCalendarMyList = new ArrayList<>();
		try {
			searchCalendarMyList = dao.calendarMyList(employee_num);
			for (int i = 0; i < searchCalendarMyList.size(); i++) {
				String[] employee_nums = searchCalendarMyList.get(i).getEmployee_nums().split(",");
				for (int j = 0; j < employee_nums.length; j++) {
					if (user.getEmployee_num().equals(employee_nums[j])) {
						calendarMyList.add(searchCalendarMyList.get(i));
					}
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return calendarMyList;

	}

	public int insertTextFile(int conf_num, String confText) {

		ConfDAO dao = sqlSession.getMapper(ConfDAO.class);
		Conf_mng conf_mng = null;
		try {
			conf_mng = dao.selectConf(conf_num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String[] confTextList = confText.split("<br>");
		BufferedWriter out;
		try {
			out = new BufferedWriter(new FileWriter("D:\\" + conf_mng.getConf_num() + ".txt"));
			for (int j = 0; j < confTextList.length; j++) {
				out.write(confTextList[j]);
				out.newLine();
			}
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		conf_mng.setOriginalfile(conf_mng.getConf_num() + ".txt");
		conf_mng.setSavedfile(conf_mng.getConf_num() + ".txt");

		int result = 0;
		try {
			result = dao.insertTextFile(conf_mng);
		} catch (Exception e) {
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
					if (employee_nums[j].equals(employee_num)) {
						conf_mng = conf_mngs.get(i);
						return conf_mng;
					}
					;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public void searchRoomNum(Message message) {
		ConfDAO dao = sqlSession.getMapper(ConfDAO.class);

		int substringConfTitle = message.getContent().indexOf("<br>Conf Title : ");
		int substringConfNum = message.getContent().indexOf("<br>Conf Num : ");


		int conf_num = Integer.parseInt(message.getContent().substring(substringConfNum + 15, substringConfTitle));
		String roomNum = message.getContent().substring(substringConfNum - 17, substringConfNum).replaceAll("-", "")
				+ conf_num;
		roomNum = roomNum.replaceAll(",", "");
		roomNum = roomNum.replaceAll(" ", "");
		roomNum = roomNum.replaceAll(":", "");
		Conf_mng conf_mng;
		try {
			conf_mng = dao.selectConf(conf_num);
			if (conf_mng.getDeleteCheck() == 0) {
				session.setAttribute("conf_num", conf_num);
				session.setAttribute("roomNum", roomNum);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}