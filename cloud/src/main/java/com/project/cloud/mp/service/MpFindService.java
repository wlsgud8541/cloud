package com.project.cloud.mp.service;

import java.util.List;

import com.project.cloud.mp.domain.MpFind;

public interface MpFindService {
	// 실종 반려동물 목격 게시판 목록화면 조회
	public List<MpFind> mpfSelectList(int startRow, int pageSize, String type, String keyWord);
	
	// 실종 반려동물 리스트 게시글 갯수 조회
	public int mpfSelectListCount(String type, String keyword);
	
	// 실종 반려동물 목격 게시판 상세화면 조회
	public MpFind mpfSelectDetail(int mpfNo);
	
	// 실종 반려동물 목격 게시판 작성화면
	public int mpfInsert(MpFind mpFind);
	
	// 실종 반려동물 목격 게시판 수정화면
	public int mpfUpdate(MpFind mpFind);
	
	// 실종 반려동물 목록 게시판 삭제
	public int mpfDelete(int mpfNo);
	
	// 실종 반려동물 목록 게시판 readCount update 기능
	public int mpfUpdateReadCount(int mpfNo);
	
}
