package com.project.cloud.mm.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.tomcat.util.codec.binary.Base64;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.cloud.mm.dao.MmemberDao;
import com.project.cloud.mm.domain.Mmember;import com.sun.org.apache.bcel.internal.classfile.PMGClass;

@Service
public class MmemberServiceImpl implements MmemberService{

	@Autowired
	private MmemberDao mmDao;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	
	@Override
	public int mmSelectLoginCheck(String mmId, String mmPass) {
		// 아이디가 존재하지 않을시 : 0
		// 패스워드가 일치하지 않을시 : -1
		// 로그인 성공시 : 1

		String idCheck = mmDao.mmSelectLoginCheck(mmId);

		int result = 0;
		if (idCheck != null) {
			if (!idCheck.equals(mmPass)) {
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
		
		int result = mmDao.mmInsertJoin(member);
		
		return result;
	}

	@Override
	public Mmember mmSelectMyPage(String mmNo) {
		return mmDao.mmSelectMyPage(mmNo);
	}


	@Override
	public int sendMessege(String tel) {
		String strCN = certificationNumber();

		int result = 0;
		//String sendTel = "\""+tel+"\"";
		System.out.println("인증 번호 : " + strCN);
		System.out.println("전송 번호 : " + tel);
		
	
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
		
		System.out.println(body);
		
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
			System.out.println("responseCode" +" " + responseCode);
          
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
            
            System.out.println(response.toString());
            
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
		
		System.out.println(message);
		
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
	public void mmKakaoLogin(String code, String error, String REST_API_KEY, String REDIRECT_URI) {
		String targetUrl = "https://kauth.kakao.com/oauth/token";
		String clientSecret = "UVD9pWa6o9kNZ6BLMTBv6KuKXWiLvgnN";
		
		System.out.println("service impl targetUrl : "+targetUrl);
		System.out.println("service impl code : "+code);
		System.out.println("service impl REST_API_KEY : "+REST_API_KEY);
		System.out.println("service impl REDIRECT_URI : "+REDIRECT_URI);
		try {
			
			URL url = new URL(targetUrl+"?grant_type=authorization_code&client_id="+REST_API_KEY+"&redirect_uri="+REDIRECT_URI+"&code="+code+"&client_secret="+clientSecret);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-type", "application/x-www-form-urlencoded");
			con.setDoOutput(true);
			
			DataOutputStream dr = new DataOutputStream(con.getOutputStream());
			dr.flush();
			dr.close();
			
			int responseCode = con.getResponseCode();
			System.out.println("응답 결과 : "+responseCode);

			BufferedReader br;
			if (responseCode == 200) { // 정상호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			}else{ // error
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			}

			//response 결과 출력
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			System.out.println("response : "+ response.toString());

			br.close();
			
			HashMap<String, Object> map = new ObjectMapper().readValue(response.toString(), HashMap.class);
			
			//kakao user info 가져오기
			kakaoUserInfo(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	//kakao user info 가져오기
	public void kakaoUserInfo(HashMap<String, Object> map) {
		String requestUrl = "https://kapi.kakao.com/v2/user/me";
		String accessToken = (String)map.get("access_token");
		System.out.println("accessToken : "+accessToken);

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
			System.out.println("kakao user info 응답결과 : "+ responseCode);
			
			BufferedReader br;
			if(responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			}else {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			}
			
			//response 결과 출력
			String inputLine;
			StringBuffer response = new StringBuffer();
			while((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			System.out.println("response : "+response.toString());
			
			br.close();
		
			HashMap<String, Object> kakaoInfoMap = new ObjectMapper().readValue(response.toString(), HashMap.class);
			System.out.println("kakaoInfoMap : "+kakaoInfoMap.get("kakao_account"));

			Map<String, String> kakaoUserInfoMap = (Map<String, String>)kakaoInfoMap.get("kakao_account");
			System.out.println("kakaoUserInfoMap-user-Email : "+kakaoUserInfoMap.get("email"));  									// 이메일
			System.out.println("kakaoUserInfoMap-user-Name : "+kakaoUserInfoMap.get("name").toString());							// 사용자 이름
			System.out.println("kakaoUserInfoMap-user-is_email_verified : "+kakaoUserInfoMap.get("is_email_verified").toString());  // 이메일 인증여부
			System.out.println("kakaoUserInfoMap-user-birthyear : "+kakaoUserInfoMap.get("birthyear").toString()); 					// 사용자 출생연도(YYYY 형식)
			System.out.println("kakaoUserInfoMap-user-birthday : "+kakaoUserInfoMap.get("birthday").toString()); 					// 사용자 생일(MMDD 형식)
			System.out.println("kakaoUserInfoMap-user-gender : "+kakaoUserInfoMap.get("gender").toString()); 						// 사용자 성별
			System.out.println("kakaoUserInfoMap-user-phone_number : "+kakaoUserInfoMap.get("phone_number").toString()); 			// 사용자 전화번호
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
