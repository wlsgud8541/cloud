package com.project.cloud.mh.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.cloud.mh.domain.MhReport;

@Repository
public class MhReportDaoImpl implements MhReportDao {

	@Autowired
	private SqlSessionTemplate sql;
 
	public void setSql(SqlSessionTemplate sql) {
		this.sql = sql;
	}


	@Override
	public MhReport mhrSelectDetail(int mhrNo) {
		
		return sql.selectOne("MhReport.mhrSelectDetail",mhrNo);
	}

	@Override
	public int mhrInsert(MhReport mhReport) {
		
		return sql.insert("MhReport.mhrInsert",mhReport);
	}

	@Override
	public int mhrUpdate(MhReport mhReport) {
		
		return sql.update("MhReport.mhrUpdate",mhReport);
	}
	
	@Override
	public int mhrSelectListCount(String type, String mhrKeyword) {
		Map<String,Object> mhrMap = new HashMap<String,Object>();
		mhrMap.put("type", type);
		mhrMap.put("mhrKeyword", mhrKeyword);
		return sql.selectOne("MhReport.mhrSelectListCount",mhrMap);
	}


	@Override
	public List<MhReport> mhrSelectList(int startRow, int pagesize, String mhrType,String mhrKeyword) {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("startRow", startRow);
		map.put("pagesize", pagesize);
		map.put("mhrType", mhrType);
		map.put("mhrKeyword", mhrKeyword);
		return sql.selectList("MhReport.mhrSelectList",map);
	}


	@Override
	public int mhrDelete(int mhrNo) {
		
		return sql.update("MhReport.mhrDelete",mhrNo);
	}


	@Override
	public int mhrListCount(String mhrType, String mhrKeyword) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("mhrType", mhrType);
		map.put("mhrKeyword", mhrKeyword);
		return sql.selectOne("MhReport.mhrListCount",map);
	}


	@Override
	public MhReport mhrReadCount(int mhrNo, boolean count) {
		if(count) {
			sql.selectOne("MhReport.mhrReadCount",mhrNo);
		}
		return sql.selectOne("MhReport.mhrSelectDetail",mhrNo);
	}
}




/*
 * @Override public List<MhReport> mhrSelectList(int startRow, int no, String
 * type, String query) { Map<String, Object> mhrMap = new HashMap<String,
 * Object>(); mhrMap.put("startRow", startRow); mhrMap.put("no", no); return
 * sql.selectList(".mhrSelectList",mhrMap); }
 */