package com.project.cloud.mp.domain;

import java.sql.Timestamp;

public class MpFind {
	private int mpfNo;
	private int mpfReadCnt;

	private int mmNo;
	private int rNum;
	private Timestamp mpfInfoDate;
	private Timestamp mpfRegDate;
	private String mpfTitle;
	private String mpfContent;
	private String mpfStatusCode;
	private String mpfLocalCode;
	private String mpfPetType;
	private String mpfAddFile;
	private String mpfWriter;
	private String mpfDelYn;
	private String mpfLocalDetail;
	
	public MpFind() {}
	
	public MpFind(int mpfNo, int mpfReadCnt, int mmNo,int rNum, Timestamp mpfInfoDate, Timestamp mpfRegDate, String mpfTitle,
			String mpfContent, String mpfStatusCode, String mpfLocalCode, String mpfPetType, String mpfAddFile,
			String mpfWriter, String mpfDelYn, String mpfLocalDetail) {

			this.mpfNo = mpfNo;
			this.mpfReadCnt = mpfReadCnt;
			this.mmNo = mmNo;
			this.rNum = rNum;
			this.mpfInfoDate = mpfInfoDate;
			this.mpfRegDate = mpfRegDate;
			this.mpfTitle = mpfTitle;
			this.mpfContent = mpfContent;
			this.mpfStatusCode = mpfStatusCode;
			this.mpfLocalCode = mpfLocalCode;
			this.mpfPetType = mpfPetType;
			this.mpfAddFile = mpfAddFile;
			this.mpfWriter = mpfWriter;
			this.mpfDelYn = mpfDelYn;
			this.mpfLocalDetail = mpfLocalDetail;
	}

	public String getMpfLocalDetail() {
		return mpfLocalDetail;
	}

	public void setMpfLocalDetail(String mpfLocalDetail) {
		this.mpfLocalDetail = mpfLocalDetail;
	}

	public int getMpfNo() {
		return mpfNo;
	}

	public void setMpfNo(int mpfNo) {
		this.mpfNo = mpfNo;
	}

	public int getMpfReadCnt() {
		return mpfReadCnt;
	}
	
	public int getrNum() {
		return rNum;
	}
	
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public void setMpfReadCnt(int mpfReadCnt) {
		this.mpfReadCnt = mpfReadCnt;
	}

	public int getMmNo() {
		return mmNo;
	}

	public void setMmNo(int mmNo) {
		this.mmNo = mmNo;
	}

	public Timestamp getMpfInfoDate() {
		return mpfInfoDate;
	}

	public void setMpfInfoDate(Timestamp mpfInfoDate) {
		this.mpfInfoDate = mpfInfoDate;
	}

	public Timestamp getMpfRegDate() {
		return mpfRegDate;
	}

	public void setMpfRegDate(Timestamp mpfRegDate) {
		this.mpfRegDate = mpfRegDate;
	}

	public String getMpfTitle() {
		return mpfTitle;
	}

	public void setMpfTitle(String mpfTitle) {
		this.mpfTitle = mpfTitle;
	}

	public String getMpfContent() {
		return mpfContent;
	}

	public void setMpfContent(String mpfContent) {
		this.mpfContent = mpfContent;
	}

	public String getMpfStatusCode() {
		return mpfStatusCode;
	}

	public void setMpfStatusCode(String mpfStatusCode) {
		this.mpfStatusCode = mpfStatusCode;
	}

	public String getMpfLocalCode() {
		return mpfLocalCode;
	}

	public void setMpfLocalCode(String mpfLocalCode) {
		this.mpfLocalCode = mpfLocalCode;
	}

	public String getMpfPetType() {
		return mpfPetType;
	}

	public void setMpfPetType(String mpfPetType) {
		this.mpfPetType = mpfPetType;
	}

	public String getMpfAddFile() {
		return mpfAddFile;
	}

	public void setMpfAddFile(String mpfAddFile) {
		this.mpfAddFile = mpfAddFile;
	}

	public String getMpfWriter() {
		return mpfWriter;
	}

	public void setMpfWriter(String mpfWriter) {
		this.mpfWriter = mpfWriter;
	}

	public String getMpfDelYn() {
		return mpfDelYn;
	}

	public void setMpfDelYn(String mpfDelYn) {
		this.mpfDelYn = mpfDelYn;
	}
	
	
}
