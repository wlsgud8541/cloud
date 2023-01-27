package com.project.cloud.mm.service;

import java.util.HashMap;
import java.util.Map;

import com.project.cloud.mm.domain.Mmember;

public interface MmemberService {
	// 로그인 체크
	public int mmSelectLoginCheck(String mmId, String mmPass);
	// 유저 정보 조회
	public Mmember mmSelectUserInfo(String mmId);
	// 아이디 중복 체크
	public int idCheck(String mmId);
	// 회원가입 처리
	public int mmInsertJoin(Mmember member); 
	// 마이페이지 조회
	public Mmember mmSelectMyPage(String mmNo);
	// 마이페이지 내가 쓴 글 조회
	public HashMap<String, Object> mmSelectWriterInfo(String mmNo, int pageNum);
	// 마이페이지 내가 작성한 문의
	public HashMap<String, Object> mmSelectRequestList(String mmNo, int pageNum);
	// 마이페이지 비밀번호 변경 프로세스
	public int mmChangePassProc(String mmId, String mmPass);
	// 마이페이지 회원 탈퇴
	public int memberDisabled(String mmNo);
	// 문자 인증
	public Map<String,Object> sendMessege(String tel);
	// 이메일 인증()
	public Map<String,Object> sendEmail(String email);
	// 이메일 비밀번호 전송
	public Map<String,Object> sendEmail(String email, String type, String mmId);
	// kakao login API
	public HashMap<String, String> mmKakaoLogin(String code, String error, String REST_API_KAKAO_KEY, String REST_API_KAKAO_SECRET_KEY, String REDIRECT_KAKAO_LOGIN_URI);
	// 카카오 로그인 처리
	public Mmember kakaoUserLogin(String kakaoUserId);
	// naver login API
	public HashMap<String, String> mmNaverLogin(String code, String state, String REST_API_NAVER_KEY, String REST_API_NAVER_SECRET_KEY, String REDIRECT_NAVER_LOGIN_URI);
	// 네이버 로그인 처리
	public Mmember naverUserLogin(String naverUserId);
	// 아이디 찾기
	public HashMap<String, Object> idSearch(String mmEmail);
	// 비밀번호 찾기 아이디 체크
	public HashMap<String, Object> idSearch(String mmEmail, String mmId);
}

