package com.project.cloud.mh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cloud.mh.dao.MhReportDao;
import com.project.cloud.mh.domain.MhReport;

@Service
public class MhReportServiceImpl implements MhReportService{

	
	@Autowired
	MhReportDao mhrDao;
	
	/*
	 * public void setMhReportDao(MhReportDao mhrDao) { this.mhrDao = mhrDao; }
	 */

	@Override
	public MhReport mhrSelectDetail(int mhrNo) {
		
		return mhrDao.mhrSelectDetail(mhrNo);
	}

	@Override
	public int mhrInsert(MhReport mhReport) {
		
		return mhrDao.mhrInsert(mhReport);
	}


	@Override
	public List<MhReport> mhrSelectList(int startRow, int pagesize, String mhrType,String mhrKeyword) {
		
		return mhrDao.mhrSelectList(startRow,pagesize,mhrType,mhrKeyword);
	}


	@Override
	public int mhrUpdate(MhReport mhReport) {
		
		return mhrDao.mhrUpdate(mhReport);
	}

	@Override
	public int mhrDelete(int mhrNo) {
		return mhrDao.mhrDelete(mhrNo);
	}

	@Override
	public int mhrListCount(String mhrType, String mhrKeyword) {
		return  mhrDao.mhrListCount(mhrType,mhrKeyword);
	}

	@Override
	public MhReport mhrReadCount(int mhrNo, boolean count) {
		return mhrDao.mhrReadCount(mhrNo, count);
	}

}
