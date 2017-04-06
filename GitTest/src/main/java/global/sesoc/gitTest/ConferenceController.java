package global.sesoc.gitTest;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Array;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import global.sesoc.gitTest.mapper.ConfRepository;
import global.sesoc.gitTest.util.PageNavigator;
import global.sesoc.gitTest.vo.Conf_mng;
import global.sesoc.gitTest.vo.Conf_topic;

@Controller
public class ConferenceController {

	@Autowired
	ConfRepository repository;

	@Autowired
	HttpSession session;

	int countPerPage = 10;
	int pagePerGroup = 5;

	final String uploadPath = "/conffile";

	@RequestMapping(value = "/insertConf", method = RequestMethod.GET)
	public String insertConf(String conf_date, Model model) {

		model.addAttribute("conf_date", conf_date);

		return "Conf/insertConf";
	}

	@RequestMapping(value = "/insertConf", method = RequestMethod.POST)
	public String insertConf(Conf_mng conf_mng, String conf_date2, String time,
			@RequestParam(value = "subtitle", required = true) List<String> subtitles) {

		String conf_date = conf_date2 + ", " + time + ":00:00";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd, hh:mm:ss");
		Date conf_date3;
		try {
			conf_date3 = sdf.parse(conf_date);
			conf_mng.setConf_date(conf_date3);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<Conf_topic> conf_topics = new ArrayList<>();

		for (int i = 0; i < subtitles.size(); i++) {
			Conf_topic conf_topic = new Conf_topic();
			conf_topic.setSubtitle(subtitles.get(i));
			conf_topics.add(conf_topic);
		}

		Date todate = new Date();
		Date todate2;
		try {
			todate2 = sdf.parse(conf_date);
			conf_mng.setTodate(todate2);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		int result = repository.insertConf(conf_mng, conf_topics);

		return "redirect:/confList";
	}

	@RequestMapping(value = "/confList", method = RequestMethod.GET)
	public String serch(@RequestParam(value = "searchTitle", defaultValue = "") String searchTitle,
			@RequestParam(value = "countPerPage", defaultValue = "10") int countPerPage,
			@RequestParam(value = "searchText", defaultValue = "") String searchText,
			@RequestParam(value = "page", defaultValue = "1") int currentPage, Model model) {
		int totalRecordsCount = 0;
		totalRecordsCount = repository.getTotal(searchTitle, searchText);
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, currentPage, totalRecordsCount);
		int start = navi.getStartRecord() + 1;
		int end = navi.getStartRecord() + countPerPage;
		List<Conf_mng> confList = repository.confList(searchTitle, searchText, start, end);
		// SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd, hh:mm:ss");
		// for (int i = 0; i < confList.size(); i++) {
		// String date2 = sdf.format(confList.get(i).getConf_date());
		// System.out.println(date2);
		// Date date;
		// try {
		// date = sdf.parse(date2);
		// confList.get(i).setConf_date(date);
		// System.out.println(confList.get(i).getConf_date());
		// } catch (ParseException e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }
		// }
		model.addAttribute("confList", confList);
		model.addAttribute("total", totalRecordsCount);
		model.addAttribute("searchTitle", searchTitle);
		model.addAttribute("searchText", searchText);
		model.addAttribute("navi", navi);

		return "Conf/confList";
	}

	@RequestMapping(value = "/selectConf", method = RequestMethod.GET)
	public String confView(int conf_num, Model model) {

		session.removeAttribute("conf_mng");
		session.removeAttribute("employee_nums");
		session.removeAttribute("list_topic");

		Conf_mng conf_mng = repository.selectConf(conf_num);
		session.setAttribute("conf_mng", conf_mng);
		String employees_num = conf_mng.getEmployee_nums();
		String[] employee_nums = employees_num.split(",");
		session.setAttribute("employee_nums", employee_nums);
		List<Conf_topic> list_topic = repository.selectConf_topic(conf_num);
		session.setAttribute("list_topic", list_topic);

		return "Conf/confView";
	}

	@RequestMapping(value = "/updateConf", method = RequestMethod.GET)
	public String updateConf(Model model) {

		return "Conf/updateConf";
	}

	@RequestMapping(value = "/updateConfs", method = RequestMethod.GET)
	public String updateConf(Conf_mng conf_mng, String conf_date2, String todate2,
			@RequestParam(value = "subtitle_id", required = true) List<Integer> subtitle_ids,
			@RequestParam(value = "subtitle", required = true) List<String> subtitles,
			@RequestParam(value = "employee_num", required = true) List<Integer> employee_nums,
			@RequestParam(value = "process", required = true) List<Integer> processes) {

		SimpleDateFormat sdf2 = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
		try {
			Date conf_date = sdf2.parse(conf_date2);
			conf_mng.setConf_date(conf_date);
			Date todate = sdf2.parse(todate2);
			conf_mng.setTodate(todate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ArrayList<Conf_topic> conf_topics = new ArrayList<>();

		for (int i = 0; i < subtitles.size(); i++) {
			Conf_topic conf_topic = new Conf_topic();
			conf_topic.setConf_num(conf_mng.getConf_num());
			conf_topic.setSubtitle_id(subtitle_ids.get(i));
			conf_topic.setSubtitle(subtitles.get(i));
			conf_topic.setEmployee_num(employee_nums.get(i));
			conf_topic.setProcess(processes.get(i));
			conf_topics.add(conf_topic);
		}
		int result = repository.updateConf(conf_mng, conf_topics);

		return "redirect:/selectConf?conf_num=" + conf_mng.getConf_num();
	}

	@RequestMapping(value = "/deleteConf", method = RequestMethod.POST)
	public String deleteConf(int conf_num, Model model) {

		int result = repository.deleteConf(conf_num);

		return "redirect:/confList";
	}

	@RequestMapping(value = "download", method = RequestMethod.GET)
	public String download(int conf_num, String savedfile, HttpServletResponse response) {

		Conf_mng conf_mng = repository.selectConf(conf_num);

		String originalfile = conf_mng.getOriginalfile();

		// 사용자 쪽에서 다운로드 받도록 response 객체의 헤드를 조작

		try {
			response.setHeader("Content-Disposition",
					"attachment;filename=" + URLEncoder.encode(originalfile, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String fullpath = uploadPath + "/" + conf_mng.getSavedfile();

		ServletOutputStream fileout = null;
		FileInputStream filein = null;

		try {
			filein = new FileInputStream(fullpath);
			fileout = response.getOutputStream();

			// spring 에서 제공하는 유틸리티
			FileCopyUtils.copy(filein, fileout);

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (filein != null)
					filein.close();
				if (fileout != null)
					fileout.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}

}
