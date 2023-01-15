package com.project.cloud.mm.controller;

import java.io.PrintWriter;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.cloud.mm.domain.Mmember;
import com.project.cloud.mm.service.MmemberService;

@Controller
public class MmController {
	
	@Autowired
	private MmemberService mmService;
	
	
	private static String REST_API_KEY = "e46c1c647457913d7dbf891555db0996";
	private static String REDIRECT_KAKAO_LOGIN_URI = "http://localhost:8080/cloud/loginView";
	
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
	public String mmLoginview(HttpSession session,Model model, String code, String error) {
		
		model.addAttribute("REST_API_KEY",REST_API_KEY);
		model.addAttribute("REDIRECT_KAKAO_INSERT_URI",REDIRECT_KAKAO_LOGIN_URI);

		// 정상처리
		if(code != null) {
			HashMap<String, String> resultMap = mmService.mmKakaoLogin(code, error, REST_API_KEY, REDIRECT_KAKAO_LOGIN_URI);
			// db에 저장된 카카오 유저 정보가 있는지 조회
			Mmember member = mmService.kakaoUserLogin(resultMap.get("kakaoId"));
			System.out.println("member check : "+member);
			
			if (member != null) { // db에 저장된 정보가 있으면 카카오 로그인 처리 후 메인으로 전송
				System.out.println("카카오 로그아웃");
				model.addAttribute("member", member);
				session.setAttribute("userId", member.getMmId());
				session.setAttribute("mmNo", member.getMmNo());
				session.setAttribute("kakaoLogin", "kakaoLogin");
				return "main/mainView";
			
			}else if(member == null) { // db에 저장된 정보가 없으면 카카오 회원가입 처리
				System.out.println("카카오 회원가입");
				model.addAttribute("kakaoId", resultMap.get("kakaoId"));
				model.addAttribute("kakaoEmail", resultMap.get("kakaoEmail"));
				model.addAttribute("kakaoGender", resultMap.get("kakaoGender"));
				return "mMemberView/mmInsertView1"; 
			}
		}
		// 카카오 회원가입 오류 발생
		if(error != null) {
			System.err.println("카카오 로그인 시도 중 에러 발생");
		}
		
		System.out.println("일반 로그아웃");
		return "mMemberView/mmLoginView";
	}
		
	
	
	// 로그아웃 처리
	@RequestMapping("mmLogout*")
	public void mmLogout(HttpSession session, HttpServletResponse response, PrintWriter writer) {
		response.setContentType("text/html; charset=utf-8");
		session.invalidate();
		writer.println("<script>");
		writer.println("	alert('정상적으로 로그아웃 되셨습니다.')");
		writer.println("	location.href='main';");
		writer.println("</script>");
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
	public Map<String,Object> sendEmail(String email) {
		return mmService.sendEmail(email);
	}
	
	// 문자 인증
	@RequestMapping("sendMessege")	
	@ResponseBody
	public int sendMessege(String tel) throws NoSuchAlgorithmException, InvalidKeyException {
		
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
	
	// 회원가입 처리
	@RequestMapping("mmInsertJoin")
	public String mmInsertJoin(Mmember member) {
		int result = mmService.mmInsertJoin(member);
		
		if(result == 0) {
			System.err.println("회원 Insert 중 오류 발생");
		}
		
		if(result == 1) {
			System.err.println("회원 Insert 성공");
		}
		return "mMemberView/mmInsertView3";
	}
	
	// 마이페이지
	@RequestMapping("/mmSelectMyPage")
	public String mmSelectMyPage(Model model, String mmNo) {
		System.out.println("mmNo : "+mmNo);
		
		Mmember memberInfo = mmService.mmSelectMyPage(mmNo);
		model.addAttribute("mInfo", memberInfo);
		
		return "mMemberView/mmMyPageView";
	}
	
	
	
	
}
