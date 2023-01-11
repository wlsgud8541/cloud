package com.project.cloud.mh.domain;

import java.sql.Timestamp;

public class MhFindComm {
	private int mhfComNo;
	private int mmNo;
	private int mhfNo;
	private Timestamp mhfComRegDate;
	private String mhfComContent;
	private String mhfComWriter;
	private String mhfComDelYn;
	
	public MhFindComm() {}
	
	public MhFindComm(int mhfComNo, int mmNo, int mhfNo, Timestamp mhfComRegDate, String mhfComContent,
			String mhfComWriter, String mhfComDelYn) {

			this.mhfComNo = mhfComNo;
			this.mmNo = mmNo;
			this.mhfNo = mhfNo;
			this.mhfComRegDate = mhfComRegDate;
			this.mhfComContent = mhfComContent;
			this.mhfComWriter = mhfComWriter;
			this.mhfComDelYn = mhfComDelYn;
	}

	public int getMhfComNo() {
		return mhfComNo;
	}

	public void setMhfComNo(int mhfComNo) {
		this.mhfComNo = mhfComNo;
	}

	public int getMmNo() {
		return mmNo;
	}

	public void setMmNo(int mmNo) {
		this.mmNo = mmNo;
	}

	public int getMhfNo() {
		return mhfNo;
	}

	public void setMhfNo(int mhfNo) {
		this.mhfNo = mhfNo;
	}

	public Timestamp getMhfComRegDate() {
		return mhfComRegDate;
	}

	public void setMhfComRegDate(Timestamp mhfComRegDate) {
		this.mhfComRegDate = mhfComRegDate;
	}

	public String getMhfComContent() {
		return mhfComContent;
	}

	public void setMhfComContent(String mhfComContent) {
		this.mhfComContent = mhfComContent;
	}

	public String getMhfComWriter() {
		return mhfComWriter;
	}

	public void setMhfComWriter(String mhfComWriter) {
		this.mhfComWriter = mhfComWriter;
	}

	public String getMhfComDelYn() {
		return mhfComDelYn;
	}

	public void setMhfComDelYn(String mhfComDelYn) {
		this.mhfComDelYn = mhfComDelYn;
	}
	
	
}
