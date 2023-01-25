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
	
	private String Code01;
	private String Code02;
	private String Code03;
	private String Code04;
	private String Code05;
	private String Code06;
	private String Code07;
	private String Code08;
	private String Code09;
	private String Code10;
	private String Code11;
	private String Code12;
	private String Code13;
	private String Code14;
	private String Code15;
	private String Code16;
	private String Code17;
	
	
	public Main() {}
	
	public Main(String tableType, int searchNo, String searchTitle, String searchContent, String searchWriter,
			String searchDelYn, Timestamp searchRegdate, String code01, String code02, String code03, String code04,
			String code05, String code06, String code07, String code08, String code09, String code10, String code11,
			String code12, String code13, String code14, String code15, String code16, String code17) {
			
			this.tableType = tableType;
			this.searchNo = searchNo;
			this.searchTitle = searchTitle;
			this.searchContent = searchContent;
			this.searchWriter = searchWriter;
			this.searchDelYn = searchDelYn;
			this.searchRegdate = searchRegdate;
			this.Code01 = code01;
			this.Code02 = code02;
			this.Code03 = code03;
			this.Code04 = code04;
			this.Code05 = code05;
			this.Code06 = code06;
			this.Code07 = code07;
			this.Code08 = code08;
			this.Code09 = code09;
			this.Code10 = code10;
			this.Code11 = code11;
			this.Code12 = code12;
			this.Code13 = code13;
			this.Code14 = code14;
			this.Code15 = code15;
			this.Code16 = code16;
			this.Code17 = code17;
	}

	public String getCode01() {
		return Code01;
	}

	public void setCode01(String code01) {
		Code01 = code01;
	}

	public String getCode02() {
		return Code02;
	}

	public void setCode02(String code02) {
		Code02 = code02;
	}

	public String getCode03() {
		return Code03;
	}

	public void setCode03(String code03) {
		Code03 = code03;
	}

	public String getCode04() {
		return Code04;
	}

	public void setCode04(String code04) {
		Code04 = code04;
	}

	public String getCode05() {
		return Code05;
	}

	public void setCode05(String code05) {
		Code05 = code05;
	}

	public String getCode06() {
		return Code06;
	}

	public void setCode06(String code06) {
		Code06 = code06;
	}

	public String getCode07() {
		return Code07;
	}

	public void setCode07(String code07) {
		Code07 = code07;
	}

	public String getCode08() {
		return Code08;
	}

	public void setCode08(String code08) {
		Code08 = code08;
	}

	public String getCode09() {
		return Code09;
	}

	public void setCode09(String code09) {
		Code09 = code09;
	}

	public String getCode10() {
		return Code10;
	}

	public void setCode10(String code10) {
		Code10 = code10;
	}

	public String getCode11() {
		return Code11;
	}

	public void setCode11(String code11) {
		Code11 = code11;
	}

	public String getCode12() {
		return Code12;
	}

	public void setCode12(String code12) {
		Code12 = code12;
	}

	public String getCode13() {
		return Code13;
	}

	public void setCode13(String code13) {
		Code13 = code13;
	}

	public String getCode14() {
		return Code14;
	}

	public void setCode14(String code14) {
		Code14 = code14;
	}

	public String getCode15() {
		return Code15;
	}

	public void setCode15(String code15) {
		Code15 = code15;
	}

	public String getCode16() {
		return Code16;
	}

	public void setCode16(String code16) {
		Code16 = code16;
	}

	public String getCode17() {
		return Code17;
	}

	public void setCode17(String code17) {
		Code17 = code17;
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
