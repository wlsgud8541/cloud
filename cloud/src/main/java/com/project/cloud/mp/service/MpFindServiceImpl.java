package com.project.cloud.mp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cloud.mp.dao.MpFindDao;
import com.project.cloud.mp.domain.MpFind;

@Service
public class MpFindServiceImpl implements MpFindService{
	
	@Autowired
	private MpFindDao mpFindDao;
	
	public void setMpFindDao(MpFindDao mpFindDao) {
		this.mpFindDao = mpFindDao;
	}
	
	@Override
	public List<MpFind> mpfSelectList(int startRow, int pageSize, String type, String keyWord) {
		return mpFindDao.mpfSelectList(startRow, pageSize, type, keyWord);
	}

	@Override
	public int mpfSelectListCount(String type, String keyword) {
		return mpFindDao.mpfSelectListCount(type, keyword);
	}

	@Override
	public MpFind mpfSelectDetail(int mpfNo) {
		return mpFindDao.mpfSelectDetail(mpfNo);
	}

	@Override
	public int mpfInsert(MpFind mpFind) {
		return mpFindDao.mpfInsert(mpFind);
	}

	@Override
	public int mpfUpdate(MpFind mpFind) {
		return mpFindDao.mpfUpdate(mpFind);
	}

	@Override
	public int mpfDelete(int mpfNo) {
		return mpFindDao.mpfDelete(mpfNo);
	}

	@Override
	public int mpfUpdateReadCount(int mpfNo) {
		return mpFindDao.mpfUpdateReadCount(mpfNo);
	}

}
