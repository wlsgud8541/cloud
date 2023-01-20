package com.project.cloud.rt.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.cloud.rt.domain.RealTime;

@Repository
public class RealTimeDaoImpl implements RealTimeDao{

	@Autowired
	private SqlSessionTemplate sql;
	
	public void setSql(SqlSessionTemplate sql) {
		this.sql = sql;
	}
	
	@Override
	public int realTimeMfInfoDataInsert(HashMap<String, String> paramMap) {
		return sql.insert("RealTime.realTimeMfInfoDataInsert", paramMap);
	}
	
	@Override
	public int realTimeMpInfoDataInsert(HashMap<String, String> paramMap) {
		return sql.insert("RealTime.realTimeMpInfoDataInsert", paramMap);
	}
	
	@Override
	public List<RealTime> realTimeMhInfo(String mmNo) {
		return sql.selectList("RealTime.realTimeMhInfo", mmNo);
	}

	@Override
	public List<RealTime> realTimeMpInfo(String mmNo) {
		return sql.selectList("RealTime.realTimeMpInfo", mmNo);
	}
}
