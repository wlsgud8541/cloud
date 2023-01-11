package com.project.cloud.mh.service;

import java.util.List;

import com.project.cloud.mh.domain.MhFind;

public interface MhFindService {
	// 실종자 목격 게시판 목록화면 조회
	public List<MhFind> mhfSelectList(int startRow, int pageSize, String tpye,String keyword);
	// 실종자 목격 게시판 상세화면 조회
	public MhFind mhfSelectDetail(int mhfNo);
	// 실종자 목겨 게시판 조회수 상승
	public MhFind mhfSelectReadCount(int mhfNo, boolean count);
	// 실종자 목격 게시판 작성화면
	public int mhfInsert(MhFind mhfind);
	// 실종자 목격 게시판 수정화면
	public int mhfUpdate(MhFind mhfind); 
	// 실종자 목격 게시판 게시글의 총 수
	public int mhfSelectListCount(String type, String keyword);
	// 실종자 목격 게시판 삭제
	public int mhfDelete(int mhfNo);
}
