package com.project.cloud.mp.dao;

import java.util.List;

import com.project.cloud.mp.domain.MpProtect;

public interface MpProtectDao {
	// 실종 반려동물 임시보호 게시판 목록화면 조회
	public List<MpProtect> mppSelectList(int startRow, int pageSize, String type, String keyWord);
	
	// 실종 반려동물 임시보호 게시글 갯수 조회
	public int mppSelectListCount(String type, String keyword);
	
	// 실종 반려동물 임시보호 게시판 상세화면 조회
	public MpProtect mppSelectDetail(int mppNo);
	
	// 실종 반려동물 임시보호 게시판 작성화면
	public int mppInsert(MpProtect mpProtect);
	
	// 실종 반려동물 임시보호 게시판 수정화면
	public int mppUpdate(MpProtect mpProtect);
	
	// 실종 반려동물 임시보호 게시판 삭제
	public int mppDelete(int mppNo);
	
	// 실종 반려동물 임시보호 게시판 readCount update 기능
	public int mppUpdateReadCount(int mppNo);
	
}
