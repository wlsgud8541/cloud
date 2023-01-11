package com.project.cloud.mp.service;

import java.util.List;

import com.project.cloud.mp.domain.MpReport;

public interface MpReportService {
	// 실종 반려동물 신고 게시판 목록화면 조회
	public List<MpReport> mprSelectList(int startRow, int pageSize, String type, String keyWord);
	
	// 실종 반려동물 리스트 게시글 갯수 조회
	public int mprSelectListCount(String type, String keyword);
	
	// 실종 반려동물 신고 게시판 상세화면 조회
	public MpReport mprSelectDetail(int mprNo);
	
	// 실종 반려동물 신고 게시판 작성화면
	public int mprInsert(MpReport mpReport);
	
	// 실종 반려동물 신고 게시판 수정화면
	public int mprUpdate(MpReport mpReport);
	
	// 실종 반려동물 신고 게시판 삭제
	public int mprDelete(int mprNo);
	
	// 실종 반려동물 신고 게시판 readCount update 기능
	public int mprUpdateReadCount(int mprNo);
	
}
