package com.project.cloud.main.dao;

import java.util.List;

import com.project.cloud.cs.domain.Mnotice;
import com.project.cloud.mh.domain.MhFind;
import com.project.cloud.mh.domain.MhReport;
import com.project.cloud.mp.domain.MpFind;

public interface MainDao {
//	메인공지
	public List<Mnotice> mainMnList();
//	메인 실종자 목격
	public List<MhFind> mainMhfList();
//	메인 반려동물 목격
	public List<MpFind> mainMpfList();
// 메인 통합검색
	public List<Object> mainUsearch(String type, String keyword);
//	소검색 실종자 신고
	public List<MhReport> mhrSrch(int startRow, int pageSize, String mhName, String mhGen,String mhInfoDate1, String mhInfoDate2, String mhrLocalCode);
//	소검색 실종자 목격
	public List<MhFind> mhfSrch(int startRow, int pageSize, String mhfDate1, String mhfDate2);
}