package com.project.cloud.cs.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cloud.cs.dao.MqnaDao;
import com.project.cloud.cs.domain.Mqna;

@Service
public class MqnaServiceImpl implements MqnaService{

	@Autowired
	MqnaDao mqnaDao;
	
	@Override
	public List<Mqna> mqSelectList() {
		return mqnaDao.mqSelectList();
	}

	@Override
	public Mqna mqSelectDetail() {
		return null;
	}

	@Override
	public int mqInsert(Mqna mqna) {
		return mqnaDao.mqInsert(mqna);
	}

	@Override
	public int mqUpdate(int mqNo, String mqTitle, String mqContent, String mqWriter) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("mqNo", mqNo);
		paramMap.put("mqTitle", mqTitle);
		paramMap.put("mqContent", mqContent);
		paramMap.put("mqWriter", mqWriter);
		
		return mqnaDao.mqUpdate(paramMap);
	}

	@Override
	public int mqDelete(int mqNo) {
		return mqnaDao.mqDelete(mqNo);
	}

}
