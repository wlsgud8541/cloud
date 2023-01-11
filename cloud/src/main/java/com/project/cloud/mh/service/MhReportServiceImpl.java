package com.project.cloud.mh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cloud.mh.dao.MhReportDao;
import com.project.cloud.mh.domain.MhReport;

@Service
public class MhReportServiceImpl implements MhReportService{

	
	@Autowired
	MhReportDao mhrDao;
	
	/*
	 * public void setMhReportDao(MhReportDao mhrDao) { this.mhrDao = mhrDao; }
	 */

	@Override
	public MhReport mhrSelectDetail(int mhrNo) {
		
		return mhrDao.mhrSelectDetail(mhrNo);
	}

	@Override
	public int mhrInsert(MhReport mhReport) {
		
		return mhrDao.mhrInsert(mhReport);
	}


	@Override
	public List<MhReport> mhrSelectList(int startRow, int pagesize, String type,String keyword) {
		
		return mhrDao.mhrSelectList(startRow,pagesize,type,keyword);
	}


	@Override
	public int mhrUpdate(MhReport mhReport) {
		
		return mhrDao.mhrUpdate(mhReport);
	}

	@Override
	public int mhrDelete(int mhrNo) {
		return mhrDao.mhrDelete(mhrNo);
	}

	@Override
	public int mhrListCount(String type, String keyword) {
		return  mhrDao.mhrListCount(type,keyword);
	}

	@Override
	public MhReport mhrReadCount(int mhrNo, boolean count) {
		return mhrDao.mhrReadCount(mhrNo, count);
	}

}







/*
 * @Override public List<MhReport> mhrSelectList(int pageNum, String type,
 * String query) { int currentPage = pageNum;
 * 
 * int startRow = (currentPage-1) * PAGE_LIST; int listCount = 0;
 * 
 * boolean search = (type.equals("null") || query.equals("null")) ? false: true;
 * 
 * listCount = mhrDao.mhrSelectListCount(type, query); if(listCount >0) {
 * List<MhReport> mhrList = mhrDao.mhrSelectList(startRow, PAGE_LIST, type,
 * query);
 * 
 * int pageCount = listCount / PAGE_LIST + (listCount % PAGE_LIST == 0 ? 0:1);
 * int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1
 * -(currentPage%PAGE_GROUP == 0 ? PAGE_GROUP : 0);
 * 
 * int endPage = startPage + PAGE_GROUP -1;
 * 
 * if(endPage > pageCount) { endPage = pageCount; }
 * 
 * List<MhReport> mhrList2 = new ArrayList<MhReport>(); mhrList2.add(mhrList);
 * mhrList2.add(currentPage); mhrList2.add(pageCount); mhrList2.add(startPage);
 * mhrList2.add(endPage); mhrList2.add(listCount); mhrList2.add(PAGE_GROUP);
 * mhrList2.add(search);
 * 
 * if(search) { mhrList2.add(type); mhrList2.add(query); } return mhrList2;
 * }else {
 * 
 * return null; } }
 */