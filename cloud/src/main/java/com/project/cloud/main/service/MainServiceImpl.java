package com.project.cloud.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cloud.cs.domain.Mnotice;
import com.project.cloud.main.dao.MainDao;
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
	public List<Object> uSearch(String type, String keyword) {
		
		return mainDao.mainUsearch(type, keyword);
	}
	
//	소검색
	@Override
	public List<MhReport> mhrSrchList(int startRow, int pageSize, String mhName, String mhGen,String mhInfoDate1, String mhInfoDate2, String mhrLocalCode) {
		return mainDao.mhrSrchList(startRow, pageSize, mhName, mhGen, mhInfoDate1, mhInfoDate2, mhrLocalCode);
	}
//	소검색 글 갯수
	@Override
	public int mhrCnt(String mhName, String mhGen,String mhInfoDate1, String mhInfoDate2, String mhrLocalCode) {
		return mainDao.mhrCnt( mhName,  mhGen, mhInfoDate1,  mhInfoDate2,  mhrLocalCode);
	}
//	소검색 반려동물 신고
	@Override
	public List<MpReport> mprSrchList(int startRow, int pageSize, String mpGen, String mpType, String mpKeyword,
			String mpInfoDate1, String mpInfoDate2, String mpLocalCode) {
		return mainDao.mprSrchList(startRow, pageSize, mpGen, mpType, mpKeyword, mpInfoDate1, mpInfoDate2, mpLocalCode);
	}
//	소검색 반려동물 신고 글 갯수
	@Override
	public int mprCnt() {
		return mainDao.mprCnt();
	}
//	소검색 반려동물 임보
	@Override
	public List<MpProtect> mppSrchList(int startRow, int pageSize, String mpGen, String mpType, String mpKeyword,
			String mpInfoDate1, String mpInfoDate2, String mpLocalCode) {
		return mainDao.mppSrchList(startRow, pageSize, mpGen, mpType, mpKeyword, mpInfoDate1, mpInfoDate2, mpLocalCode);
	}
//	소검색 반려동물 임보 글 갯수
	@Override
	public int mppCnt() {
		// TODO Auto-generated method stub
		return 0;
	}
	

}
