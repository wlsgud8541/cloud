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
	public int realTimeInfoDataInsert(HashMap<String, String> paramMap) {
		return sql.insert("RealTime.realTimeInfoDataInsert", paramMap);
	}
	
	
	@Override
	public List<RealTime> realTimeInfoData(String mmNo) {
		return sql.selectList("RealTime.realTimeInfoData", mmNo);
	}
}
