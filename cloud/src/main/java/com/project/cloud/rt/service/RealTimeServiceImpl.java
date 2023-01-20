package com.project.cloud.rt.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cloud.rt.dao.RealTimeDao;
import com.project.cloud.rt.domain.RealTime;

@Service
public class RealTimeServiceImpl implements RealTimeService{
	
	@Autowired
	private RealTimeDao rtDao;

	@Override
	public int realTimeInfoDataInsert(String mmNo, String strAddr,String latitude, String longitude) {
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("mmNo",mmNo);
		paramMap.put("strAddr",strAddr);
		paramMap.put("latitude",latitude);
		paramMap.put("longitude",longitude);
		
		return rtDao.realTimeInfoDataInsert(paramMap);
	}
	
	@Override
	public List<RealTime> realTimeInfoData(String mmNo) {
		
		return rtDao.realTimeInfoData(mmNo);
	}


}
