package com.project.cloud.mh.dao;

import java.util.List;

import com.project.cloud.mh.domain.MhFindComm;

public interface MhFindCommDao {
	// 실종자 목격 게시판 댓글 조회
	public List<MhFindComm> mhfcSelectList(int mhfNo);
	// 실종자 목격 게시판 댓글 작성
	public int mhfcInsert(MhFindComm mhfindCom);
	// 실종자 목격 게시판 댓글 수정
	public int mhfcUpdate(MhFindComm mhfindCom);
	// 실종자 목격 게시판 댓글 삭제
	public int mhfcDelete(MhFindComm mhfCom);
}
