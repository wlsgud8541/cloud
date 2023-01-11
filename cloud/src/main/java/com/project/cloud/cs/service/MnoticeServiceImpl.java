package com.project.cloud.cs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cloud.cs.dao.MnoticeDao;
import com.project.cloud.cs.domain.Mnotice;

@Service
public class MnoticeServiceImpl implements MnoticeService{

	@Autowired
	MnoticeDao mnoticeDao;
	
	@Override
	public List<Mnotice> mnSelectList(int startRow, int pageSize, String type, String keyWord) {
		return mnoticeDao.mnSelectList(startRow, pageSize, type, keyWord);
	} 

	@Override
	public int mnSelectListCount(String type, String keyWord) {
		return mnoticeDao.mnSelectListCount(type, keyWord);
	}
	
	@Override
	public Mnotice mnSelectDetail(int mnNo) {
		return mnoticeDao.mnSelectDetail(mnNo);
	} 

	@Override
	public int mnInsert(Mnotice mnotice) {
		return mnoticeDao.mnInsert(mnotice);
	}

	@Override
	public int mnUpdate(Mnotice mnotice) {
		return mnoticeDao.mnUpdate(mnotice);
	}

	@Override
	public int mnDelete(int mnNo) {
		return mnoticeDao.mnDelete(mnNo);
	}

	@Override
	public int mnUpdateReadCount(int mnNo) {
		return mnoticeDao.mnUpdateReadCount(mnNo);
	}



}
