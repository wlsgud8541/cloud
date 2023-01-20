package com.project.cloud.mh.dao;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.cloud.mh.domain.MhInfo;

@Repository
public class MhInfoDaoImpl implements MhInfoDao {

	@Autowired
	private SqlSessionTemplate sql;

	public void setSql(SqlSessionTemplate sql) {
		this.sql = sql; 
	}
	@Override
	public List<MhInfo> mhiSelectList(int startRow, int pageSize, String type,String keyword) {
		HashMap<String,Object> mhiMap = new HashMap<String,Object>();
		mhiMap.put("startRow", startRow);
		mhiMap.put("pageSize", pageSize);
		mhiMap.put("type", type);
		mhiMap.put("keyword", keyword);
		return sql.selectList("MhInfo.mhInfoSelect",mhiMap);
	}

	@Override
	public MhInfo mhiSelectDetail() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int mhiInsert(MhInfo mhInfo) {
		
		return sql.insert("MhInfo.mhInfoInsert",mhInfo);
	}

	@Override
	public int mhiUpdate() {
		
		return sql.delete("MhInfo.mhiDelete");
	}
	@Override
	public List<MhInfo> lastIndex() {
		
		return sql.selectList("MhInfo.lastIndex");
	}
	@Override
	public int mhinfoBackup() {
		
		return sql.insert("MhInfo.mhiBackup");
	}
	@Override
	public String mhiDay() {
		
		return sql.selectOne("MhInfo.updateday");
	}
	@Override
	public int mhiCount() {
		
		return sql.selectOne("MhInfo.mhiCount");
	}
	@Override
	public Map<String,Object> mhiScheduler(int pageCnt) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("pageCnt", pageCnt);
		return map;
	}
}
