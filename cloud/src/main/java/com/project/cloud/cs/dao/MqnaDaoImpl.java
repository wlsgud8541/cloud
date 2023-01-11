package com.project.cloud.cs.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.cloud.cs.domain.Mqna;

@Repository
public class MqnaDaoImpl implements MqnaDao{

	@Autowired
	private SqlSessionTemplate sql;

	@Override
	public List<Mqna> mqSelectList() {
		return sql.selectList("Mqna.mqSelectList");
	}

	@Override
	public Mqna mqSelectDetail() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int mqInsert(Mqna mqna) {
		return sql.insert("Mqna.mqInsert", mqna);
	}

	@Override
	public int mqUpdate(Map<String, Object> paramMap) {
		return sql.update("Mqna.mqUpdate", paramMap);
	}

	@Override
	public int mqDelete(int mqNo) {
		return sql.update("Mqna.mqDelete", mqNo);
	}
}
