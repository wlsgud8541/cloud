package com.project.cloud.cs.domain;

import java.sql.Timestamp;

public class Mrequest {
	private int mreNo;
	private int mreReadCnt;
	private int mreRecoCnt;
	private int mmNo;
	private Timestamp mreRegDate;
	private String mreTitle;
	private String mreContent;
	private String mreAddFile;
	private String mreWriter	;
	private String mreSecretYn	;
	private String mreReplyCode;
	private String mreDelYn;
	private String tableType;
	public Mrequest() {}
	
	public Mrequest(int mreNo, int mreReadCnt, int mreRecoCnt, int mmNo, Timestamp mreRegDate, String mreTitle,
			String mreContent, String mreAddFile, String mreWriter, String mreSecretYn, String mreReplyCode,
			String mreDelYn, String tableType) {
			
			this.mreNo = mreNo;
			this.mreReadCnt = mreReadCnt;
			this.mreRecoCnt = mreRecoCnt;
			this.mmNo = mmNo;
			this.mreRegDate = mreRegDate;
			this.mreTitle = mreTitle;
			this.mreContent = mreContent;
			this.mreAddFile = mreAddFile;
			this.mreWriter = mreWriter;
			this.mreSecretYn = mreSecretYn;
			this.mreReplyCode = mreReplyCode;
			this.mreDelYn = mreDelYn;
			this.tableType = tableType;
	}

	public String getTableType() {
		return tableType;
	}

	public void setTableType(String tableType) {
		this.tableType = tableType;
	}

	public int getMreNo() {
		return mreNo;
	}

	public void setMreNo(int mreNo) {
		this.mreNo = mreNo;
	}

	public int getMreReadCnt() {
		return mreReadCnt;
	}

	public void setMreReadCnt(int mreReadCnt) {
		this.mreReadCnt = mreReadCnt;
	}

	public int getMreRecoCnt() {
		return mreRecoCnt;
	}

	public void setMreRecoCnt(int mreRecoCnt) {
		this.mreRecoCnt = mreRecoCnt;
	}

	public int getMmNo() {
		return mmNo;
	}

	public void setMmNo(int mmNo) {
		this.mmNo = mmNo;
	}

	public Timestamp getMreRegDate() {
		return mreRegDate;
	}

	public void setMreRegDate(Timestamp mreRegDate) {
		this.mreRegDate = mreRegDate;
	}

	public String getMreTitle() {
		return mreTitle;
	}

	public void setMreTitle(String mreTitle) {
		this.mreTitle = mreTitle;
	}

	public String getMreContent() {
		return mreContent;
	}

	public void setMreContent(String mreContent) {
		this.mreContent = mreContent;
	}

	public String getMreAddFile() {
		return mreAddFile;
	}

	public void setMreAddFile(String mreAddFile) {
		this.mreAddFile = mreAddFile;
	}

	public String getMreWriter() {
		return mreWriter;
	}

	public void setMreWriter(String mreWriter) {
		this.mreWriter = mreWriter;
	}

	public String getMreSecretYn() {
		return mreSecretYn;
	}

	public void setMreSecretYn(String mreSecretYn) {
		this.mreSecretYn = mreSecretYn;
	}

	public String getMreReplyCode() {
		return mreReplyCode;
	}

	public void setMreReplyCode(String mreReplyCode) {
		this.mreReplyCode = mreReplyCode;
	}

	public String getMreDelYn() {
		return mreDelYn;
	}

	public void setMreDelYn(String mreDelYn) {
		this.mreDelYn = mreDelYn;
	}
	
}
