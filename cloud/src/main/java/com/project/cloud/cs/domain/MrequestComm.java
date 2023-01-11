package com.project.cloud.cs.domain;

import java.sql.Timestamp;

public class MrequestComm {
	private int mreComNo;
	private int mmNo;
	private int mreNo;
	private Timestamp mreComRegDate;
	private String mreComTitle;
	private String mreComContent;
	private String mreComWriter;
	private String mreComDelYn;
	private String mreComAddFile;

	public MrequestComm() {}
	
	public MrequestComm(int mreComNo, int mmNo, int mreNo, Timestamp mreComRegDate, String mreComTitle,
			String mreComContent, String mreComWriter, String mreComDelYn, String mreComAddFile) {
	
			this.mreComNo = mreComNo;
			this.mmNo = mmNo;
			this.mreNo = mreNo;
			this.mreComRegDate = mreComRegDate;
			this.mreComTitle = mreComTitle;
			this.mreComContent = mreComContent;
			this.mreComWriter = mreComWriter;
			this.mreComDelYn = mreComDelYn;
			this.mreComAddFile = mreComAddFile;
	}

	public int getMreComNo() {
		return mreComNo;
	}

	public void setMreComNo(int mreComNo) {
		this.mreComNo = mreComNo;
	}

	public int getMmNo() {
		return mmNo;
	}

	public void setMmNo(int mmNo) {
		this.mmNo = mmNo;
	}

	public int getMreNo() {
		return mreNo;
	}

	public void setMreNo(int mreNo) {
		this.mreNo = mreNo;
	}

	public Timestamp getMreComRegDate() {
		return mreComRegDate;
	}

	public void setMreComRegDate(Timestamp mreComRegDate) {
		this.mreComRegDate = mreComRegDate;
	}

	public String getMreComTitle() {
		return mreComTitle;
	}

	public void setMreComTitle(String mreComTitle) {
		this.mreComTitle = mreComTitle;
	}

	public String getMreComContent() {
		return mreComContent;
	}

	public void setMreComContent(String mreComContent) {
		this.mreComContent = mreComContent;
	}

	public String getMreComWriter() {
		return mreComWriter;
	}

	public void setMreComWriter(String mreComWriter) {
		this.mreComWriter = mreComWriter;
	}

	public String getMreComDelYn() {
		return mreComDelYn;
	}

	public void setMreComDelYn(String mreComDelYn) {
		this.mreComDelYn = mreComDelYn;
	}

	public String getMreComAddFile() {
		return mreComAddFile;
	}

	public void setMreComAddFile(String mreComAddFile) {
		this.mreComAddFile = mreComAddFile;
	}
	
}
