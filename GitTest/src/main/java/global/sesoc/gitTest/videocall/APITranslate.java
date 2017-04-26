package global.sesoc.gitTest.videocall;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.gitTest.vo.MiyouTranslate;

@Controller
public class APITranslate {

	// parameter : user_language, original_text
	@RequestMapping(value = "translate", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String translate(MiyouTranslate translate) throws Exception {

		JSONObject jsonObj = new JSONObject();

//		String clientId = "53qFovEVhAv3YKHIXzSb";// 애플리케이션 클라이언트 아이디값 - kang";
//		String clientId = "DrRA07vw4POxK36bbFT9"; //애플리케이션 클라이언트 아이디값 - park";
		String clientId = "cfDOAMsYHh6bi4z3LXzK"; //애플리케이션 클라이언트 아이디값  - yu";
		
//		String clientSecret = "8O1EqXN2yH";// 애플리케이션 클라이언트 시크릿값  - kang";
//		String clientSecret = "gMAc9r8rAt";// 애플리케이션 클라이언트 시크릿값  - park";
		String clientSecret = "EQUhA7xySH";// 애플리케이션 클라이언트 시크릿값  - yu";
		StringBuffer response = null;

		
		
		
		
		try {
			String text = URLEncoder.encode(translate.getInputText(), "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/language/translate";
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			// post request

			String postParams = null;
			if (translate.getUserLanguage().equals("ko")) {
				// Japanese -> Korean 
				postParams = "source=ja&target=ko&text=" + text;
			} else if (translate.getUserLanguage().equals("ja")) {
				// Korean  -> Japanese -> 
				postParams = "source=ko&target=ja&text=" + text;
			}
			con.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.writeBytes(postParams);
			wr.flush();
			wr.close();
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		String result = "";
		JSONParser jsonparser = new JSONParser();
		JSONObject jsonobject = (JSONObject) jsonparser.parse(""+response);
		JSONObject jsonobject1 = (JSONObject) jsonobject.get("message");
		JSONObject jsonobject2 = (JSONObject) jsonobject1.get("result");
		result = (String) jsonobject2.get("translatedText");
		return result;
	}
}
