package global.sesoc.gitTest;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import global.sesoc.gitTest.mapper.ConfRepository;
import global.sesoc.gitTest.mapper.MemberRepository;
import global.sesoc.gitTest.mapper.MessageRepository;
import global.sesoc.gitTest.util.PageNavigator;
import global.sesoc.gitTest.vo.Conf_mng;
import global.sesoc.gitTest.vo.Conf_topic;
import global.sesoc.gitTest.vo.Member;
import global.sesoc.gitTest.vo.Message;
import global.sesoc.gitTest.vo.MiyouTranslate;

@Controller
public class ConferenceController {

	@Autowired
	ConfRepository confRepository;

	// jh
	@Autowired
	MemberRepository mRepository;

	@Autowired
	MessageRepository msgRepository;

	@Autowired
	HttpSession session;

	int countPerPage = 10;
	int pagePerGroup = 5;

	final String uploadPath = "D:\\";

	@RequestMapping(value = "/insertConf", method = RequestMethod.GET)
	public String insertConf(String conf_date, Model model) {

		// jh
		List<String> toList = null;
		ArrayList<String> toList2 = new ArrayList<>();
		try {
			toList = mRepository.toList();
			for (String empNum : toList) {
				toList2.add("'" + empNum + "'");
			}
			toList = toList2;
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.setAttribute("toList", toList);
		// end Jh

		String conf_date2 = conf_date.substring(0, 10);
		// System.out.println(conf_date2);
		model.addAttribute("conf_date", conf_date2);

		return "Conf/insertConf";
	}

	@RequestMapping(value = "/insertConf", method = RequestMethod.POST)
	public String insertConf(Conf_mng conf_mng, String conf_date2,
			@RequestParam(value = "subtitle", required = true, defaultValue = "null") List<String> subtitles,
			HttpSession session) {

		try {
			Date transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(conf_date2);
			conf_mng.setConf_date(transFormat);
			int conf_num = confRepository.insertConf(conf_mng, subtitles);
			if (conf_num != 0) {
				conf_date2 = new SimpleDateFormat("yyyy-MM-dd, HH:mm").format(transFormat);
				Member user = (Member) session.getAttribute("user");
				conf_mng.setConf_num(conf_num);
				String employee_num = user.getEmployee_num();

				msgRepository.sendConfMessage(conf_mng, conf_date2, employee_num);

				int total = msgRepository.countMessage(user.getEmployee_num());
				int unread = msgRepository.countNotRead(user.getEmployee_num());
				session.setAttribute("total", total);
				session.setAttribute("unread", unread);
			}

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "redirect:/confList";
	}

	@RequestMapping(value = "/confList", method = RequestMethod.GET)
	public String serch(@RequestParam(value = "searchTitle", defaultValue = "") String searchTitle,
			@RequestParam(value = "countPerPage", defaultValue = "10") int countPerPage,
			@RequestParam(value = "searchText", defaultValue = "") String searchText,
			@RequestParam(value = "page", defaultValue = "1") int currentPage, Model model) {
		this.countPerPage = countPerPage;
		int totalRecordsCount = 0;
		totalRecordsCount = confRepository.getTotal(searchTitle, searchText);
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, currentPage, totalRecordsCount);
		int start = navi.getStartRecord() + 1;
		int end = navi.getStartRecord() + countPerPage;
		List<Map<String, Object>> confList = confRepository.confList(searchTitle, searchText, start, end);
		model.addAttribute("confList", confList);
		model.addAttribute("totalRecordsCount", totalRecordsCount);
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

		Conf_mng conf_mng = confRepository.selectConf(conf_num);
		SimpleDateFormat viewDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String viewConf_date = viewDate.format(conf_mng.getConf_date());
		String viewTodate = viewDate.format(conf_mng.getTodate());
		session.setAttribute("viewConf_date", viewConf_date);
		session.setAttribute("viewTodate", viewTodate);
		session.setAttribute("conf_mng", conf_mng);
		String employees_num = conf_mng.getEmployee_nums();
		String[] employee_nums = employees_num.split(",");
		session.setAttribute("employee_nums", employee_nums);
		List<Conf_topic> list_topic = confRepository.selectConf_topic(conf_num);
		session.setAttribute("list_topic", list_topic);

		return "Conf/confView";
	}

	@RequestMapping(value = "/updateConf", method = RequestMethod.GET)
	public String updateConf(Model model, HttpSession session) {
		Conf_mng conf_mng = (Conf_mng) session.getAttribute("conf_mng");
		Date date1 = conf_mng.getConf_date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String to = transFormat.format(date1);

		model.addAttribute("stringDate", to);

		return "Conf/updateConf";
	}

	@RequestMapping(value = "/updateConfs", method = RequestMethod.GET)
	public String updateConf(Conf_mng conf_mng, String conf_date2, String todate2,
			@RequestParam(value = "subtitle_id", required = true) List<Integer> subtitle_ids,
			@RequestParam(value = "subtitle", required = true, defaultValue = "null") List<String> subtitles,
			@RequestParam(value = "employee_num", required = true, defaultValue = "null") List<String> employee_nums,
			@RequestParam(value = "process", required = true) List<Integer> processes) {

		// date를 string으로 줘야 거기에 이상한 날짜 안뜨고 제대로????

		SimpleDateFormat transTodate = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
		SimpleDateFormat transStringDate = new SimpleDateFormat("yyyy-MM-dd, HH:mm");
		SimpleDateFormat transConf_date2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String conf_date3 = null;
		try {
			Date conf_date = transConf_date2.parse(conf_date2);
			conf_date3 = transStringDate.format(conf_date);
			conf_mng.setConf_date(conf_date);
			Date todate = transTodate.parse(todate2);
			conf_mng.setTodate(todate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		int result = confRepository.updateConf(conf_mng, subtitle_ids, subtitles, employee_nums, processes);
		if (result != 0) {

			Member user = (Member) session.getAttribute("user");
			String employee_num = user.getEmployee_num();

			msgRepository.sendConfMessage(conf_mng, conf_date3, employee_num);

			int total = msgRepository.countMessage(user.getEmployee_num());
			int unread = msgRepository.countNotRead(user.getEmployee_num());
			session.setAttribute("total", total);
			session.setAttribute("unread", unread);

		}

		return "redirect:/selectConf?conf_num=" + conf_mng.getConf_num();
	}

	@RequestMapping(value = "/deleteConf", method = RequestMethod.POST)
	public String deleteConf(int conf_num, String title, String conf_date, String employee_nums, Model model,
			HttpSession session) {

		Message message = new Message();
		SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd, HH:mm");

		Date conf_date2;
		try {
			conf_date2 = sdf.parse(conf_date);
			String yyyymmdd = sdf2.format(conf_date2);
			message.setNotice("CC");
			String content = "Conference Cancel" + "<br>Date : " + yyyymmdd + "<br>Conf Title : " + title;
			// System.out.println(content);
			message.setContent(content);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Member user = (Member) session.getAttribute("user");
		message.setEmployee_num(user.getEmployee_num());

		String receivers = employee_nums;
		String[] toList = receivers.split(",");
		for (String receiver : toList) {
			message.setReceiver_num(receiver);
			int result = msgRepository.sendMessage(message);
			int total = msgRepository.countMessage(user.getEmployee_num());
			int unread = msgRepository.countNotRead(user.getEmployee_num());
			session.setAttribute("total", total);
			session.setAttribute("unread", unread);
		}

		int result = confRepository.deleteConf(conf_num);
		session.removeAttribute("conf_num");

		return "redirect:/confList";
	}

	// @RequestMapping(value = "/saveText", method = RequestMethod.POST)
	// public String saveText(String conf_num, String stirngText, HttpSession
	// session) {
	//
	// confRepository.saveText(conf_num, stringText);
	//
	// return "";
	// }

	@RequestMapping(value = "/saveText", method = RequestMethod.POST)
	public String saveText(String confText, HttpSession session) {

		String conf_num2 = (String) session.getAttribute("conf_num");
		int conf_num = Integer.parseInt(conf_num2);
		System.out.println(confText);

		int result = confRepository.insertTextFile(conf_num, confText);

		return "";
	}

	@RequestMapping(value = "download", method = RequestMethod.GET)
	public String download(int conf_num, String savedfile, HttpServletResponse response) {

		Conf_mng conf_mng = confRepository.selectConf(conf_num);

		String originalfile = conf_mng.getOriginalfile();

		// 사용자 쪽에서 다운로드 받도록 response 객체의 헤드를 조작

		try {
			response.setHeader("Content-Disposition",
					"attachment;filename=" + URLEncoder.encode(originalfile, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String fullpath = uploadPath + conf_mng.getSavedfile();
		// System.out.println(fullpath+"==========다운로드 경로");

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

	@RequestMapping(produces = "text/plain;charset=UTF-8", value = "/calendarMyList", method = RequestMethod.POST)
	public @ResponseBody String calendarMyList(HttpSession session, Model model) {

		Member member = (Member) session.getAttribute("user");
		if (member != null) {
			String employee_num = member.getEmployee_num();
			List<Conf_mng> list = confRepository.calendarMyList(employee_num);

			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			List<HashMap<String, Object>> calendarMyList = new ArrayList<>();
			for (int i = 0; i < list.size(); i++) {
				HashMap<String, Object> myList = new HashMap<>();
				myList.put("conf_num", list.get(i).getConf_num());
				myList.put("title", list.get(i).getTitle());
				String conf_date2 = sdf2.format(list.get(i).getConf_date());
				// System.out.println("conf_date2====="+conf_date2);
				myList.put("start", conf_date2);
				calendarMyList.add(myList);

			}

			Gson gson = new Gson();
			String data = gson.toJson(calendarMyList);
			// System.out.println(data);

			return data;
		}
		return null;
	}

	@RequestMapping(value = "/memo", method = RequestMethod.GET)
	public String memo() {

		return "Conf/memo";
	}

	@RequestMapping(value = "/chatting", method = RequestMethod.GET)
	public String chatting() {

		return "Conf/chatting";
	}

	@RequestMapping(value = "/confSummary", method = RequestMethod.GET)
	public String confSummary() {

		session.removeAttribute("conf_mngForSummary");
		session.removeAttribute("employee_numsForSummary");
		session.removeAttribute("list_topicForSummary");

		if (session.getAttribute("conf_num") != null) {
			String conf_nums = (String) session.getAttribute("conf_num");
			int conf_num = Integer.parseInt(conf_nums);
			Conf_mng conf_mngForSummary = confRepository.selectConf(conf_num);
			if (conf_mngForSummary.getDeleteCheck() == 0) {
				session.setAttribute("conf_mngForSummary", conf_mngForSummary);
				String employees_numForSummary = conf_mngForSummary.getEmployee_nums();
				session.setAttribute("employees_numForSummary", employees_numForSummary);
				List<Conf_topic> list_topicForSummary = confRepository.selectConf_topic(conf_num);
				session.setAttribute("list_topicForSummary", list_topicForSummary);
			}
		}
		return "Conf/confSummary";
	}

	@RequestMapping(value = "/deleteCheck", method = RequestMethod.GET)
	public @ResponseBody String deleteCheck() {
//		session.removeAttribute("conf_num");
//		System.out.println(session.getAttribute("conf_num"));
		String result = null;
		if (session.getAttribute("conf_num")!=null) {
			String conf_nums = (String) (session.getAttribute("conf_num")+"");
			int conf_num = Integer.parseInt(conf_nums);
			Conf_mng conf_mng = confRepository.selectConf(conf_num);
			System.out.println(conf_mng.getDeleteCheck());
			if (conf_mng.getDeleteCheck() == 0) {
				return conf_mng.getConf_num() + "";
			}
		}
		return "";
	}

	@RequestMapping(value = "/countDown", method = RequestMethod.GET)
	public @ResponseBody Object[] countDown(Model model, HttpSession session) {
		Member member = (Member) session.getAttribute("user");
		Conf_mng conf_mng = confRepository.countDown(member.getEmployee_num());
		Date todate = new Date();
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd, HH:mm");
		if (conf_mng != null) {
			String conf_date = sdf2.format(conf_mng.getConf_date());
			List<Conf_topic> conf_topicList = confRepository.selectConf_topic(conf_mng.getConf_num());
			Object countDown = (conf_mng.getConf_date().getTime() - todate.getTime()) / 1000;
			Object[] count = { countDown, conf_mng.getTitle(), conf_date, conf_mng.getEmployee_nums(), conf_topicList };
			// System.out.println("1"+count[0]+count[1]+count[2]+count[3]);
			return count;
		}

		return null;
	}

	@RequestMapping(value = "/countDownEnd", method = RequestMethod.GET)
	public String countDownEndMessage(HttpSession session) {
		Message message = (Message) session.getAttribute("message");
		if (message.getNotice().equals("C")) {
			confRepository.searchRoomNum(message);
		}
		return "Message/countDownEndMessage";
	}

}