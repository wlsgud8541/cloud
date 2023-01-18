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
	
}
