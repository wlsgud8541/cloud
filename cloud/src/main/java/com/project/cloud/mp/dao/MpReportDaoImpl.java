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
	public List<MpReport> mprSelectList(int startRow, int pageSize, String mpGen, String mpType, String mpKeyword, String mpInfoDate1,String mpInfoDate2, String mpLocalCode) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("startRow", startRow);
		paramMap.put("pageSize", pageSize);
		paramMap.put("mpGen", mpGen);
		paramMap.put("mpType", mpType);
		paramMap.put("mpKeyword", mpKeyword);
		paramMap.put("mpDate1", mpInfoDate1);
		paramMap.put("mpDate2", mpInfoDate2);
		paramMap.put("mpLocalCode", mpLocalCode);
		
		return sql.selectList("MpReport.mprSelectList",paramMap);
	}
	
	@Override
	public int mprSelectListCount(String mpGen, String mpType, String mpKeyword, String mpDate1,String mpDate2, String mpLocalCode) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("mpGen", mpGen);
		paramMap.put("mpType", mpType);
		paramMap.put("mpKeyword", mpKeyword);
		paramMap.put("mpDate1", mpDate1);
		paramMap.put("mpDate2", mpDate2);
		paramMap.put("mpLocalCode", mpLocalCode);
		
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
