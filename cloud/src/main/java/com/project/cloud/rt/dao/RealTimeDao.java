package com.project.cloud.rt.dao;

import java.util.HashMap;
import java.util.List;

import com.project.cloud.rt.domain.RealTime;

public interface RealTimeDao {
	// 실시간 정보 추가
	public int realTimeInfoDataInsert(HashMap<String, String> paramMap);
	
	// 실시간 정보 조회
	public List<RealTime> realTimeInfoData(String mmNo);
}
