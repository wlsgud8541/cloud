package com.project.cloud.mh.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.json.simple.parser.ParseException;

import com.project.cloud.mh.domain.MhInfo;

public interface MhInfoService {
	// 실종자 정보 게시판 목록화면 조회
	public Map<String, Object> mhiSelectList() throws IOException, ParseException;
	// 실종자 정보 게시판 상세화면 조회
	public MhInfo mhiSelectDetail();
	// 실종자 정보 게시판 작성화면
	public int mhiInsert(MhInfo mhInfo);
	// 실종자 정보 게시판 수정화면 
	public int mhiUpdate();
}
