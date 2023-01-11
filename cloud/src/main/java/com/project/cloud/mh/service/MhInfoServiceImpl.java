package com.project.cloud.mh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cloud.mh.dao.MhInfoDao;
import com.project.cloud.mh.domain.MhInfo;

@Service
public class MhInfoServiceImpl implements MhInfoService{

	@Autowired
	MhInfoDao mhiDao;
	public void setMhInfoDao(MhInfoDao mhiDao) {
		this.mhiDao = mhiDao;
	}
	@Override
	public List<MhInfo> mhiSelectList() {
		return null; 
	}

	@Override
	public MhInfo mhiSelectDetail() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int mhiInsert() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int mhiUpdate() {
		// TODO Auto-generated method stub
		return 0;
	}

}
