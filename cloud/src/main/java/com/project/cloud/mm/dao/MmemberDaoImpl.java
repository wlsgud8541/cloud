package com.project.cloud.mm.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.cloud.mm.domain.Mmember;

@Repository
public class MmemberDaoImpl implements MmemberDao{

	@Autowired
	private SqlSessionTemplate sql;

	@Override
	public String mmSelectLoginCheck(String mmId) {
		return sql.selectOne("Mmember.mmSelectLoginCheck", mmId);
	}

	@Override
	public Mmember mmSelectUserInfo(String mmId) {
		return sql.selectOne("Mmember.mmSelectUserInfo", mmId);
	}
	
	@Override
	public int idCheck(String mmId) {
		return sql.selectOne("Mmember.idCheck", mmId);
	}
	
	@Override
	public int mmInsertJoin(Mmember member) {
		return sql.insert("Mmember.mmInsertJoin", member);
	}

	@Override
	public int mmInsertKakaoJoin(Mmember member) {
		return sql.insert("Mmember.mmInsertKakaoJoin", member);
	}

	@Override
	public int mmInsertNaverJoin(Mmember member) {
		return sql.insert("Mmember.mmInsertNaverJoin", member);
	}

	@Override
	public Mmember mmSelectMyPage(String mmNo) {
		return sql.selectOne("Mmember.mmSelectMyPage", mmNo);
	}

	@Override
	public int mmChangePassProc(Mmember member) {
		return sql.update("Mmember.mmChangePassProc", member);
	}
	
	@Override
	public int memberDisabled(String mmNo) {
		int result = 0;
		/*
		sql.delete("Mmember.memberContentDelete_1",mmNo);
		sql.delete("Mmember.memberContentDelete_2",mmNo);
		sql.delete("Mmember.memberContentDelete_3",mmNo);
		sql.delete("Mmember.memberContentDelete_4",mmNo);
		sql.delete("Mmember.memberContentDelete_5",mmNo);
		sql.delete("Mmember.memberContentDelete_6",mmNo);
		sql.delete("Mmember.memberContentDelete_7",mmNo);
		sql.delete("Mmember.memberContentDelete_8",mmNo);
		sql.delete("Mmember.memberContentDelete_9",mmNo);
		sql.delete("Mmember.memberContentDelete_10",mmNo);
		sql.delete("Mmember.memberContentDelete_11",mmNo);
		sql.delete("Mmember.memberContentDelete_12",mmNo);
		sql.delete("Mmember.memberContentDelete_13",mmNo);
		*/
		result = sql.update("Mmember.memberDisabled", mmNo);
		
		return result;
	}

	@Override
	public List<Mmember> mmSelectWriterInfo(String mmNo, int startRow, int pageSize) {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("mmNo", mmNo);
		paramMap.put("startRow", startRow);
		paramMap.put("pageSize", pageSize);
		return sql.selectList("Mmember.mmSelectWriterInfo", paramMap);
	}

	@Override
	public int mmSelectWriterInfoCnt(String mmNo) {
		return sql.selectOne("Mmember.mmSelectWriterInfoCnt", mmNo);
	}
	
	@Override
	public Mmember kakaoUserLogin(String kakaoUserId) {
		return sql.selectOne("Mmember.kakaoUserLogin", kakaoUserId);
	}
	
	@Override
	public Mmember naverUserLogin(String naverUserId) {
		return sql.selectOne("Mmember.naverUserLogin", naverUserId);
	}
	
	@Override
	public String idSearch(String mmEmail){
		return sql.selectOne("Mmember.idSearch", mmEmail);
	}

	@Override
	public int idSearch(Mmember member){
		return sql.selectOne("Mmember.idSearchForPass", member);
	}
}
