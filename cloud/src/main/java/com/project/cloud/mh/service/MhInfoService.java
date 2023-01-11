package com.project.cloud.mh.service;

import java.util.List;

import com.project.cloud.mh.domain.MhInfo;

public interface MhInfoService {
	// 실종자 정보 게시판 목록화면 조회
	public List<MhInfo> mhiSelectList();
	// 실종자 정보 게시판 상세화면 조회
	public MhInfo mhiSelectDetail();
	// 실종자 정보 게시판 작성화면
	public int mhiInsert();
	// 실종자 정보 게시판 수정화면 
	public int mhiUpdate();
}
