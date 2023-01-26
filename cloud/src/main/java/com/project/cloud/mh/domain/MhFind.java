package com.project.cloud.mh.domain;

import java.sql.Timestamp;

public class MhFind {
	private int mhfNo;
	private int mhfReadCnt;
	private int mmNo;
	private Timestamp mhfInfoDate;
	private Timestamp mhfRegDate;
	private String mhfTitle;
	private String mhfContent;
	private String mhfAddFile;
	private String mhfWriter	;
	private String mhfSecretYn	;
	private String mhfDelYn;
	private String mhfGen;
	private String tableType;
	private String mhfLocalCode;
	private String mhfLocalDetail;
	public MhFind() {}
	
	public MhFind(int mhfNo, int mhfReadCnt, int mmNo, Timestamp mhfInfoDate, Timestamp mhfRegDate, String mhfTitle,
			String mhfContent, String mhfAddFile, String mhfWriter, String mhfSecretYn, String mhfDelYn,
			String mhfGen, String tableType, String mhfLocalCode, String mhfLocalDetail) {

			this.mhfNo = mhfNo;
			this.mhfReadCnt = mhfReadCnt;
			this.mmNo = mmNo;
			this.mhfInfoDate = mhfInfoDate;
			this.mhfRegDate = mhfRegDate;
			this.mhfTitle = mhfTitle;
			this.mhfContent = mhfContent;
			this.mhfAddFile = mhfAddFile;
			this.mhfWriter = mhfWriter;
			this.mhfSecretYn = mhfSecretYn;
			this.mhfDelYn = mhfDelYn;
			this.mhfGen = mhfGen;
			this.tableType = tableType;
			this.mhfLocalCode = mhfLocalCode;
			this.mhfLocalDetail = mhfLocalDetail;
	}

	public String getMhfLocalDetail() {
		return mhfLocalDetail;
	}

	public void setMhfLocalDetail(String mhfLocalDetail) {
		this.mhfLocalDetail = mhfLocalDetail;
	}

	public String getmhfLocalCode() {
		return mhfLocalCode;
	}

	public void setmhfLocalCode(String mhfLocalCode) {
		this.mhfLocalCode = mhfLocalCode;
	}

	public String getTableType() {
		return tableType;
	}

	public void setTableType(String tableType) {
		this.tableType = tableType;
	}

	public int getMhfNo() {
		return mhfNo;
	}

	public void setMhfNo(int mhfNo) {
		this.mhfNo = mhfNo;
	}

	public int getMhfReadCnt() {
		return mhfReadCnt;
	}

	public void setMhfReadCnt(int mhfReadCnt) {
		this.mhfReadCnt = mhfReadCnt;
	}

	public int getMmNo() {
		return mmNo;
	}

	public void setMmNo(int mmNo) {
		this.mmNo = mmNo;
	}

	public Timestamp getMhfInfoDate() {
		return mhfInfoDate;
	}

	public void setMhfInfoDate(Timestamp mhfInfoDate) {
		this.mhfInfoDate = mhfInfoDate;
	}

	public Timestamp getMhfRegDate() {
		return mhfRegDate;
	}

	public void setMhfRegDate(Timestamp mhfRegDate) {
		this.mhfRegDate = mhfRegDate;
	}

	public String getMhfTitle() {
		return mhfTitle;
	}

	public void setMhfTitle(String mhfTitle) {
		this.mhfTitle = mhfTitle;
	}

	public String getMhfContent() {
		return mhfContent;
	}

	public void setMhfContent(String mhfContent) {
		this.mhfContent = mhfContent;
	}

	public String getMhfAddFile() {
		return mhfAddFile;
	}

	public void setMhfAddFile(String mhfAddFile) {
		this.mhfAddFile = mhfAddFile;
	}

	public String getMhfWriter() {
		return mhfWriter;
	}

	public void setMhfWriter(String mhfWriter) {
		this.mhfWriter = mhfWriter;
	}

	public String getMhfSecretYn() {
		return mhfSecretYn;
	}

	public void setMhfSecretYn(String mhfSecretYn) {
		this.mhfSecretYn = mhfSecretYn;
	}

	public String getMhfDelYn() {
		return mhfDelYn;
	}

	public void setMhfDelYn(String mhfDelYn) {
		this.mhfDelYn = mhfDelYn;
	}

	public String getmhfGen() {
		return mhfGen;
	}

	public void setmhfGen(String mhfGen) {
		this.mhfGen = mhfGen;
	}
	
	
	
}
