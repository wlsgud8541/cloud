package com.project.cloud.main.service;

import java.util.List;

import com.project.cloud.cs.domain.Mnotice;
import com.project.cloud.mh.domain.MhFind;
import com.project.cloud.mp.domain.MpFind;

public interface MainService {
	//메인 공지
	public List<Mnotice> mainMnList();
	//메인 실종자 목격
	public List<MhFind> mainMhfList();
	//메인 반려동물 목격
	public List<MpFind> mainMpfList();
	// 메인 통합검색
	public List<Object> uSearch(String type, String keyword);
}
