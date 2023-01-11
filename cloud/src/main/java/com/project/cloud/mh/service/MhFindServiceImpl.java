package com.project.cloud.mh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cloud.mh.dao.MhFindDao;
import com.project.cloud.mh.domain.MhFind;

@Service
public class MhFindServiceImpl implements MhFindService{

	@Autowired
	MhFindDao mhfDao;
	public void setMhFindDao(MhFindDao mhfDao) {
		this.mhfDao = mhfDao;
	} 
	@Override
	public List<MhFind> mhfSelectList(int startRow, int pageSize, String type, String keyword) {
		return  mhfDao.mhfSelectList(startRow, pageSize, type, keyword);
	}

	@Override
	public MhFind mhfSelectDetail(int mhfNo) {
		
		return mhfDao.mhfSelectDetail(mhfNo);
	}

	@Override
	public int mhfInsert(MhFind mhfind) {
		
		return mhfDao.mhfInsert(mhfind);
	}

	@Override
	public int mhfUpdate(MhFind mhfind) {
		return mhfDao.mhfUpdate(mhfind);
	}
	@Override
	public int mhfSelectListCount(String type, String keyword) {
		
		return mhfDao.mhfSelectListCount(type, keyword);
	}
	@Override
	public MhFind mhfSelectReadCount(int mhfNo, boolean count) {
		return null;
	}
	@Override
	public int mhfDelete(int mhfNo) {
		
		return mhfDao.mhfDelete(mhfNo);
	}

}
