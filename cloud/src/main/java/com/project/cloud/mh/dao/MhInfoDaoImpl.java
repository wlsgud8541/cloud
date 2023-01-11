package com.project.cloud.mh.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.cloud.mh.domain.MhInfo;

@Repository
public class MhInfoDaoImpl implements MhInfoDao {

	@Autowired
	private SqlSessionTemplate sql;

	public void setSql(SqlSessionTemplate sql) {
		this.sql = sql; 
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
