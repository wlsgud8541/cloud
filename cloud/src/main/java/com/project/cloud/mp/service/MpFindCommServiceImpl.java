package com.project.cloud.mp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cloud.mp.dao.MpFindCommDao;
import com.project.cloud.mp.domain.MpFindComm;

@Service
public class MpFindCommServiceImpl implements MpFindCommService{
	
	@Autowired
	MpFindCommDao mpfcDao;
	
	public void setMpFindCommDao(MpFindCommDao mpfcDao) {
		this.mpfcDao = mpfcDao;
	}
	
	@Override
	public List<MpFindComm> mpfcSelectList(int mpfNo) {
		return mpfcDao.mpfcSelectList(mpfNo);
	}

	@Override
	public int mpfcInsert(MpFindComm mpfindCom) {
		return mpfcDao.mpfcInsert(mpfindCom);
	}

	@Override
	public int mpfcUpdate(MpFindComm mpfindCom) {
		return mpfcDao.mpfcUpdate(mpfindCom);
	}

	@Override
	public int mpfcDelete(MpFindComm mpfindCom) {
		return mpfcDao.mpfcDelete(mpfindCom);
	}

}
