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
	public List<MpReport> mprSelectList(int startRow, int pageSize, String type, String keyWord) {
		return mpReportDao.mprSelectList(startRow, pageSize, type, keyWord);
	}
	
	@Override
	public int mprSelectListCount(String type, String keyword) {
		return mpReportDao.mprSelectListCount(type, keyword);
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
