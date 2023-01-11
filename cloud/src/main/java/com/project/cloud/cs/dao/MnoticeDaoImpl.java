package com.project.cloud.cs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.cloud.cs.domain.Mnotice;

@Repository
public class MnoticeDaoImpl implements MnoticeDao{

	@Autowired
	private SqlSessionTemplate sql;

	@Override
	public List<Mnotice> mnSelectList(int startRow, int pageSize, String type, String keyWord) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("startRow", startRow);
		paramMap.put("pageSize", pageSize);
		paramMap.put("type", type);
		paramMap.put("keyWord", keyWord);
		
		return sql.selectList("Mnotice.mnSelectList",paramMap);
	}

	@Override
	public int mnSelectListCount(String type, String keyWord) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("type", type);
		paramMap.put("keyWord", keyWord);
		
		return sql.selectOne("Mnotice.mnSelectListCount",paramMap);
	}
	
	@Override
	public Mnotice mnSelectDetail(int mnNo) {
		return sql.selectOne("Mnotice.mnSelectDetail", mnNo);
	}

	@Override
	public int mnInsert(Mnotice mnotice) {
		return sql.insert("Mnotice.mnInsert", mnotice);
	}
	
	@Override
	public int mnUpdate(Mnotice mnotice) {
		return sql.update("Mnotice.mnUpdate", mnotice);
	}

	@Override
	public int mnDelete(int mnNo) {
		return sql.update("Mnotice.mnDelete", mnNo);
	}

	@Override
	public int mnUpdateReadCount(int mnNo) {
		return sql.update("Mnotice.mnReadCountUpdate", mnNo);
	}

}
