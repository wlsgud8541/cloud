package com.project.cloud.mp.domain;

import java.sql.Timestamp;

public class MpReport {
	private int mprNo;
	private int mprReadCnt;
	private int mmNo;
	private int rNum;
	private Timestamp mprInfoDate;
	private Timestamp mprRegDate;
	private String mprTitle;
	private String mprContent;
	private String mprStatusCode;
	private String mprLocalCode;
	private String mprPetType;
	private String mprAddFile;
	private String mprWriter;
	private String mprDelYn;
	private String mprGen;
	private String mprLocalDetail;
	
	private String memberTell;
	private String code;
	private String tableType;
	
	public MpReport() {}
	
	public MpReport(int mprNo, int mprReadCnt, int mmNo, int rNum, Timestamp mprInfoDate, Timestamp mprRegDate, String mprTitle,
			String mprContent, String mprStatusCode, String mprLocalCode, String mprPetType, String mprAddFile,
			String mprWriter, String mprDelYn, String mprGen, String mprLocalDetail, String memberTell, String code, String tableType) {
		
			this.mprNo = mprNo;
			this.mprReadCnt = mprReadCnt;
			this.mmNo = mmNo;
			this.rNum = rNum;
			this.mprInfoDate = mprInfoDate;
			this.mprRegDate = mprRegDate;
			this.mprTitle = mprTitle;
			this.mprContent = mprContent;
			this.mprStatusCode = mprStatusCode;
			this.mprLocalCode = mprLocalCode;
			this.mprPetType = mprPetType;
			this.mprAddFile = mprAddFile;
			this.mprWriter = mprWriter;
			this.mprDelYn = mprDelYn;
			this.mprGen = mprGen;
			this.mprLocalDetail = mprLocalDetail;
			this.memberTell = memberTell;
			this.code = code;
			this.tableType = tableType;
	}

	public String getTableType() {
		return tableType;
	}

	public void setTableType(String tableType) {
		this.tableType = tableType;
	}

	public String getCode() {
		return code;
	}
	
	public void setCode(String code) {
		this.code = code;
	}
	
	public String getMemberTell() {
		
		return memberTell;
	}

	public void setMemberTell(String memberTell) {
		this.memberTell = memberTell;
	}
	
	public String getMprLocalDetail() {
		return mprLocalDetail;
	}

	public void setMprLocalDetail(String mprLocalDetail) {
		this.mprLocalDetail = mprLocalDetail;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public int getMprNo() {
		return mprNo;
	}

	public void setMprNo(int mprNo) {
		this.mprNo = mprNo;
	}

	public int getMprReadCnt() {
		return mprReadCnt;
	}

	public void setMprReadCnt(int mprReadCnt) {
		this.mprReadCnt = mprReadCnt;
	}

	public int getMmNo() {
		return mmNo;
	}

	public void setMmNo(int mmNo) {
		this.mmNo = mmNo;
	}

	public Timestamp getMprInfoDate() {
		return mprInfoDate;
	}

	public void setMprInfoDate(Timestamp mprInfoDate) {
		this.mprInfoDate = mprInfoDate;
	}

	public Timestamp getMprRegDate() {
		return mprRegDate;
	}

	public void setMprRegDate(Timestamp mprRegDate) {
		this.mprRegDate = mprRegDate;
	}

	public String getMprTitle() {
		return mprTitle;
	}

	public void setMprTitle(String mprTitle) {
		this.mprTitle = mprTitle;
	}

	public String getMprContent() {
		return mprContent;
	}

	public void setMprContent(String mprContent) {
		this.mprContent = mprContent;
	}

	public String getMprStatusCode() {
		return mprStatusCode;
	}

	public void setMprStatusCode(String mprStatusCode) {
		this.mprStatusCode = mprStatusCode;
	}

	public String getMprLocalCode() {
		return mprLocalCode;
	}

	public void setMprLocalCode(String mprLocalCode) {
		this.mprLocalCode = mprLocalCode;
	}

	public String getMprPetType() {
		return mprPetType;
	}

	public void setMprPetType(String mprPetType) {
		this.mprPetType = mprPetType;
	}

	public String getMprAddFile() {
		return mprAddFile;
	}

	public void setMprAddFile(String mprAddFile) {
		this.mprAddFile = mprAddFile;
	}

	public String getMprWriter() {
		return mprWriter;
	}

	public void setMprWriter(String mprWriter) {
		this.mprWriter = mprWriter;
	}

	public String getMprDelYn() {
		return mprDelYn;
	}

	public void setMprDelYn(String mprDelYn) {
		this.mprDelYn = mprDelYn;
	}

	public String getMprGen() {
		return mprGen;
	}

	public void setMprGen(String mprGen) {
		this.mprGen = mprGen;
	}
	
	
}
