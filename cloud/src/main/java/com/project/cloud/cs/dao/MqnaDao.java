package com.project.cloud.cs.dao;

import java.util.List;
import java.util.Map;

import com.project.cloud.cs.domain.Mqna;

public interface MqnaDao {
	// Q&A 게시판 목록화면 조회
	public List<Mqna> mqSelectList();
	// Q&A 게시판 상세화면 조회
	public Mqna mqSelectDetail();
	// Q&A 게시판 작성
	public int mqInsert(Mqna mqna);
	// Q&A 게시판 수정
	public int mqUpdate(Map<String, Object> paramMap);
	// Q&A 게시판 삭제
	public int mqDelete(int mqNo);
}
