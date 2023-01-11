package com.project.cloud.mh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cloud.mh.dao.MhFindCommDao;
import com.project.cloud.mh.domain.MhFindComm;

@Service
public class MhFindCommServiceImpl implements MhFindCommService {

	@Autowired
	MhFindCommDao mhfcDao;
	
	public void setMhFindCommDao(MhFindCommDao mhfcDao) {
		this.mhfcDao = mhfcDao; 
	} 
	@Override
	public List<MhFindComm> mhfcSelectList(int mhfNo) {
		return mhfcDao.mhfcSelectList(mhfNo);
	}

	@Override
	public int mhfcInsert(MhFindComm mhfindCom) {
		
		return mhfcDao.mhfcInsert(mhfindCom);
	}

	@Override
	public int mhfcUpdate(MhFindComm mhfindCom) {
		return mhfcDao.mhfcUpdate(mhfindCom);
	}
	@Override
	public int mhfcDelete(MhFindComm mhfCom) {
		return mhfcDao.mhfcDelete(mhfCom);
	}


}
