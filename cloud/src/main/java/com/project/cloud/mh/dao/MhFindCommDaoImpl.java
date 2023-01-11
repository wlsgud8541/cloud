package com.project.cloud.mh.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.cloud.mh.domain.MhFindComm;

@Repository
public class MhFindCommDaoImpl implements MhFindCommDao{

	@Autowired
	private SqlSessionTemplate sql;

	public void setSql(SqlSessionTemplate sql) {
		this.sql = sql; 
	}
	@Override
	public List<MhFindComm> mhfcSelectList(int mhfNo) {
		
		return sql.selectList("MhFindComm.mhfcSelectList",mhfNo);
	}

	@Override
	public int mhfcInsert(MhFindComm mhfindCom) {
		
		return sql.insert("MhFindComm.mhfcInsert",mhfindCom);
	}

	@Override
	public int mhfcUpdate(MhFindComm mhfindCom) {
		return sql.update("MhFindComm.mhfcUpdate",mhfindCom);
	}
	@Override
	public int mhfcDelete(MhFindComm mhfCom) {
		
		return sql.update("MhFindComm.mhfcDelete", mhfCom);
	}

}
