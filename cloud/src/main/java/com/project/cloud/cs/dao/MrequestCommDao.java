package com.project.cloud.cs.dao;

import com.project.cloud.cs.domain.MrequestComm;

public interface MrequestCommDao {
	// 건의 게시판 리스트 조회
	//public List<MrequestComm> mrcSelectList(int mreComNo);
	// 건의 게시판 답글 상세화면 조회
	public MrequestComm mrcSelectDetail(int mreNo);
	// 건의 게시판 답글 작성
	public int mrcInsert(MrequestComm mrequestComm);
	// 건의 게시판 답글 수정
	public int mrcUpdate(MrequestComm mrequestComm);
	// 답글 삭제
	public int mrcDelete(int mreComNo);
}

