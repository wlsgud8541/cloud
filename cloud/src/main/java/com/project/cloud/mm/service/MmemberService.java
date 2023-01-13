package com.project.cloud.mm.service;

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
	// 문자 인증
	public int sendMessege(String tel);
	// 이메일 인증
	public Map<String,Object> sendEmail(String email);
	// Kakao login API
	public void mmKakaoLogin(String code, String error, String REST_API_KEY, String REDIRECT_URI);
}

