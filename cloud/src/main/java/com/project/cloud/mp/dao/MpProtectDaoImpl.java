package com.project.cloud.mp.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.cloud.mp.domain.MpProtect;

@Repository
public class MpProtectDaoImpl implements MpProtectDao{

	@Autowired
	private SqlSessionTemplate sql;
	
	public void setSql(SqlSessionTemplate sql) {
		this.sql = sql;
	}

	@Override
	public List<MpProtect> mppSelectList(int startRow, int pageSize, String type, String keyWord) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("startRow", startRow);
		paramMap.put("pageSize", pageSize);
		paramMap.put("type", type);
		paramMap.put("keyWord", keyWord);
		
		return sql.selectList("MpProtect.mppSelectList",paramMap);
	}

	@Override
	public int mppSelectListCount(String type, String keyword) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("type", type);
		paramMap.put("keyWord", keyword);
		
		return sql.selectOne("MpProtect.mppSelectListCount",paramMap);
	}

	@Override
	public MpProtect mppSelectDetail(int mppNo) {
		return sql.selectOne("MpProtect.mppSelectDetail",mppNo);
	}

	@Override
	public int mppInsert(MpProtect mpProtect) {
		return sql.insert("MpProtect.mppInsert",mpProtect);
	}

	@Override
	public int mppUpdate(MpProtect mpProtect) {
		return sql.update("MpProtect.mppUpdate",mpProtect);
	}

	@Override
	public int mppDelete(int mppNo) {
		return sql.update("MpProtect.mppDelete",mppNo);
	}

	@Override
	public int mppUpdateReadCount(int mppNo) {
		return sql.update("MpProtect.mppReadCountUpdate", mppNo);
	}
}
