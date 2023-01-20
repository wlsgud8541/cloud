package com.project.cloud.rt.service;

import java.util.List;

import com.project.cloud.rt.domain.RealTime;

public interface RealTimeService {
	// 실시간 정보 추가
	public int realTimeInfoDataInsert(String mmNo, String strAddr,String latitude, String longitude);
	
	// 실시간 정보 조회
	public List<RealTime> realTimeInfoData(String mmNo);
}
