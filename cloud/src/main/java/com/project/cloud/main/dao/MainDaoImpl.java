package com.project.cloud.main.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.cloud.cs.domain.Mnotice;
import com.project.cloud.mh.domain.MhFind;
import com.project.cloud.mh.domain.MhReport;
import com.project.cloud.mp.domain.MpFind;
import com.project.cloud.mp.domain.MpProtect;
import com.project.cloud.mp.domain.MpReport;

@Repository
public class MainDaoImpl implements MainDao {

	@Autowired
	private SqlSessionTemplate sql;

	// 메인공지
	@Override
	public List<Mnotice> mainMnList() {
		HashMap<String, Integer> paramMap = new HashMap<String, Integer>();
		paramMap.put("startRow", 0);
		paramMap.put("pageSize", 6);
		return sql.selectList("Mnotice.mnSelectList", paramMap);
	}

//	메인 실종자 목격
	@Override
	public List<MhFind> mainMhfList() {
		HashMap<String, Integer> paramMap = new HashMap<String, Integer>();
		paramMap.put("startRow", 0);
		paramMap.put("pageSize", 6);
		return sql.selectList("MhFind.mhfSelectList", paramMap);
	}

//	메인 반려동물 목격
	@Override
	public List<MpFind> mainMpfList() {
		HashMap<String, Integer> paramMap = new HashMap<String, Integer>();
		paramMap.put("startRow", 0);
		paramMap.put("pageSize", 6);
		return sql.selectList("MpFind.mpfSelectList", paramMap);
	}

	@Override
	public List<Object> mainUsearch(String type, String keyword) {
		HashMap<String, Object> search = new HashMap<String, Object>();
		search.put("type", type);
		search.put("keyword", keyword);
		return sql.selectList("MhReport.uSearch", search);
	}

//	소검색
	@Override
	public List<MhReport> mhrSrchList(int startRow, int pageSize, String mhName, String mhGen, String mhInfoDate1,
			String mhInfoDate2, String mhrLocalCode) {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("startRow", startRow);
		paramMap.put("pagesize", pageSize);
		paramMap.put("mhName", mhName);
		paramMap.put("mhGen", mhGen);
		paramMap.put("mhInfoDate1", mhInfoDate1);
		paramMap.put("mhInfoDate2", mhInfoDate2);
		paramMap.put("mhrLocalCode", mhrLocalCode);
		return sql.selectList("MhReport.mhrSelectList", paramMap);
	}

//	소검색 실종자 글 갯수
	@Override
	public int mhrCnt(String mhName, String mhGen,String mhInfoDate1, String mhInfoDate2, String mhrLocalCode) {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("mhName", mhName);
		paramMap.put("mhGen", mhGen);
		paramMap.put("mhInfoDate1", mhInfoDate1);
		paramMap.put("mhInfoDate2", mhInfoDate2);
		paramMap.put("mhrLocalCode", mhrLocalCode);
		return sql.selectOne("MhReport.mhrListCount",paramMap);
	}
//	소검색 반려동물 실종
	@Override
	public List<MpReport> mprSrchList(int startRow, int pageSize, String mpGen, String mpType, String mpKeyword,
			String mpInfoDate1, String mpInfoDate2, String mpLocalCode) {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("startRow", startRow);
		paramMap.put("pageSize", pageSize);
		paramMap.put("mpGen", mpGen);
		paramMap.put("mpType", mpType);
		paramMap.put("mpKeyword", mpKeyword);
		paramMap.put("mpInfoDate1", mpInfoDate1);
		paramMap.put("mpInfoDate2", mpInfoDate2);
		paramMap.put("mpLocalCode", mpLocalCode);
		return sql.selectList("MpReport.mprSelectList",paramMap);
	}

//	소검색 반려동물 실종 글 갯수
	@Override
	public int mprCnt() {
		return sql.selectOne("MpReport.mprSelectListCount");
	}
//	소검색 반려동물 임보
	@Override
	public List<MpProtect> mppSrchList(int startRow, int pageSize, String mpGen, String mpType, String mpKeyword,
			String mpInfoDate1, String mpInfoDate2, String mpLocalCode) {
		return sql.selectList("MpReport.mppSelectList");
	}
//	소검색 반려동물 임보 글 갯수
	@Override
	public int mppCnt() {
		// TODO Auto-generated method stub
		return 0;
	}
	

}
