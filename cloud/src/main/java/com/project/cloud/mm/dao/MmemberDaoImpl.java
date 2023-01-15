package com.project.cloud.mm.dao;

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
	public Mmember mmSelectMyPage(String mmNo) {
		return sql.selectOne("Mmember.mmSelectMyPage", mmNo);
	}
	
	@Override
	public Mmember kakaoUserLogin(String kakaoUserId) {
		return sql.selectOne("Mmember.kakaoUserLogin", kakaoUserId);
	}
}
