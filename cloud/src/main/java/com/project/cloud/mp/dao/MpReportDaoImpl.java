package com.project.cloud.mp.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.cloud.mp.domain.MpReport;

@Repository
public class MpReportDaoImpl implements MpReportDao {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	public void setSql(SqlSessionTemplate sql) {
		this.sql = sql;
	}
	
	@Override
	public List<MpReport> mprSelectList(int startRow, int pageSize, String type, String keyWord) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("startRow", startRow);
		paramMap.put("pageSize", pageSize);
		paramMap.put("type", type);
		paramMap.put("keyWord", keyWord);
		
		return sql.selectList("MpReport.mprSelectList",paramMap);
	}
	
	@Override
	public int mprSelectListCount(String type, String keyWord) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("type", type);
		paramMap.put("keyWord", keyWord);
		
		return sql.selectOne("MpReport.mprSelectListCount",paramMap);
	}
	
	@Override
	public MpReport mprSelectDetail(int mprNo) {
		return sql.selectOne("MpReport.mprSelectDetail",mprNo);
	}

	@Override
	public int mprInsert(MpReport mpReport) {
		return sql.insert("MpReport.mprInsert",mpReport);
	}

	@Override
	public int mprUpdate(MpReport mpReport) {
		return sql.update("MpReport.mprUpdate",mpReport);
	}

	@Override
	public int mprDelete(int mprNo) {
		return sql.update("MpReport.mprDelete",mprNo);
	}

	@Override
	public int mprUpdateReadCount(int mprNo) {
		return sql.update("MpReport.mprReadCountUpdate", mprNo);
	}
	
}
