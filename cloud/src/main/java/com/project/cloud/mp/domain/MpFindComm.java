package com.project.cloud.mp.domain;

import java.sql.Timestamp;

public class MpFindComm {
	private int mpfComNo;
	private int mmNo;
	private int mpfNo;
	private Timestamp mpfComRegDate;
	private String mpfComContent;
	private String mpfComWriter;
	private String mpfComDelYn;
	
	public MpFindComm() {}
	
	public MpFindComm(int mpfComNo, int mmNo, int mpfNo, Timestamp mpfComRegDate, String mpfComContent,
			String mpfComWriter, String mpfComDelYn) {

			this.mpfComNo = mpfComNo;
			this.mmNo = mmNo;
			this.mpfNo = mpfNo;
			this.mpfComRegDate = mpfComRegDate;
			this.mpfComContent = mpfComContent;
			this.mpfComWriter = mpfComWriter;
			this.mpfComDelYn = mpfComDelYn;
	}

	public int getMpfComNo() {
		return mpfComNo;
	}

	public void setMpfComNo(int mpfComNo) {
		this.mpfComNo = mpfComNo;
	}

	public int getMmNo() {
		return mmNo;
	}

	public void setMmNo(int mmNo) {
		this.mmNo = mmNo;
	}

	public int getMpfNo() {
		return mpfNo;
	}

	public void setMpfNo(int mpfNo) {
		this.mpfNo = mpfNo;
	}

	public Timestamp getMpfComRegDate() {
		return mpfComRegDate;
	}

	public void setMpfComRegDate(Timestamp mpfComRegDate) {
		this.mpfComRegDate = mpfComRegDate;
	}

	public String getMpfComContent() {
		return mpfComContent;
	}

	public void setMpfComContent(String mpfComContent) {
		this.mpfComContent = mpfComContent;
	}

	public String getMpfComWriter() {
		return mpfComWriter;
	}

	public void setMpfComWriter(String mpfComWriter) {
		this.mpfComWriter = mpfComWriter;
	}

	public String getMpfComDelYn() {
		return mpfComDelYn;
	}

	public void setMpfComDelYn(String mpfComDelYn) {
		this.mpfComDelYn = mpfComDelYn;
	}
	
	
}
