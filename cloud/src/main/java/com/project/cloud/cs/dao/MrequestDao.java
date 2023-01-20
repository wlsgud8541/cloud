package com.project.cloud.cs.dao;

import java.util.List;

import com.project.cloud.cs.domain.Mrequest;

public interface MrequestDao {
	// 건의게시판 목록화면 조회
	public List<Mrequest> mrSelectList(int startRow, int pageSize, String type, String keyword);
	// 건의게시판 게시 글 수 반환
	public int getMrSelectCnt(String type, String keyword);
	// 건의게시판 목록화면 조회
	public List<Mrequest> mrSelectList(int startRow, int pageSize, String type, String keyword, String mmNo);
	// 건의게시판 게시 글 수 반환
	public int getMrSelectCnt(String type, String keyword, String mmNo);
	// 건의 게시판 상세화면 조회
	public Mrequest mrSelectDetail(int mreNo);
	// 건의 게시판 작성
	public int mrInsert(Mrequest mrequest);
	// 건의 게시판 수정
	public int mrUpdate(Mrequest mrequest);
	// 건의 게시판 삭제 
	public int mrDelete(int mreNo);
	// 답글 코드 변경 메서드
	public int mrUpdateReplyCode(int mreNo);
	// 답글 코드 삭제 메서드
	public int mrDelReplyCode(int mreNo);
	// 건의 게시판 추천 업데이트
	public void mrUpdateRecommend(int mreNo, int mreRecoCnt);
	// 건의 게시판 추천 가져오기
	public Mrequest getMrRecommend(int mreNo); 
	// 건의 게시판 조회수 메서드
	public int mrUpdateReadCnt(int mreNo);
} 
