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
	
	// 로그아웃 처리
	@RequestMapping("mmLogout")
	public void mmLogout(HttpSession session, HttpServletResponse response, PrintWriter writer) {
		
		response.setContentType("text/html; charset=utf-8");
		writer.println("<script>");
		writer.println("	alert('정상적으로 로그아웃 되셨습니다.')");
		writer.println("	location.href='main';");
		writer.println("</script>");
		
		session.invalidate();
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
