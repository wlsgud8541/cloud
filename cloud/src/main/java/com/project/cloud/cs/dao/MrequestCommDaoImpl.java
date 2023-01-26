package com.project.cloud.cs.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.cloud.cs.domain.MrequestComm;

@Repository
public class MrequestCommDaoImpl implements MrequestCommDao {

	@Autowired
	private SqlSessionTemplate sql;
	/*
	@Override
	public List<MrequestComm> mrcSelectList(int mreComNo) {
		return sql.selectList("MrequestComm.mrcSelectList");
	}
	*/
	@Override
	public MrequestComm mrcSelectDetail(int mreNo) {
		return sql.selectOne("MrequestComm.mrcSelectDetail",mreNo);
	}
	
	@Override
	public int mrcInsert(MrequestComm mrequestComm) {
		return sql.insert("MrequestComm.mrcInsert", mrequestComm);
	}
   
	@Override
	public int mrcUpdate(MrequestComm mrequestComm) {
		return sql.update("MrequestComm.mrcUpdate",mrequestComm);
	}

	@Override
	public int mrcDelete(int mreComNo) {
		return sql.delete("MrequestComm.mrcDelete",mreComNo);
	}


}

