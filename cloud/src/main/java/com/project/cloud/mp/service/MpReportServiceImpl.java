package com.project.cloud.mp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cloud.mp.dao.MpReportDao;
import com.project.cloud.mp.domain.MpReport;

@Service
public class MpReportServiceImpl implements MpReportService {
	
	@Autowired
	private MpReportDao mpReportDao;
	
	public void setMpReportDao(MpReportDao mpReportDao) {
		this.mpReportDao = mpReportDao;
	}
	
	@Override
	public List<MpReport> mprSelectList(int startRow, int pageSize,String mpGen, String mpType, String mpKeyword, String mpInfoDate1,String mpInfoDate2, String mpLocalCode) {
		return mpReportDao.mprSelectList(startRow, pageSize, mpGen, mpType, mpKeyword, mpInfoDate1, mpInfoDate2, mpLocalCode);
	}
	
	@Override
	public int mprSelectListCount(String mpGen, String mpType, String mpKeyword, String mpDate1,String mpDate2, String mpLocalCode) {
		return mpReportDao.mprSelectListCount(mpGen, mpType, mpKeyword, mpDate1, mpDate2, mpLocalCode);
	}

	@Override
	public MpReport mprSelectDetail(int mprNo) {
		return mpReportDao.mprSelectDetail(mprNo);
	}

	@Override
	public int mprInsert(MpReport mpReport) {
		return mpReportDao.mprInsert(mpReport);
	}

	@Override
	public int mprUpdate(MpReport mpReport) {
		return mpReportDao.mprUpdate(mpReport);
	}

	@Override
	public int mprDelete(int mprNo) {
		return mpReportDao.mprDelete(mprNo);
	}

	@Override
	public int mprUpdateReadCount(int mprNo) {
		return mpReportDao.mprUpdateReadCount(mprNo);
	}
	

}
