package com.project.cloud.mh.dao;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.project.cloud.mh.domain.MhInfo;

public interface MhInfoDao {
	// 실종자 정보 게시판 목록화면 조회
	public List<MhInfo> mhiSelectList(int startRow, int pagesize, String type,String keyword);
	// 실종자 정보 게시판 상세화면 조회
	public MhInfo mhiSelectDetail();
	// 실종자 정보 게시판 작성화면  
	public int mhiInsert(MhInfo mhInfo);
	// 실종자 정보 게시판 수정화면
	public int mhiUpdate();
	// 실종자 정보 DB 마지막 인덱스 조회
	public List<MhInfo> lastIndex();
	// 실종자 정보 DB에 백업
	public int mhinfoBackup();
	// 실종자 정보 데이터 최신 업데이트 날짜
	public String mhiDay();
	// 실종자 정보  데이터 조회
	public int mhiCount();
	// 실종자 정보 스케줄러
	public Map<String,Object> mhiScheduler(int pageCnt);
}
