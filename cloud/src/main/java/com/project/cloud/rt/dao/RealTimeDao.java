package com.project.cloud.rt.dao;

import java.util.HashMap;
import java.util.List;

import com.project.cloud.rt.domain.RealTime;

public interface RealTimeDao {
	// 실시간 정보 추가
	public int realTimeMfInfoDataInsert(HashMap<String, String> paramMap);
	// 실시간 정보 추가
	public int realTimeMpInfoDataInsert(HashMap<String, String> paramMap);
	// 실시간 정보 조회
	public List<RealTime> realTimeMhInfo(String mmNo);
	// 실시간 정보 조회
	public List<RealTime> realTimeMpInfo(String mmNo);
}
