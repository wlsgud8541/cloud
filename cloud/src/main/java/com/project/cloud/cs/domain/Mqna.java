package com.project.cloud.cs.domain;

import java.sql.Timestamp;

public class Mqna {
	private int mqNo;
	private Timestamp mqRegDate;
	private String mqTitle;
	private String mqContent;
	private String mqWriter;
	private String mqDelYn;
	private String tableType;
	public Mqna() {}
	
	public Mqna(int mqNo, Timestamp mqRegDate, String mqTitle, String mqContent, String mqWriter, String mqDelYn, String tableType) {
		this.mqNo = mqNo;
		this.mqRegDate = mqRegDate;
		this.mqTitle = mqTitle;
		this.mqContent = mqContent;
		this.mqWriter = mqWriter;
		this.mqDelYn = mqDelYn;
		this.tableType = tableType;
	}

	public String getTableType() {
		return tableType;
	}

	public void setTableType(String tableType) {
		this.tableType = tableType;
	}

	public int getMqNo() {
		return mqNo;
	}

	public void setMqNo(int mqNo) {
		this.mqNo = mqNo;
	}

	public Timestamp getMqRegDate() {
		return mqRegDate;
	}

	public void setMqRegDate(Timestamp mqRegDate) {
		this.mqRegDate = mqRegDate;
	}

	public String getMqTitle() {
		return mqTitle;
	}

	public void setMqTitle(String mqTitle) {
		this.mqTitle = mqTitle;
	}

	public String getMqContent() {
		return mqContent;
	}

	public void setMqContent(String mqContent) {
		this.mqContent = mqContent;
	}

	public String getMqWriter() {
		return mqWriter;
	}

	public void setMqWriter(String mqWriter) {
		this.mqWriter = mqWriter;
	}

	public String getMqDelYn() {
		return mqDelYn;
	}

	public void setMqDelYn(String mqDelYn) {
		this.mqDelYn = mqDelYn;
	}
	
	
}
