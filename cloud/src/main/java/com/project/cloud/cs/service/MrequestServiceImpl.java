package com.project.cloud.cs.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cloud.cs.dao.MrequestDao;
import com.project.cloud.cs.domain.Mrequest;

@Service
public class MrequestServiceImpl implements MrequestService {
	@Autowired
	private MrequestDao mrequestDao;
	
	public void setMrequestDao(MrequestDao mrequestDao) {
		this.mrequestDao = mrequestDao;
	}

	@Override
	public List<Mrequest> mrSelectList(int startRow, int pageSize, String type, String keyword) {
		return mrequestDao.mrSelectList(startRow, pageSize,type,keyword);
	}

	// 건의게시판 전체 글 수 조회
	@Override
	public int getMrSelectCnt(String type, String keyword) {
		return mrequestDao.getMrSelectCnt(type,keyword);
	}
	
	@Override
	public Mrequest mrSelectDetail(int mreNo) {
		return mrequestDao.mrSelectDetail(mreNo);
	}

	@Override
	public int mrInsert(Mrequest mrequest) {
		return mrequestDao.mrInsert(mrequest);
	}

	@Override
	public int mrUpdate(Mrequest mrequest) {
		return mrequestDao.mrUpdate(mrequest);
	}

	@Override
	public int mrDelete(int mreNo) {
		return mrequestDao.mrDelete(mreNo);
	}
	
	// 답변코드 변경 메서드
	@Override
	public int mrUpdateReplyCode(int mreNo) {
		return mrequestDao.mrUpdateReplyCode(mreNo);
	}
	// 답변 코드 삭제
	@Override
	public int mrDelReplyCode(int mreNo) {
		return mrequestDao.mrDelReplyCode(mreNo);
	}

	//추천 정보 업데이트, 갱신된 추천정보 가져오는 메서드
	@Override
	public Map<String, Integer> mreRecoCnt(int mreNo, int mreRecoCnt) {
		
		mrequestDao.mrUpdateRecommend(mreNo, mreRecoCnt);
		Mrequest mrequest = mrequestDao.getMrRecommend(mreNo);
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("mreRecoCnt", mrequest.getMreRecoCnt());
		return map;
	}
	
	//건의게시판 조회수 업데이트
	@Override
	public int mreUpdateReadCnt(int mreNo) {
		return mrequestDao.mrUpdateReadCnt(mreNo);
	}


}
