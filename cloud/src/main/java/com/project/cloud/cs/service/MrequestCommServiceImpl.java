package com.project.cloud.cs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cloud.cs.dao.MrequestCommDao;
import com.project.cloud.cs.domain.MrequestComm;

@Service
public class MrequestCommServiceImpl implements MrequestCommService{

	@Autowired
	private MrequestCommDao MrequestCommDao;
	/*
	@Override
	public List<MrequestComm> mrcSelectList(int mreComNo) {
		return MrequestCommDao.mrcSelectList(mreComNo);
	}
	*/
	public void setMrequestCommDao(MrequestCommDao mrequestCommDao) {
		MrequestCommDao = mrequestCommDao;
	}
	
	@Override
	public MrequestComm mrcSelectDetail(int mreNo) {
		return MrequestCommDao.mrcSelectDetail(mreNo);
	}

	@Override
	public int mrcInsert(MrequestComm mrequestComm) {
		return MrequestCommDao.mrcInsert(mrequestComm);
	}

	@Override
	public int mrcUpdate(MrequestComm mrequestComm) {
		return MrequestCommDao.mrcUpdate(mrequestComm);
	}

	@Override
	public int mrcDelete(int mreComNo) {
		return MrequestCommDao.mrcDelete(mreComNo);
	}


}

