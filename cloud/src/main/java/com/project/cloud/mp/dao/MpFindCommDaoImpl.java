package com.project.cloud.mp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.cloud.mp.domain.MpFindComm;

@Repository
public class MpFindCommDaoImpl implements MpFindCommDao{

	@Autowired
	private SqlSessionTemplate sql;
	
	public void setSql(SqlSessionTemplate sql) {
		this.sql = sql;
	}

	@Override
	public List<MpFindComm> mpfcSelectList(int mpfNo) {
		return sql.selectList("MpFindComm.mpfcSelectList",mpfNo);
	}

	@Override
	public int mpfcInsert(MpFindComm mpfindCom) {

		return sql.insert("MpFindComm.mpfcInsert",mpfindCom);
	}

	@Override
	public int mpfcUpdate(MpFindComm mpfindCom) {

		return sql.update("MpFindComm.mpfcUpdate", mpfindCom);
	}

	@Override
	public int mpfcDelete(int mpfcNo) {
		return sql.delete("MpFindComm.mpfcDelete", mpfcNo);
	}
}
