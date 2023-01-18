package com.project.cloud.mm.dao;

import java.util.List;

import com.project.cloud.mm.domain.Mmember;

public interface MmemberDao {
	// 로그인 체크
	public String mmSelectLoginCheck(String mmId);
	// 유저 정보 조회
	public Mmember mmSelectUserInfo(String mmId);
	// 아이디 중복 체크
	public int idCheck(String mmId);
	// 회원가입 처리
	public int mmInsertJoin(Mmember member);
	// 카카오 회원가입 처리
	public int mmInsertKakaoJoin(Mmember member);
	// 네이버 회원가입 처리
	public int mmInsertNaverJoin(Mmember member);
	// 마이페이지 조회
	public Mmember mmSelectMyPage(String mmNo);
	// 마이페이지 내가 쓴 글 조회
	public List<Mmember> mmSelectWriterInfo(String mmNo, int startRow, int pageSize);
	// 마이페이지 내가 쓴 글 갯수 조회
	public int mmSelectWriterInfoCnt(String mmNo);
	// 마이페이지 비밀번호 변경 프로세스
	public int mmChangePassProc(Mmember member);
	// 마이페이지 회원 탈퇴
	public int memberDisabled(String mmNo);
	// 카카오 유저 로그인 처리
	public Mmember kakaoUserLogin(String kakaoUserId);
	// 네이버 유저 로그인 처리
	public Mmember naverUserLogin(String naverUserId);
}
