package com.project.cloud.mh.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.cloud.mh.domain.MhFind;

@Repository
public class MhFindDaoImpl implements MhFindDao{

	@Autowired
	private SqlSessionTemplate sql;

	public void setSql(SqlSessionTemplate sql) { 
		this.sql = sql;
	}
	@Override
	public List<MhFind> mhfSelectList(int startRow, int pageSize, String mhfType, String mhfKeyword) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("pageSize", pageSize);
		map.put("mhfType", mhfType);
		map.put("mhfKeyword", mhfKeyword);
		return sql.selectList("MhFind.mhfSelectList",map);
	}

	@Override
	public MhFind mhfSelectDetail(int mhfNo) {
		
		return sql.selectOne("MhFind.mhfSelectDetail",mhfNo);
	}
	@Override
	public MhFind mhfSelectReadCount(int mhfNo, boolean count) {
		if(count) {
			return sql.selectOne("MhFind.mhfReadCount",mhfNo);
		}
		
		return sql.selectOne("MhFind.mhfSelectDetail",mhfNo);
	}
	@Override
	public int mhfInsert(MhFind mhfind) {
		
		return sql.insert("MhFind.mhfInsert",mhfind);
	}

	@Override
	public int mhfUpdate(MhFind mhfind) {
		return sql.update("MhFind.mhfUpdate",mhfind);
	}
	@Override
	public int mhfSelectListCount(String mhfType, String mhfKeyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mhfType", mhfType);
		map.put("mhfKeyword", mhfKeyword);
		return sql.selectOne("MhFind.mhfSelectListCount",map);
	}
	@Override
	public int mhfDelete(int mhfNo) {
		
		return sql.update("MhFind.mhfDelete",mhfNo);
	}
}
