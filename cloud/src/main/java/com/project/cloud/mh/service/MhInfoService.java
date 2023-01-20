package com.project.cloud.mh.service;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.json.simple.parser.ParseException;

import com.project.cloud.mh.domain.MhInfo;

public interface MhInfoService {
	// 실종자 정보 게시판 목록화면 조회
	public List<MhInfo> mhiSelectList(int startRow, int pageSize, String type,String keyword,int pageCnt) throws IOException, ParseException, java.text.ParseException ;
	// 실종자 정보 게시판 상세화면 조회
	public MhInfo mhiSelectDetail();
	// 실종자 정보 게시판 작성화면
	public int mhiInsert(MhInfo mhInfo);
	// 실종자 정보 게시판 수정화면 
	public int mhiUpdate();
	// 실종자 정보 DB 마지막 인덱스 조회
	public List<MhInfo> lastIndex();
	// 실종자 API 데이터 총 개수 조회
	public Map<String,Object> mhiAPIcount();
	// 실종자 API데이터 DB에 백업
	public int mhinfoBackup();
	// 실종자 정보 데이터 업데이트 최신 날짜
	public String mhiDay();
	// 실종자 정보 백업 데이터 조회
	public int mhiCount();
	// 실종자 정보 스케줄러
	public Map<String,Object> mhiScheduler(int pageCnt) throws IOException, ParseException;
}
