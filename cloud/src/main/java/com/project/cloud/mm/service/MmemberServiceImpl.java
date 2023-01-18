package com.project.cloud.mm.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.tomcat.util.codec.binary.Base64;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.cloud.cs.dao.MrequestDao;
import com.project.cloud.cs.domain.Mrequest;
import com.project.cloud.gm.service.GlobalMethodService;
import com.project.cloud.mm.dao.MmemberDao;
import com.project.cloud.mm.domain.Mmember;

@Service
public class MmemberServiceImpl implements MmemberService{

	private Logger logger = LoggerFactory.getLogger(MmemberServiceImpl.class);
	
	@Autowired
	private MmemberDao mmDao;

	@Autowired
	private MrequestDao mqDao;
	
	// 공통 메소드 서비스
	@Autowired
	private GlobalMethodService gms;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	private BCryptPasswordEncoder passEncoder;
	
	@Override
	public int mmSelectLoginCheck(String mmId, String mmPass) {
		// 아이디가 존재하지 않을시 : 0
		// 패스워드가 일치하지 않을시 : -1
		// 로그인 성공시 : 1

		String dbPass = mmDao.mmSelectLoginCheck(mmId);

		int result = 0;
		if (dbPass != null) {
			//if (!dbPass.equals(mmPass)) {
			if (!passEncoder.matches(mmPass, dbPass)) {
				result = -1;
			}else {
				result = 1;
			}
		}
		return result;
	}

	@Override
	public int idCheck(String mmId) {
		return mmDao.idCheck(mmId);
	}

	@Override
	public Mmember mmSelectUserInfo(String mmId) {
		return mmDao.mmSelectUserInfo(mmId);
	}
	
	@Override
	public int mmInsertJoin(Mmember member) {
		String id = member.getEmailId();
		String tel1 = member.getTel1();
		String tel2 = member.getTel2();
		String tel3 = member.getTel3();
		
		String pass = member.getMmPass();
		String encPass = passEncoder.encode(pass);

		member.setMmPass(encPass);
		
		int result = 0;
		
		// 이메일 세팅
		if (member.getEmailDomain() == null || member.getEmailDomain().equals("")) {
			String domain = member.getSelectDomain();
			member.setMmEmail(id + "@" + domain);
		}else {
			String domain = member.getEmailDomain();
			member.setMmEmail(id + "@" + domain);
		}
		
		// 전화번호 세팅
		member.setMmTel(tel1 + "-" + tel2 + "-" + tel3);
		if ((member.getKakaoId() == null || member.getKakaoId() == "") && (member.getNaverId() == null || member.getNaverId() == "")) {
			logger.debug("일반 회원 insert");
			result = mmDao.mmInsertJoin(member);
		}else if(member.getKakaoId() != null && member.getKakaoId() != "") {
			member.setMmId("kakao_");
			member.setMmPass("kakao_");
			member.setMmIdConnKAKAO("Y");
			logger.debug("카카오 회원 insert");
			result = mmDao.mmInsertJoin(member);
			result = mmDao.mmInsertKakaoJoin(member);
		}else if (member.getNaverId() != null && member.getNaverId() != "") {
			member.setMmId("naver_");
			member.setMmPass("naver_");
			member.setMmIdConnNaver("Y");
			result = mmDao.mmInsertJoin(member);
			result = mmDao.mmInsertNaverJoin(member);
			logger.debug("네이버 회원 insert");
		}
		
		return result;
	}

	@Override
	public Mmember mmSelectMyPage(String mmNo) {
		return mmDao.mmSelectMyPage(mmNo);
	}
	
	
	@Override
	public HashMap<String, Object> mmSelectRequestList(String mmNo, int pageNum) {
		HashMap<String, Object> memberRequestMap = new HashMap<String, Object>();
		
		int pageSize = 5;   // 페이지 사이즈 갯수
		int pageGroup = 5; // 페이징 그룹
		int startRow = 0;
		int pageCount = 0;
		int startPage = 0;
		int endPage = 0;
		int currentPage = 0;
		
		String type = "";
		String keyWord = "";
		
		int listCount = mqDao.getMrSelectCnt(type,keyWord,mmNo);
		
		Map<String , Object> mnModel = gms.pageList(listCount, pageSize, pageGroup, pageNum, type, keyWord); 
		
		startRow = (int)mnModel.get("startRow");
		pageCount = (int)mnModel.get("pageCount");
		startPage = (int)mnModel.get("startPage");
		endPage = (int)mnModel.get("endPage");
		currentPage = (int)mnModel.get("currentPage");
		
		List<Mrequest> memberRequestList = mqDao.mrSelectList(startRow, pageSize, type, keyWord, mmNo);
		memberRequestMap.put("memberRequestList", memberRequestList);

		memberRequestMap.put("startRow", startRow);
		memberRequestMap.put("pageGroup", pageGroup);
		memberRequestMap.put("pageCount", pageCount);
		memberRequestMap.put("startPage", startPage);
		memberRequestMap.put("endPage", endPage);
		memberRequestMap.put("currentPage", currentPage);
		
		return memberRequestMap;
	}

	
	@Override
	public HashMap<String, Object> mmSelectWriterInfo(String mmNo, int pageNum) {
		HashMap<String, Object> mmSelectWriterInfoMap = new HashMap<String, Object>();
		
		int pageSize = 5;   // 페이지 사이즈 갯수
		int pageGroup = 5; // 페이징 그룹
		int startRow = 0;
		int pageCount = 0;
		int startPage = 0;
		int endPage = 0;
		int currentPage = 0;
		
		String type = "";
		String keyWord = "";
		
		int listCount = mmDao.mmSelectWriterInfoCnt(mmNo);
		
		Map<String , Object> mnModel = gms.pageList(listCount, pageSize, pageGroup, pageNum, type, keyWord); 
		
		startRow = (int)mnModel.get("startRow");
		pageCount = (int)mnModel.get("pageCount");
		startPage = (int)mnModel.get("startPage");
		endPage = (int)mnModel.get("endPage");
		currentPage = (int)mnModel.get("currentPage");
		
		List<Mmember> memberWriterInfo = new ArrayList<Mmember>();
		for (Mmember mmember : mmDao.mmSelectWriterInfo(mmNo, startRow, pageSize)) {
			memberWriterInfo.add(mmember);
		}
		
		mmSelectWriterInfoMap.put("memberWriterInfo", memberWriterInfo);
		mmSelectWriterInfoMap.put("startRow", startRow);
		mmSelectWriterInfoMap.put("pageGroup", pageGroup);
		mmSelectWriterInfoMap.put("pageCount", pageCount);
		mmSelectWriterInfoMap.put("startPage", startPage);
		mmSelectWriterInfoMap.put("endPage", endPage);
		mmSelectWriterInfoMap.put("currentPage", currentPage);
		
		return mmSelectWriterInfoMap;
	}

	@Override
	public int sendMessege(String tel) {
		String strCN = certificationNumber();

		int result = 0;
		//String sendTel = "\""+tel+"\"";
	
		String hostNameUrl = "https://sens.apigw.ntruss.com";
		String requestUrl = "/sms/v2/services/";
		String requestUrlType = "/messages";
		String accessKey = "83quusbPMP5Wl1HGsWM0";								
		String secretKey = "2qrsHzl8mm7aJMfZ6EQapAWFVRkvrdN9z78dYABi";			
		String serviceId = "ncp:sms:kr:299422636917:cloudproject";
		String method = "POST";			
		String timestamp = Long.toString(System.currentTimeMillis()); 			
		requestUrl += serviceId + requestUrlType;
		String apiUrl = hostNameUrl + requestUrl;
		
		JSONObject bodyJson = new JSONObject();
		JSONObject toJson = new JSONObject();
		JSONArray toArr = new JSONArray();
		
		toJson.put("to", "01027608541");
		toArr.put(toJson);
		
		bodyJson.put("type", "SMS");
		bodyJson.put("contentType", "COMM"); // AD : 광고 | COMM : 일반용
		bodyJson.put("from", "01027608541");
		bodyJson.put("content", "[Cloud Sercice] 인증번호 ["+strCN+"]를 입력해주세요.");
		bodyJson.put("messages", toArr);
		
		String body = bodyJson.toString();
		
		
		try {
			URL url = new URL(apiUrl);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setUseCaches(false);
			con.setDoOutput(true);
			con.setDoInput(true);
			con.setRequestProperty("content-type", "application/json");
            con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
            con.setRequestProperty("x-ncp-iam-access-key", accessKey);
            con.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature(requestUrl, timestamp, method, accessKey, secretKey));
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			
			wr.write(body.getBytes());
			wr.flush();
			wr.close();
			
			int responseCode = con.getResponseCode();
			BufferedReader br;
          
			if(responseCode == 202) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
                result = 1;
            } else { // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
                result = 0;
            }
            
			String inputLine;
			StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            
            logger.debug(response.toString());
            
            con.disconnect();
            
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return result;
	}

	// 메세지 전송 URL
	private String makeSignature(String url, String timestamp, String method, String accessKey, String secretKey) throws NoSuchAlgorithmException, InvalidKeyException {
		String space = " ";				// one space
		String newLine = "\n";				// new line
		
		String message = new StringBuilder()
						  .append(method)
						  .append(space)
						  .append(url)
						  .append(newLine)
						  .append(timestamp)
						  .append(newLine)
						  .append(accessKey)
						  .toString();
		
		SecretKeySpec signingKey;
		String encodeBase64String ;
		
		try {
			signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
			Mac mac = Mac.getInstance("HmacSHA256");
			mac.init(signingKey);
			byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
			encodeBase64String = Base64.encodeBase64String(rawHmac);

		} catch (UnsupportedEncodingException e) {
			encodeBase64String = e.toString();
		}
		
		return encodeBase64String;
	}

	// 이메일 전송
	@Override
	public Map<String,Object> sendEmail(String email) {
		
		Map<String,Object> resultMap = new HashMap<String, Object>();
		String strCN = certificationNumber();
		
		String fromEmail = "wlsgud8541@naver.com";
		String toEmail = email;
		String title = "cloud service 회원가입 인증 이메일입니다.";
		String content =  "cloud service 홈페이지 방문을 환영합니다."
						+ "<br><br>"
						+ "인증을 완료하시려면 해당 인증번호를 입력해주세요"
						+ "<br><br>"
						+ "인증번호 : "+strCN;
		
		int result = mailSend(fromEmail, toEmail, title, content);
		resultMap.put("result", result);
		resultMap.put("strCN", strCN);
		
		return resultMap;
	}
	
	// 이메일 전송 메소드
	public int mailSend(String fromEmail, String toEmail, String title, String content) {
		int result = 0;
		MimeMessage message = mailSender.createMimeMessage();
		try {
			// true 매개변수 설정 시 multipart 형식 메세지 전달 및 문자 인코딩 설정 가능
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"UTF-8");
			helper.setFrom(fromEmail);
			helper.setTo(toEmail);
			helper.setSubject(title);
			
			// ture 설정 시 html 형식 전송, 작성하지 않을시 단순 텍스트 전달
			helper.setText(content,true);
			mailSender.send(message);
			result = 1;
		} catch (MessagingException e) {
			e.printStackTrace();
			result = 0;
		}
		
		return result;
	}
	
	// 인증번호 5자리 난수 발생
	public String certificationNumber() {
		int certificationNumber = (int)(Math.random()*100000);
		
		String strCN = "";
		
		if (certificationNumber < 10) {
			strCN = "0000"+certificationNumber;
		}
		if (certificationNumber < 100) {
			strCN = "000"+certificationNumber;
		}
		if (certificationNumber < 1000) {
			strCN = "00"+certificationNumber;
		}
		if (certificationNumber < 10000) {
			strCN = "0"+certificationNumber;
		}
		if (certificationNumber >= 10000 ) {
			strCN = ""+certificationNumber;
		}
		
		return strCN;
	}
	
	// Kakao login API
	public HashMap<String, String> mmKakaoLogin(String code, String error
												, String REST_API_KAKAO_KEY
												, String REST_API_KAKAO_SECRET_KEY
												, String REDIRECT_KAKAO_LOGIN_URI) {
		
		HashMap<String, String> resultMap = new HashMap<String, String>();
		String targetUrl = "https://kauth.kakao.com/oauth/token";
		
		try {
			
			URL url = new URL(targetUrl+"?grant_type=authorization_code&client_id="+REST_API_KAKAO_KEY
							+"&redirect_uri="+REDIRECT_KAKAO_LOGIN_URI
							+"&code="+code
							+"&client_secret="+REST_API_KAKAO_SECRET_KEY);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-type", "application/x-www-form-urlencoded");
			con.setDoOutput(true);
			
			DataOutputStream dr = new DataOutputStream(con.getOutputStream());
			dr.flush();
			dr.close();
			
			int responseCode = con.getResponseCode();

			BufferedReader br;
			if (responseCode == 200) { // 정상호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			}else{ // error
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}

			//response 결과 출력
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}

			br.close();
			
			HashMap<String, Object> map = new ObjectMapper().readValue(response.toString(), HashMap.class);
			
			//kakao user info 가져오기
			resultMap = kakaoUserInfo(map);
			
			con.disconnect();
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return resultMap;
	}
	
	//kakao user info 가져오기
	public HashMap<String, String> kakaoUserInfo(HashMap<String, Object> map) {
		HashMap<String, String> resultMap = new HashMap<String, String>();
		String requestUrl = "https://kapi.kakao.com/v2/user/me";
		String accessToken = (String)map.get("access_token");

		try {
			URL url = new URL(requestUrl);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Authorization", "Bearer "+accessToken);
			con.setDoOutput(true);
			
			DataOutputStream ds =  new DataOutputStream(con.getOutputStream());
			ds.flush();
			ds.close();
			
			int responseCode = con.getResponseCode();

			BufferedReader br;
			if(responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			}else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			
			//response 결과 출력
			String inputLine;
			StringBuffer response = new StringBuffer();
			while((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			logger.debug("response : "+response.toString());
			
			br.close();
		
			HashMap<String, Object> kakaoInfoMap = new ObjectMapper().readValue(response.toString(), HashMap.class);
			Map<String, String> kakaoUserInfoMap = (Map<String, String>)kakaoInfoMap.get("kakao_account");
			
			resultMap.put("kakaoId", (String)kakaoInfoMap.get("id").toString());
			resultMap.put("kakaoEmail", (String)kakaoUserInfoMap.get("email").toString());
			resultMap.put("kakaoGender", (String)kakaoUserInfoMap.get("gender").toString());
			
			con.disconnect();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultMap;
	}
	
	// 카카오 로그인 처리
	public Mmember kakaoUserLogin(String kakaoUserId) {
		Mmember member = mmDao.kakaoUserLogin(kakaoUserId);
		return member;
	}
	
	// naver login API
	public HashMap<String, String> mmNaverLogin(String code, String state
												, String REST_API_NAVER_KEY
												, String REST_API_NAVER_SECRET_KEY
												, String REDIRECT_NAVER_LOGIN_URI) {
		
		HashMap<String, String> naverInfoMap = new HashMap<String, String>();

		try {
			String clientId = REST_API_NAVER_KEY;//애플리케이션 클라이언트 아이디값";
			String clientSecret = REST_API_NAVER_SECRET_KEY;//애플리케이션 클라이언트 시크릿값";
			String redirectURI = URLEncoder.encode(REDIRECT_NAVER_LOGIN_URI, "UTF-8");
			String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
				   apiURL += "client_id=" + clientId;
				   apiURL += "&client_secret=" + clientSecret;
				   apiURL += "&redirect_uri=" + redirectURI;
				   apiURL += "&code=" + code;
				   apiURL += "&state=" + state;
		
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();
			BufferedReader br;
			
			if(responseCode==200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {  // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			
			String inputLine;
			StringBuffer response = new StringBuffer();
			
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			
			logger.debug("response : "+response.toString());
			
			HashMap<String, String> naverResultMap =  new HashMap<String, String>();
			naverResultMap = new ObjectMapper().readValue(response.toString(), HashMap.class);
			
			//네이버 사용자 정보 가져오기 처리
			naverInfoMap = naverUserInfo(naverResultMap);
			
			con.disconnect();
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return naverInfoMap;
	}
	
	
	//kakao user info 가져오기
	public HashMap<String, String> naverUserInfo(HashMap<String, String> naverResultMap) {
		String naverToken = naverResultMap.get("access_token");
		String header = "Bearer " + naverToken;
		String targetUrl = "https://openapi.naver.com/v1/nid/me";

		HashMap<String, String> resultMap = new HashMap<String, String>();
		
		try {
			URL url = new URL(targetUrl);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			
			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", header);
			
			int responseCode = con.getResponseCode();
			
			BufferedReader br;
			
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			
			String inputLine;
			StringBuffer response = new StringBuffer();
			
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			
			HashMap<String, Object> naverInfoMap = new ObjectMapper().readValue(response.toString(), HashMap.class);
			Map<String, String> naverUserInfoMap = (Map<String, String>)naverInfoMap.get("response");
			logger.debug(naverUserInfoMap.toString());
			
			resultMap.put("naverId", naverUserInfoMap.get("id"));
			resultMap.put("naverGender", naverUserInfoMap.get("gender"));
			resultMap.put("naverEmail", naverUserInfoMap.get("email"));
			resultMap.put("naverMobile", naverUserInfoMap.get("mobile"));
			resultMap.put("naverName", naverUserInfoMap.get("name"));
			resultMap.put("naverBirthyear", naverUserInfoMap.get("birthyear"));
			resultMap.put("naverBirthday", naverUserInfoMap.get("birthday"));
			
			con.disconnect();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultMap;
	}
	
	// 네이버 로그인 처리
	public Mmember naverUserLogin(String naverUserId) {
		Mmember member = mmDao.naverUserLogin(naverUserId);
		return member;
	}

	// 비밀번호 변경처리
	public int mmChangePassProc(String mmId, String mmPass) {
		Mmember member = new Mmember();
		
		String pass = passEncoder.encode(mmPass);
		member.setMmPass(pass);
		member.setMmId(mmId);
		
		return mmDao.mmChangePassProc(member);
	}
	
	// 마이페이지 회원 탈퇴
	public int memberDisabled(String mmNo) {
		return mmDao.memberDisabled(mmNo);
	}
	
}
	
	
	
	
	
	
