package com.project.cloud.main.dao;

import java.util.List;

import com.project.cloud.cs.domain.Mnotice;
import com.project.cloud.mh.domain.MhFind;
import com.project.cloud.mp.domain.MpFind;

public interface MainDao {
//	메인공지
	public List<Mnotice> mainMnList();
//	메인 실종자 목격
	public List<MhFind> mainMhfList();
//	메인 반려동물 목격
	public List<MpFind> mainMpfList();
}