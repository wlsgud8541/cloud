package com.project.cloud.mp.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.cloud.mp.domain.MpFind;

@Repository
public class MpFindDaoImpl implements MpFindDao {

	@Autowired
	private SqlSessionTemplate sql;
	
	public void setSql(SqlSessionTemplate sql) {
		this.sql = sql;
	}

	@Override
	public List<MpFind> mpfSelectList(int startRow, int pageSize, String type, String keyWord) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("startRow", startRow);
		paramMap.put("pageSize", pageSize);
		paramMap.put("type", type);
		paramMap.put("keyWord", keyWord);
		
		return sql.selectList("MpFind.mpfSelectList",paramMap);
	}

	@Override
	public int mpfSelectListCount(String type, String keyword) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("type", type);
		paramMap.put("keyWord", keyword);
		
		return sql.selectOne("MpFind.mpfSelectListCount",paramMap);
	}

	@Override
	public MpFind mpfSelectDetail(int mprNo) {
		
		return sql.selectOne("MpFind.mpfSelectDetail",mprNo);
	}

	@Override
	public int mpfInsert(MpFind mpFind) {
		
		return sql.insert("MpFind.mpfInsert",mpFind);
	}

	@Override
	public int mpfUpdate(MpFind mpFind) {
		
		return sql.update("MpFind.mpfUpdate",mpFind);
	}

	@Override
	public int mpfDelete(int mpfNo) {
		
		return sql.update("MpFind.mpfDelete",mpfNo);
	}

	@Override
	public int mpfUpdateReadCount(int mpfNo) {
		
		return sql.update("MpFind.mpfReadCountUpdate", mpfNo);
	}
}
