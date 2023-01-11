package com.project.cloud.mh.dao;

import java.util.List;

import com.project.cloud.mh.domain.MhReport;

public interface MhReportDao {
	// 실종신고 게시판 목록화면 조회
	public List<MhReport> mhrSelectList(int startRow, int pagesize, String type,String keyword);
	// 실종신고 게시판 게시글 수 조회
	public int mhrSelectListCount(String type, String query);
	// 실종신고 게시판 상세화면 조회 
	public MhReport mhrSelectDetail(int mhrNo);
	// 실종신고 게시판 작성화면 
	public int mhrInsert(MhReport mhReport);
	// 실종신고 게시판 수정
	public int mhrUpdate(MhReport mhReport);
	// 실종신고 게시판 삭제
	public int mhrDelete(int mhrNo);
	// 실종신고 게시판 페이지 카운트 
	public int mhrListCount(String type, String keyword);
	// 실종신고 게시판 조회수 카운트
	public MhReport mhrReadCount(int mhrNo, boolean count);
}
