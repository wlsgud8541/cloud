package com.project.cloud.cs.dao;

import java.util.List;

import com.project.cloud.cs.domain.Mnotice;

public interface MnoticeDao {
	// 공지사항 게시판 목록화면 조회
	public List<Mnotice> mnSelectList(int startRow, int pageSize, String type, String keyWord);
	
	// 공지사항 게시판 게시글 갯수 조회
	public int mnSelectListCount(String type, String keyWord);
	
	// 공지사항 게시판 상세화면 조회
	public Mnotice mnSelectDetail(int mnNo);
	
	// 공지사항 게시판 작성
	public int mnInsert(Mnotice mnotice);
	
	// 공지사항 게시판 수정
	public int mnUpdate(Mnotice mnotice);
	
	// 공지사항 게시판 삭제
	public int mnDelete(int mnNo);
	
	// 공지사항 게시판 readCount update 기능
	public int mnUpdateReadCount(int mnNo);
}
