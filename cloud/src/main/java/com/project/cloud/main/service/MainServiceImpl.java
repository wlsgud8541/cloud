package com.project.cloud.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cloud.cs.domain.Mnotice;
import com.project.cloud.main.dao.MainDao;
import com.project.cloud.main.domain.Main;
import com.project.cloud.mh.domain.MhFind;
import com.project.cloud.mh.domain.MhInfo;
import com.project.cloud.mh.domain.MhReport;
import com.project.cloud.mp.domain.MpFind;
import com.project.cloud.mp.domain.MpProtect;
import com.project.cloud.mp.domain.MpReport;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	private MainDao mainDao;
	
	@Override
	public List<Mnotice> mainMnList() {
		return mainDao.mainMnList();
	}

	@Override
	public List<MhFind> mainMhfList() {
		return mainDao.mainMhfList();
	}

	@Override
	public List<MpFind> mainMpfList() {
		return mainDao.mainMpfList();
	}
//	메인 실종자 정보
	@Override
	public List<MhInfo> mainMhiList() {
		return mainDao.mainMhiList();
	}
	@Override
	public List<MpReport> mainMprList() {
		return mainDao.mainMprList();
	}
	@Override
	public List<Main> mainUsearch(String uSearch) {
		Map<String, String> searchMap = new HashMap<String,String>();
		searchMap.put("uSearchs", uSearch);
		return mainDao.mainUsearch(searchMap);
	}
	
//	소검색
	@Override
	public List<MhReport> mhrSrchList(String mhName, String mhCode, String mhGen,String mpDate1, String mpDate2, String mhrLocalCode) {
		return mainDao.mhrSrchList(mhName,mhCode, mhGen, mpDate1, mpDate2, mhrLocalCode);
	}
//	소검색 반려동물 신고
	@Override
	public List<MpReport> mprSrchList(String mpGen, String mpType, String mpKeyword,
			String mpDate1, String mpDate2, String mpLocalCode) {
		return mainDao.mprSrchList(mpGen, mpType, mpKeyword, mpDate1, mpDate2, mpLocalCode);
	}
//	소검색 반려동물 임보
	@Override
	public List<MpProtect> mppSrchList(String mpGen, String mpType, String mpKeyword,
			String mpDate1, String mpDate2, String mpLocalCode) {
		return mainDao.mppSrchList(mpGen, mpType, mpKeyword, mpDate1, mpDate2, mpLocalCode);
	}
//	실종자 그래프
	@Override
	public List<Main> mhGraph() {
		return mainDao.mhGraph();
	}
//	실종 반려동물 그래프
	@Override
	public List<Main> mpGraph() {
		return mainDao.mpGraph();
	}


}
