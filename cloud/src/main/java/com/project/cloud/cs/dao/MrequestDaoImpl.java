package com.project.cloud.cs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.cloud.cs.domain.Mrequest;

@Repository
public class MrequestDaoImpl implements MrequestDao{

	@Autowired
	private SqlSessionTemplate sql;

	// 건의게시판 리스트
	@Override
	public List<Mrequest> mrSelectList(int startRow, int pageSize, String type, String keyword) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("startRow", startRow);
		params.put("pageSize", pageSize);
		params.put("type", type);
		params.put("keyword", keyword);
		
		return sql.selectList("Mrequest.mrSelectList",params);
	}
	
	// 건의게시판 전체 게시글 수 반환 메서드
	@Override
	public int getMrSelectCnt(String type, String keyword) {
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("type", type);
		params.put("keyword", keyword);
		
		return sql.selectOne("Mrequest.getMrSelectCnt");
	}
	
	@Override
	public Mrequest mrSelectDetail(int mreNo) {
		return sql.selectOne("Mrequest.mrSelectDetail", mreNo);
	}

	@Override
	public int mrInsert(Mrequest mrequest) {
		return sql.insert("Mrequest.mrInsert", mrequest);
	}

	@Override
	public int mrUpdate(Mrequest mrequest) {
		return sql.update("Mrequest.mrUpdate",mrequest);
	}
	
	@Override
	public int mrDelete(int mreNo) {
		return sql.delete("Mrequest.mrDelete",mreNo);
	}
	
	// 답변코드 변경 메서드
	@Override
	public int mrUpdateReplyCode(int mreNo) {
		return sql.update("Mrequest.mrUpdateReplyCode",mreNo);
	}
	// 답글코드 삭제 메서드
	@Override
	public int mrDelReplyCode(int mreNo) {
		return sql.update("Mrequest.mrDelReplyCode",mreNo);
	}
	
	// 추천 업데이트 메서드
	@Override
	public void mrUpdateRecommend(int mreNo, int mreRecoCnt) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("mreNo", mreNo);
		params.put("mreRecoCnt", mreRecoCnt);
		sql.update("Mrequest.mrUpdateRecommend",params);
	}
	// 추천 가져오는 메서드
	@Override
	public Mrequest getMrRecommend(int mreNo) {
		return sql.selectOne("Mrequest.getMrRecommend",mreNo);
	}

	@Override
	public int mrUpdateReadCnt(int mreNo) {
		return sql.update("Mrequest.mrUpdateReadCnt",mreNo);
	}
	
}
