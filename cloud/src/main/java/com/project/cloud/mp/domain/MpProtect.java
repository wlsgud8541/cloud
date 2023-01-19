package com.project.cloud.mp.domain;

import java.sql.Timestamp;

public class MpProtect {
	private int mppNo;
	private int mppReadCnt;
	private int mmNo;
	private int rNum;
	private Timestamp mppRegDate;
	private Timestamp mppInfoDate;
	private String mppTitle;
	private String mppContent;
	private String mppLocalCode;
	private String mppStatusCode;
	private String mppPetType;
	private String mppAddFile;
	private String mppWriter;
	private String mppDelYn	;
	private String mppGen;
	private String mppLocalDetail;
	
	public MpProtect() {}
	
	public MpProtect(int mppNo, int mppReadCnt, int mmNo,int rNum, Timestamp mppRegDate, Timestamp mppInfoDate, String mppTitle,
			String mppContent,String mppLocalCode , String mppStatusCode,  String mppPetType, String mppAddFile, String mppWriter, String mppDelYn, String mppGen, String mppLocalDetail) {

			this.mppNo = mppNo;
			this.mppReadCnt = mppReadCnt;
			this.mmNo = mmNo;
			this.rNum = rNum;
			this.mppRegDate = mppRegDate;
			this.mppInfoDate = mppInfoDate;
			this.mppTitle = mppTitle;
			this.mppContent = mppContent;
			this.mppLocalCode = mppLocalCode;
			this.mppStatusCode = mppStatusCode;
			this.mppPetType = mppPetType;
			this.mppAddFile = mppAddFile;
			this.mppWriter = mppWriter;
			this.mppDelYn = mppDelYn;
			this.mppGen = mppGen;
			this.mppLocalDetail = mppLocalDetail;
	}

	public String getMppLocalDetail() {
		return mppLocalDetail;
	}

	public void setMppLocalDetail(String mppLocalDetail) {
		this.mppLocalDetail = mppLocalDetail;
	}

	public String getMppStatusCode() {
		return mppStatusCode;
	}

	public void setMppStatusCode(String mppStatusCode) {
		this.mppStatusCode = mppStatusCode;
	}

	public int getMppNo() {
		return mppNo;
	}

	public void setMppNo(int mppNo) {
		this.mppNo = mppNo;
	}

	public int getMppReadCnt() {
		return mppReadCnt;
	}

	public void setMppReadCnt(int mppReadCnt) {
		this.mppReadCnt = mppReadCnt;
	}

	public int getMmNo() {
		return mmNo;
	}

	public void setMmNo(int mmNo) {
		this.mmNo = mmNo;
	}
	
	public int getrNum() {
		return rNum;
	}
	
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public Timestamp getMppRegDate() {
		return mppRegDate;
	}

	public void setMppRegDate(Timestamp mppRegDate) {
		this.mppRegDate = mppRegDate;
	}

	public Timestamp getMppInfoDate() {
		return mppInfoDate;
	}

	public void setMppInfoDate(Timestamp mppInfoDate) {
		this.mppInfoDate = mppInfoDate;
	}

	public String getMppTitle() {
		return mppTitle;
	}

	public void setMppTitle(String mppTitle) {
		this.mppTitle = mppTitle;
	}

	public String getMppContent() {
		return mppContent;
	}

	public void setMppContent(String mppContent) {
		this.mppContent = mppContent;
	}
	
	public String getMppLocalCode() {
		return mppLocalCode;
	}
	
	public void setMppLocalCode(String mppLocalCode) {
		this.mppLocalCode = mppLocalCode;
	}

	public String getMppPetType() {
		return mppPetType;
	}

	public void setMppPetType(String mppPetType) {
		this.mppPetType = mppPetType;
	}

	public String getMppAddFile() {
		return mppAddFile;
	}

	public void setMppAddFile(String mppAddFile) {
		this.mppAddFile = mppAddFile;
	}

	public String getMppWriter() {
		return mppWriter;
	}

	public void setMppWriter(String mppWriter) {
		this.mppWriter = mppWriter;
	}

	public String getMppDelYn() {
		return mppDelYn;
	}

	public void setMppDelYn(String mppDelYn) {
		this.mppDelYn = mppDelYn;
	}

	public String getMppGen() {
		return mppGen;
	}

	public void setMppGen(String mppGen) {
		this.mppGen = mppGen;
	}
	
	
}
