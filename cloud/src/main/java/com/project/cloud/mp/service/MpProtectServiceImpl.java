package com.project.cloud.mp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cloud.mp.dao.MpProtectDao;
import com.project.cloud.mp.domain.MpProtect;

@Service
public class MpProtectServiceImpl implements MpProtectService{
	
	@Autowired
	private MpProtectDao mpProtectDao;
	
	public void setMpProtectDao(MpProtectDao mpProtectDao) {
		this.mpProtectDao = mpProtectDao;
	}
	
	@Override
	public List<MpProtect> mppSelectList(int startRow, int pageSize, String type, String keyWord) {
		return mpProtectDao.mppSelectList(startRow, pageSize, type, keyWord);
	}

	@Override
	public int mppSelectListCount(String type, String keyword) {
		return mpProtectDao.mppSelectListCount(type, keyword);
	}

	@Override
	public MpProtect mppSelectDetail(int mppNo) {
		return mpProtectDao.mppSelectDetail(mppNo);
	}

	@Override
	public int mppInsert(MpProtect mpProtect) {
		return mpProtectDao.mppInsert(mpProtect);
	}

	@Override
	public int mppUpdate(MpProtect mpProtect) {
		return mpProtectDao.mppUpdate(mpProtect);
	}

	@Override
	public int mppDelete(int mppNo) {
		return mpProtectDao.mppDelete(mppNo);
	}

	@Override
	public int mppUpdateReadCount(int mppNo) {
		return mpProtectDao.mppUpdateReadCount(mppNo);
	}

}
