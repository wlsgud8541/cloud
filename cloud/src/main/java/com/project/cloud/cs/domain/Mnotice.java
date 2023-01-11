package com.project.cloud.cs.domain;

import java.sql.Timestamp;

public class Mnotice {
	private int mnNo;
	private int mnReadCnt;
	private int mmNo;
	private int rNum;
	private Timestamp mnRegDate;
	private String mnTitle;
	private String mnContent;
	private String mnAddFile;
	private String mnWriter;
	private String mnFixTopYn;
	private String mnDelYn;
	
	public Mnotice() {}
	
	public Mnotice(int mnNo, int mnReadCnt, int mmNo, int rNum, Timestamp mnRegDate, String mnTitle, String mnContent,
			String mnAddFile, String mnWriter, String mnFixTopYn, String mnDelYn) {
	
			this.mnNo = mnNo;
			this.mnReadCnt = mnReadCnt;
			this.mmNo = mmNo;
			this.mnRegDate = mnRegDate;
			this.mnTitle = mnTitle;
			this.mnContent = mnContent;
			this.mnAddFile = mnAddFile;
			this.mnWriter = mnWriter;
			this.mnFixTopYn = mnFixTopYn;
			this.mnDelYn = mnDelYn;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public int getMnNo() {
		return mnNo;
	}

	public void setMnNo(int mnNo) {
		this.mnNo = mnNo;
	}

	public int getMnReadCnt() {
		return mnReadCnt;
	}

	public void setMnReadCnt(int mnReadCnt) {
		this.mnReadCnt = mnReadCnt;
	}

	public int getMmNo() {
		return mmNo;
	}

	public void setMmNo(int mmNo) {
		this.mmNo = mmNo;
	}

	public Timestamp getMnRegDate() {
		return mnRegDate;
	}

	public void setMnRegDate(Timestamp mnRegDate) {
		this.mnRegDate = mnRegDate;
	}

	public String getMnTitle() {
		return mnTitle;
	}

	public void setMnTitle(String mnTitle) {
		this.mnTitle = mnTitle;
	}

	public String getMnContent() {
		return mnContent;
	}

	public void setMnContent(String mnContent) {
		this.mnContent = mnContent;
	}

	public String getMnAddFile() {
		return mnAddFile;
	}

	public void setMnAddFile(String mnAddFile) {
		this.mnAddFile = mnAddFile;
	}

	public String getMnWriter() {
		return mnWriter;
	}

	public void setMnWriter(String mnWriter) {
		this.mnWriter = mnWriter;
	}

	public String getMnFixTopYn() {
		return mnFixTopYn;
	}

	public void setMnFixTopYn(String mnFixTopYn) {
		this.mnFixTopYn = mnFixTopYn;
	}

	public String getMnDelYn() {
		return mnDelYn;
	}

	public void setMnDelYn(String mnDelYn) {
		this.mnDelYn = mnDelYn;
	}
	
}
