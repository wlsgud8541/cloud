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
	@Override
	public List<MpReport> mainMprList() {
		return mainDao.mainMprList();
	}
	@Override
	public Map<String,Object> mainUsearch(String keyword) {
		Map<String, Object> searchMap = new HashMap<String,Object>();
		List<Main> searchList = new ArrayList<Main>();
		for (Main mainSearch : mainDao.mainUsearch(keyword)) {
			searchList.add(mainSearch);
		}
		searchMap.put("searchList", searchList);
		return searchMap;
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

}
