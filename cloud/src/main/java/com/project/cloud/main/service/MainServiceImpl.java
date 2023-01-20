package com.project.cloud.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cloud.cs.domain.Mnotice;
import com.project.cloud.main.dao.MainDao;
import com.project.cloud.mh.domain.MhFind;
import com.project.cloud.mh.domain.MhReport;
import com.project.cloud.mp.domain.MpFind;

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
	public List<Object> uSearch(String type, String keyword) {
		
		return mainDao.mainUsearch(type, keyword);
	}
	
//	소검색
	@Override
	public List<MhFind> mhfSrch(int startRow, int pageSize, String mhfDate1, String mhfDate2) {
		return mainDao.mhfSrch(startRow, pageSize, mhfDate1, mhfDate2);
	}

	@Override
	public List<MhReport> mhrSrch(int startRow, int pageSize, String mhName, String mhGen,String mhInfoDate1, String mhInfoDate2, String mhrLocalCode) {
		return mainDao.mhrSrch(startRow, pageSize, mhName, mhGen, mhInfoDate1, mhInfoDate2, mhrLocalCode);
	}
	

}
