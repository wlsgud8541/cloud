package com.project.cloud.main.service;

import java.util.List;

import com.project.cloud.cs.domain.Mnotice;
import com.project.cloud.mh.domain.MhFind;
import com.project.cloud.mh.domain.MhReport;
import com.project.cloud.mp.domain.MpFind;
import com.project.cloud.mp.domain.MpProtect;
import com.project.cloud.mp.domain.MpReport;

public interface MainService {
	//메인 공지
	public List<Mnotice> mainMnList();
	//메인 실종자 목격
	public List<MhFind> mainMhfList();
	//메인 반려동물 목격
	public List<MpFind> mainMpfList();
	// 메인 통합검색
	public List<Object> uSearch(String type, String keyword);
	//소검색
	public List<MhReport> mhrSrchList(int startRow, int pageSize, String mhName, String mhGen,String mhInfoDate1, String mhInfoDate2, String mhrLocalCode);
	//소검색 글 갯수
	public int mhrCnt(String mhName, String mhGen,String mhInfoDate1, String mhInfoDate2, String mhrLocalCode);
//	소검색 반려동물 신고
	public List<MpReport> mprSrchList(int startRow, int pageSize, String mpGen,String mpType ,String mpKeyword, String mpInfoDate1, String mpInfoDate2, String mpLocalCode);
//	소검색 반려동물 신고 글 갯수
	public int mprCnt();
//	소검색 반려동물 임보
	public List<MpProtect> mppSrchList(int startRow, int pageSize, String mpGen,String mpType ,String mpKeyword, String mpInfoDate1, String mpInfoDate2, String mpLocalCode);
//	소검색 반려동물 임보 글 갯수
	public int mppCnt();
}
