package com.project.cloud.main.domain;

import java.sql.Timestamp;

public class Main {
	private String tableType;
	private int searchNo;
	private String searchTitle;
	private String searchContent;
	private String searchWriter;
	private String searchDelYn;
	private Timestamp searchRegdate;
	
	public Main() {}
	public Main(int searchNo, String tableType, String searchTitle,
				String searchContent, String searchWriter, String searchDelYn,
				Timestamp searchRegdate) {
		this.searchContent = searchContent;
		this.searchDelYn = searchDelYn;
		this.searchNo = searchNo;
		this.searchRegdate = searchRegdate;
		this.searchTitle = searchTitle;
		this.searchWriter = searchWriter;
	}
	public String getTableType() {
		return tableType;
	}
	public void setTableType(String tableType) {
		this.tableType = tableType;
	}
	public int getSearchNo() {
		return searchNo;
	}
	public void setSearchNo(int searchNo) {
		this.searchNo = searchNo;
	}
	public String getSearchTitle() {
		return searchTitle;
	}
	public void setSearchTitle(String searchTitle) {
		this.searchTitle = searchTitle;
	}
	public String getSearchContent() {
		return searchContent;
	}
	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}
	public String getSearchWriter() {
		return searchWriter;
	}
	public void setSearchWriter(String searchWriter) {
		this.searchWriter = searchWriter;
	}
	public String getSearchDelYn() {
		return searchDelYn;
	}
	public void setSearchDelYn(String searchDelYn) {
		this.searchDelYn = searchDelYn;
	}
	public Timestamp getSearchRegdate() {
		return searchRegdate;
	}
	public void setSearchRegdate(Timestamp searchRegdate) {
		this.searchRegdate = searchRegdate;
	}
	
}
