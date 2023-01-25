package com.project.cloud.main.dao;

import java.util.List;

import com.project.cloud.cs.domain.Mnotice;
import com.project.cloud.main.domain.Main;
import com.project.cloud.mh.domain.MhFind;
import com.project.cloud.mh.domain.MhInfo;
import com.project.cloud.mh.domain.MhReport;
import com.project.cloud.mp.domain.MpFind;
import com.project.cloud.mp.domain.MpProtect;
import com.project.cloud.mp.domain.MpReport;

public interface MainDao {
//	메인공지
	public List<Mnotice> mainMnList();
//	메인 실종자 목격
	public List<MhFind> mainMhfList();
//	메인 반려동물 목격
	public List<MpFind> mainMpfList();
//	메인 실종자 정보
	public List<MhInfo> mainMhiList();
//	메인 반려동물 신고
	public List<MpReport> mainMprList();
// 메인 통합검색
	public List<Main> mainUsearch(String keyword);
//	소검색 실종자 신고
	public List<MhReport> mhrSrchList(String mhName, String mhCode, String mhGen,String mhInfoDate1, String mhInfoDate2, String mhrLocalCode);
//	소검색 반려동물 신고
	public List<MpReport> mprSrchList(String mpGen,String mpType ,String mpKeyword, String mpDate1, String mpDate2, String mpLocalCode);
//	소검색 반려동물 임보
	public List<MpProtect> mppSrchList(String mpGen,String mpType ,String mpKeyword, String mpDate1, String mpDate2, String mpLocalCode);
	// 실종자 그래프
	public List<Main> mhGraph();
//	실종 반려동물 그래프
	public List<Main> mpGraph();
}