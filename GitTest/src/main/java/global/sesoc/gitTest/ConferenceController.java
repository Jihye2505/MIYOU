package global.sesoc.gitTest;

import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Array;
import java.net.URLEncoder;
import java.text.DateFormat;
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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import global.sesoc.gitTest.mapper.ConfRepository;
import global.sesoc.gitTest.mapper.MemberRepository;
import global.sesoc.gitTest.mapper.MessageRepository;
import global.sesoc.gitTest.util.PageNavigator;
import global.sesoc.gitTest.vo.Conf_mng;
import global.sesoc.gitTest.vo.Conf_topic;
import global.sesoc.gitTest.vo.Member;
import global.sesoc.gitTest.vo.Message;

@Controller
public class ConferenceController {

	@Autowired
	ConfRepository repository;
	
	//jh
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

		//jh
		List<String> toList = null;
		ArrayList<String> toList2 = new ArrayList<>();
		try {
			toList = mRepository.toList();
			for (String empNum : toList) {
				toList2.add("'"+empNum+"'");
			}
			toList = toList2;
		   } catch (Exception e) {
		      e.printStackTrace();
		   }
		session.setAttribute("toList", toList);
		//end Jh
		
		String conf_date2 = conf_date.substring(0,10);
//		System.out.println(conf_date2);
		model.addAttribute("conf_date", conf_date2);

		return "Conf/insertConf";
	}

	@RequestMapping(value = "/insertConf", method = RequestMethod.POST)
	public String insertConf(Conf_mng conf_mng, String conf_date2, String time,
			@RequestParam(value = "subtitle", required = true, defaultValue = "null") List<String> subtitles
			,HttpSession session) {
		
		Message message = new Message();
		
		String content = 
			"회의가 등록되었습니다."
			+"<br>일시 : "+conf_date2+", "+time+"시"
			+"<br>회의 주제 : "+conf_mng.getTitle()
			+"<br>참여자 명단 : "+conf_mng.getEmployee_nums();
		System.out.println(content);
		message.setContent(content);
		
		Member user = (Member)session.getAttribute("user");
		message.setEmployee_num(user.getEmployee_num());
		message.setNotice("R");

		String receivers = conf_mng.getEmployee_nums();
		String [] toList = receivers.split(",");
		for (String receiver : toList) {
			message.setReceiver_num(receiver);
			int result = msgRepository.sendMessage(message);
		}
		
		int result2 = repository.insertConf(conf_mng, conf_date2, time, subtitles);

		return "redirect:/confList";
	}

	@RequestMapping(value = "/confList", method = RequestMethod.GET)
	public String serch(@RequestParam(value = "searchTitle", defaultValue = "") String searchTitle,
			@RequestParam(value = "countPerPage", defaultValue = "10") int countPerPage,
			@RequestParam(value = "searchText", defaultValue = "") String searchText,
			@RequestParam(value = "page", defaultValue = "1") int currentPage, Model model) {
		this.countPerPage = countPerPage;
		int totalRecordsCount = 0;
		totalRecordsCount = repository.getTotal(searchTitle, searchText);
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, currentPage, totalRecordsCount);
		int start = navi.getStartRecord() + 1;
		int end = navi.getStartRecord() + countPerPage;
		List<Conf_mng> confList = repository.confList(searchTitle, searchText, start, end);
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
			@RequestParam(value = "employee_num", required = true) List<String> employee_nums,
			@RequestParam(value = "process", required = true) List<Integer> processes) {

		
		int result = repository.updateConf(conf_mng, conf_date2, todate2, subtitle_ids, subtitles, employee_nums, processes);

		return "redirect:/selectConf?conf_num=" + conf_mng.getConf_num();
	}

	@RequestMapping(value = "/deleteConf", method = RequestMethod.POST)
	public String deleteConf(int conf_num, Model model) {

		int result = repository.deleteConf(conf_num);

		return "redirect:/confList";
	}

	@RequestMapping(value = "/insertTextFile", method = RequestMethod.POST)
	public String insertTextFile(Conf_mng conf_mng, String stringText) {
		
		int result = repository.insertTextFile(conf_mng, stringText);

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

		String fullpath = uploadPath + conf_mng.getSavedfile();
//		System.out.println(fullpath+"==========다운로드 경로");

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
			List<Conf_mng> list = repository.calendarMyList(employee_num);

			SimpleDateFormat sdf2 = new SimpleDateFormat("EEE MMM dd yyyy HH:mm:ss", Locale.ENGLISH);
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

			return data;
		}
		return null;
	}
	
	
	@RequestMapping(value = "/memo", method = RequestMethod.GET)
	public String memo() {

		return "Conf/memo";
	}
}
