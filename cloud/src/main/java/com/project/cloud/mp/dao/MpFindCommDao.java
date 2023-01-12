package com.project.cloud.mp.dao;

import java.util.List;

import com.project.cloud.mp.domain.MpFindComm;

public interface MpFindCommDao {
	// 실종 반려동물 목격 게시판 댓글 조회
	public List<MpFindComm> mpfcSelectList(int mpfNo);
	// 실종 반려동물 목격 게시판 댓글 작성
	public int mpfcInsert(MpFindComm mpfindCom);
	// 실종 반려동물 목격 게시판 댓글 수정
	public int mpfcUpdate(MpFindComm mpfindCom);
	// 실종 반려동물 목격 게시판 댓글 삭제
	public int mpfcDelete(MpFindComm mpfindCom);
}
