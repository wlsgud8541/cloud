package com.project.cloud.main.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.cloud.cs.domain.Mnotice;
import com.project.cloud.mh.domain.MhFind;
import com.project.cloud.mp.domain.MpFind;

@Repository
public class MainDaoImpl implements MainDao {

	@Autowired
	private SqlSessionTemplate sql;
	
	//메인공지
	@Override
	public List<Mnotice> mainMnList() {
		HashMap<String, Integer> paramMap = new HashMap<String, Integer>();
		paramMap.put("startRow", 0);
		paramMap.put("pageSize", 6);
		return sql.selectList("Mnotice.mnSelectList",paramMap);
	}
//	메인 실종자 목격
	@Override
	public List<MhFind> mainMhfList() {
		HashMap<String, Integer> paramMap = new HashMap<String, Integer>();
		paramMap.put("startRow", 0);
		paramMap.put("pageSize", 6);
		return sql.selectList("MhFind.mhfSelectList",paramMap);
	}
	
//	메인 반려동물 목격
	@Override
	public List<MpFind> mainMpfList() {
		HashMap<String, Integer> paramMap = new HashMap<String, Integer>();
		paramMap.put("startRow", 0);
		paramMap.put("pageSize", 6);
		return sql.selectList("MpFind.mpfSelectList",paramMap);
	}
}
