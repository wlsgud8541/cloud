package com.project.cloud.mm.controller;

import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.cloud.cs.domain.Mrequest;
import com.project.cloud.mm.domain.Mmember;
import com.project.cloud.mm.service.MmemberService;

@Controller
public class MmController {
	
	private Logger logger = LoggerFactory.getLogger(MmController.class);
	
	@Autowired
	private MmemberService mmService;
	
	// 카카오 로그인 key, 카카오 로그인 redirect URI
	private static String REST_API_KAKAO_KEY = "e46c1c647457913d7dbf891555db0996";
	private static String REST_API_KAKAO_SECRET_KEY = "UVD9pWa6o9kNZ6BLMTBv6KuKXWiLvgnN";
	private static String REDIRECT_KAKAO_LOGIN_URI = "http://localhost:8080/cloud/loginView?loginType=kakao";
	
	// 네이버 로그인 key, 네이버 로그인 redirect URI
	private static String REST_API_NAVER_KEY = "9toN9PG3pvbhxKu3hXUL";
	private static String REST_API_NAVER_SECRET_KEY = "8DxLGOLOT9";
	private static String REDIRECT_NAVER_LOGIN_URI = "http://localhost:8080/cloud/loginView?loginType=naver";
	
	// 로그인 처리
	@RequestMapping("mmSelectLoginCheck")
	@ResponseBody
	public Map<String, Object> mmSelectLoginCheck(HttpSession session, String mmId, String mmPass) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		int result = mmService.mmSelectLoginCheck(mmId, mmPass);
		
		if (result == 1) {
			Mmember member = mmService.mmSelectUserInfo(mmId);
			session.setAttribute("userId", member.getMmId());
			session.setAttribute("mmNo", member.getMmNo());
			resultMap.put("member", member);
			resultMap.put("userId", session.getAttribute("userId"));
		}

		resultMap.put("result", result);
		
		return resultMap;
	}
	
	@RequestMapping("loginView*")
	public String mmLoginview(HttpSession session, Model model
							, @RequestParam(required = false) String code
							, @RequestParam(required = false) String error
							, @RequestParam(required = false) String state
							, String loginType) {
		
		logger.debug("loginType check : "+loginType);
		
		// 카카오
		model.addAttribute("REST_API_KAKAO_KEY",REST_API_KAKAO_KEY);
		model.addAttribute("REDIRECT_KAKAO_INSERT_URI",REDIRECT_KAKAO_LOGIN_URI);
		
		// 네이버
		SecureRandom random = new SecureRandom();
		String naverState = new BigInteger(130, random).toString();
		model.addAttribute("REST_API_NAVER_KEY", REST_API_NAVER_KEY);
		model.addAttribute("REDIRECT_NAVER_LOGIN_URI", REDIRECT_NAVER_LOGIN_URI);
		model.addAttribute("state", naverState);
		
		if (loginType != null && loginType.equals("kakao")) { // 카카오 로그인 처리
			// 카카오 로그인 (정상처리)
			if(code != null) {
				HashMap<String, String> resultMap = mmService.mmKakaoLogin(code, error, REST_API_KAKAO_KEY, REST_API_KAKAO_SECRET_KEY, REDIRECT_KAKAO_LOGIN_URI);
				// db에 저장된 카카오 유저 정보가 있는지 조회
				Mmember member = mmService.kakaoUserLogin(resultMap.get("kakaoId"));
				
				if (member != null) { // db에 저장된 정보가 있으면 카카오 로그인 처리 후 메인으로 전송
					logger.debug("카카오 로그인");
					model.addAttribute("member", member);
					session.setAttribute("userId", member.getMmId());
					session.setAttribute("mmNo", member.getMmNo());
					session.setAttribute("kakaoLogin", "kakaoLogin");
					return "redirect:main";
					
				}else if(member == null) { // db에 저장된 정보가 없으면 카카오 회원가입 처리
					logger.debug("카카오 회원가입");
					model.addAttribute("kakaoId", resultMap.get("kakaoId"));
					model.addAttribute("kakaoEmail", resultMap.get("kakaoEmail"));
					model.addAttribute("kakaoGender", resultMap.get("kakaoGender"));
					return "mMemberView/mmInsertView1"; 
				}
			}
			// 카카오 로그인 오류 발생
			if(error != null) {
				logger.debug("카카오 로그인 시도 중 에러 발생");
			}
		}else if (loginType != null && loginType.equals("naver")) { // 네이버 로그인 처리
			if (code != null) {
				HashMap<String, String> resultMap = mmService.mmNaverLogin(code, state, REST_API_NAVER_KEY, REST_API_NAVER_SECRET_KEY, REDIRECT_NAVER_LOGIN_URI);
				logger.debug("네이버 유저 아이디 확인 결과 : "+resultMap.get("naverId"));
				Mmember member = mmService.naverUserLogin(resultMap.get("naverId"));
				
				if (member != null) {
					logger.debug("네이버 로그인 처리");
					model.addAttribute("member", member);
					session.setAttribute("userId", member.getMmId());
					session.setAttribute("mmNo", member.getMmNo());
					session.setAttribute("naverLogin", "naverLogin");
					return "redirect:main";
					
				}else if (member == null) {
					logger.debug("네이버 회원가입");
					model.addAttribute("naverId", resultMap.get("id"));
					model.addAttribute("naverGender", resultMap.get("gender"));
					model.addAttribute("naverEmail", resultMap.get("email"));
					model.addAttribute("naverMobile", resultMap.get("mobile"));
					model.addAttribute("naverName", resultMap.get("name"));
					model.addAttribute("naverBirthyear", resultMap.get("birthyear"));
					model.addAttribute("naverBirthday", resultMap.get("birthday"));
					return "mMemberView/mmInsertView1";  
				}
			}
		}
		
		return "mMemberView/mmLoginView";
	}
	
	
	// 로그아웃 처리
	@RequestMapping("mmLogout*")
	public void mmLogout(HttpSession session, HttpServletRequest request ,HttpServletResponse response, PrintWriter writer) {
		String passChange = request.getParameter("passChange");
		
		response.setContentType("text/html; charset=utf-8");
		session.invalidate();
		
		if (passChange != null && passChange.equals("passSuc")) {
			writer.println("<script>");
			writer.println("	location.href='loginView';");
			writer.println("</script>");
		}else {
			writer.println("<script>");
			writer.println("	alert('정상적으로 로그아웃 되셨습니다.')");
			writer.println("	location.href='main';");
			writer.println("</script>");
		}
	}
	
	
	//아이디 중복확인 체크
	@RequestMapping("idCheck")
	@ResponseBody
	public int idCheck(String mmId) {
		int result = mmService.idCheck(mmId);
		return result;
	}
	
	// 이메일 인증
	@RequestMapping("sendEmail")
	@ResponseBody
	public Map<String,Object> sendEmail(String email,
										@RequestParam(name = "type", required = false, defaultValue = "") String type,
										@RequestParam(name = "mmId", required = false, defaultValue = "") String mmId) {
		
		if (type.equals("searchPass")) {
			return mmService.sendEmail(email, type, mmId);
		}
		
		return mmService.sendEmail(email);
	}
	
	// 문자 인증
	@RequestMapping("sendMessege")	
	@ResponseBody
	public Map<String,Object> sendMessege(String tel) throws NoSuchAlgorithmException, InvalidKeyException {
		
		return mmService.sendMessege(tel);
	}
	
	// 일반 회원 뷰 이동
	@RequestMapping("/mmInsertJoin2")
	public String mmInsertJoin2(Model model, String mmUseUserInfoYn) {
		model.addAttribute("mmUseUserInfoYn",mmUseUserInfoYn);

		return "mMemberView/mmInsertView2";
	}
	
	@RequestMapping("/mmKakaoInsertJoin2")
	public String mmKakaoInsertJoin2(Model model, Mmember member) {
		model.addAttribute("member",member);
		return "mMemberView/mmKakaoInsertView2";
	}

	@RequestMapping("/mmNaverInsertJoin2")
	public String mmNaverInsertJoin2(Model model, Mmember member) {
		model.addAttribute("member",member);
		return "mMemberView/mmNaverInsertView2";
	}
	
	// 회원가입 처리
	@RequestMapping("mmInsertJoin")
	public String mmInsertJoin(Mmember member) {
		int result = mmService.mmInsertJoin(member);
		
		if(result == 0) {
			logger.debug("회원 Insert 중 오류 발생");
		}
		
		if(result == 1) {
			logger.debug("회원 Insert 성공");
		}
		return "mMemberView/mmInsertView3";
	}
	
	// 마이페이지
	@RequestMapping("/mmSelectMyPage")
	public String mmSelectMyPage(Model model, String mmNo,
								 @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum) {
		
		Mmember memberInfo = mmService.mmSelectMyPage(mmNo);
		
		HashMap<String, Object> mmSelectWriterMap = mmService.mmSelectWriterInfo(mmNo, pageNum);
		List<Mmember> memberWriterInfoList = (List<Mmember>)mmSelectWriterMap.get("memberWriterInfo");
		
		
		HashMap<String, Object> memberRequestMap = mmService.mmSelectRequestList(mmNo, pageNum);
		List<Mrequest> memberRequestList = (List<Mrequest>)memberRequestMap.get("memberRequestList");
		
		// 유저정보
		model.addAttribute("mInfo", memberInfo);
		
		// 유저가 작성한 글
		model.addAttribute("memberWriterInfo", memberWriterInfoList);
		
		model.addAttribute("mwStartRow", mmSelectWriterMap.get("startRow"));
		model.addAttribute("mwPageGroup", mmSelectWriterMap.get("pageGroup"));
		model.addAttribute("mwPageCount", mmSelectWriterMap.get("pageCount"));
		model.addAttribute("mwStartPage", mmSelectWriterMap.get("startPage"));
		model.addAttribute("mwEndPage", mmSelectWriterMap.get("endPage"));
		model.addAttribute("mwCurrentPage", mmSelectWriterMap.get("currentPage"));
		
		// 유저가 작성한 문의
		model.addAttribute("memberRequestList", memberRequestList);

		model.addAttribute("startRow", memberRequestMap.get("startRow"));
		model.addAttribute("pageGroup", memberRequestMap.get("pageGroup"));
		model.addAttribute("pageCount", memberRequestMap.get("pageCount"));
		model.addAttribute("startPage", memberRequestMap.get("startPage"));
		model.addAttribute("endPage", memberRequestMap.get("endPage"));
		model.addAttribute("currentPage", memberRequestMap.get("currentPage"));
		
		return "mMemberView/mmMyPageView";
	}
	
	@RequestMapping("/myPagePaging")
	@ResponseBody
	public HashMap<String, Object> myPagePaging(Model model, String mmNo,
								 @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum) {
		
		HashMap<String, Object> memberRequestMap = mmService.mmSelectRequestList(mmNo, pageNum);
		List<Mrequest> memberRequestList = (List<Mrequest>)memberRequestMap.get("memberRequestList");
		
		HashMap<String, Object> ajaxReturnMap = new HashMap<String, Object>();
		ajaxReturnMap.put("memberRequestList", memberRequestList);
		ajaxReturnMap.put("startRow", memberRequestMap.get("startRow"));
		ajaxReturnMap.put("pageGroup", memberRequestMap.get("pageGroup"));
		ajaxReturnMap.put("pageCount", memberRequestMap.get("pageCount"));
		ajaxReturnMap.put("startPage", memberRequestMap.get("startPage"));
		ajaxReturnMap.put("endPage", memberRequestMap.get("endPage"));
		ajaxReturnMap.put("currentPage", memberRequestMap.get("currentPage"));
		
		return ajaxReturnMap;
	}

	@RequestMapping("/myPageWriterPaging")
	@ResponseBody
	public HashMap<String, Object> myPageWriterPaging(Model model, String mmNo,
			@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum) {
		
		HashMap<String, Object> mmSelectWriterMap = mmService.mmSelectWriterInfo(mmNo, pageNum);
		List<Mmember> memberWriterInfoList = (List<Mmember>)mmSelectWriterMap.get("memberWriterInfo");
		
		HashMap<String, Object> ajaxReturnMap = new HashMap<String, Object>();
		ajaxReturnMap.put("memberWriterInfoList", memberWriterInfoList);
		ajaxReturnMap.put("mwStartRow", mmSelectWriterMap.get("startRow"));
		ajaxReturnMap.put("mwPageGroup", mmSelectWriterMap.get("pageGroup"));
		ajaxReturnMap.put("mwPageCount", mmSelectWriterMap.get("pageCount"));
		ajaxReturnMap.put("mwStartPage", mmSelectWriterMap.get("startPage"));
		ajaxReturnMap.put("mwEndPage", mmSelectWriterMap.get("endPage"));
		ajaxReturnMap.put("mwCurrentPage", mmSelectWriterMap.get("currentPage"));
		
		return ajaxReturnMap;
	}
	
	
	@RequestMapping("/changePassProc")
	@ResponseBody
	public int changePassProc(String mmId, String mmPass) {
		int result = 0;
		result = mmService.mmChangePassProc(mmId,mmPass);
		logger.debug("비밀번호 변경 result : "+result);
		
		return result;
	}
	
	
	@RequestMapping("/memberDisabled")
	@ResponseBody
	public int memberDisabled(HttpSession session, String mmNo) {
		int result = 0;
		result = mmService.memberDisabled(mmNo);
		session.invalidate();
		
		return result;
	}
	
	@RequestMapping("/searchUserInfo")
	public String searchUserInfo(Model model, String type) {
		model.addAttribute("type",type);
		return "mMemberView/mmSearchUserInfo";
	}
	
	@RequestMapping("/idSearch")
	@ResponseBody
	public HashMap<String, Object> idSearch(String mmEmail, 
											@RequestParam(name = "mmId", required = false, defaultValue = "") String mmId){
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		if (mmId != null && mmId != "") { // 비밀번호 찾기 시 실행
			resultMap = mmService.idSearch(mmEmail, mmId);
		}else { // 아이디 찾기 시 실행
			resultMap = mmService.idSearch(mmEmail);
		}
		
		return resultMap;
	} 
	
	
	
}
