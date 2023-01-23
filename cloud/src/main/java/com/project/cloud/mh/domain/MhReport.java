package com.project.cloud.mh.domain;

import java.sql.Timestamp;

public class MhReport {
	private int mhrNo;
	private int mhrReadCnt;
	private int mmNo;
	private Timestamp mhrRegDate;
	private Timestamp mhrInfoDate;
	private String mhrTitle;
	private String mhrContent;
	private String mhrName;
	private String mhrMage;
	private String mhrage;
	private String mhrNation;
	private String mhrIllCode;
	private String mhrStatusCode;
	private String mhrLocalCode;
	private String mhrAddFile;
	private String mhrWriter;
	private String mhrDelYn;
	private String mhrGen;
	private String mhrHeight;
	private String mhrWeight;
	private String mhrPhysical;
	private String mhrFace;
	private String mhrHairColor;
	private String mhrHair;
	private String mhrWear;
	
	
	private String memberTell;
	private String code;

	public MhReport() {}
	
	public MhReport(int mhrNo, int mhrReadCnt, int mmNo, Timestamp mhrRegDate, Timestamp mhrInfoDate, String mhrTitle,
			String mhrContent, String mhrName, String mhrMage, String mhrage, String mhrNation, String mhrIllCode,
			String mhrStatusCode, String mhrLocalCode, String mhrAddFile, String mhrWriter, String mhrDelYn,
			String mhrGen, String mhrHeight, String mhrWeight, String mhrPhysical, String mhrFace, String mhrHairColor,
			String mhrHair, String mhrWear, String memberTell, String code) {

			this.mhrNo = mhrNo;
			this.mhrReadCnt = mhrReadCnt;
			this.mmNo = mmNo;
			this.mhrRegDate = mhrRegDate;
			this.mhrInfoDate = mhrInfoDate;
			this.mhrTitle = mhrTitle;
			this.mhrContent = mhrContent;
			this.mhrName = mhrName;
			this.mhrMage = mhrMage;
			this.mhrage = mhrage;
			this.mhrNation = mhrNation;
			this.mhrIllCode = mhrIllCode;
			this.mhrStatusCode = mhrStatusCode;
			this.mhrLocalCode = mhrLocalCode;
			this.mhrAddFile = mhrAddFile;
			this.mhrWriter = mhrWriter;
			this.mhrDelYn = mhrDelYn;
			this.mhrGen = mhrGen;
			this.mhrHeight = mhrHeight;
			this.mhrWeight = mhrWeight;
			this.mhrPhysical = mhrPhysical;
			this.mhrFace = mhrFace;
			this.mhrHairColor = mhrHairColor;
			this.mhrHair = mhrHair;
			this.mhrWear = mhrWear;
			this.memberTell = memberTell;
			this.code = code;
	}
	
	
	public String getCode() {
		return code;
	}
	
	public void setCode(String code) {
		this.code = code;
	}
	
	public String getMemberTell() {
		
		return memberTell;
	}

	public void setMemberTell(String memberTell) {
		this.memberTell = memberTell;
	}

	public int getMhrNo() {
		return mhrNo;
	}

	public void setMhrNo(int mhrNo) {
		this.mhrNo = mhrNo;
	}

	public int getMhrReadCnt() {
		return mhrReadCnt;
	}

	public void setMhrReadCnt(int mhrReadCnt) {
		this.mhrReadCnt = mhrReadCnt;
	}

	public int getMmNo() {
		return mmNo;
	}

	public void setMmNo(int mmNo) {
		this.mmNo = mmNo;
	}

	public Timestamp getMhrRegDate() {
		return mhrRegDate;
	}

	public void setMhrRegDate(Timestamp mhrRegDate) {
		this.mhrRegDate = mhrRegDate;
	}

	public Timestamp getMhrInfoDate() {
		return mhrInfoDate;
	}

	public void setMhrInfoDate(Timestamp mhrInfoDate) {
		this.mhrInfoDate = mhrInfoDate;
	}

	public String getMhrTitle() {
		return mhrTitle;
	}

	public void setMhrTitle(String mhrTitle) {
		this.mhrTitle = mhrTitle;
	}

	public String getMhrContent() {
		return mhrContent;
	}

	public void setMhrContent(String mhrContent) {
		this.mhrContent = mhrContent;
	}

	public String getMhrName() {
		return mhrName;
	}

	public void setMhrName(String mhrName) {
		this.mhrName = mhrName;
	}

	public String getMhrMage() {
		return mhrMage;
	}

	public void setMhrMage(String mhrMage) {
		this.mhrMage = mhrMage;
	}

	public String getMhrage() {
		return mhrage;
	}

	public void setMhrage(String mhrage) {
		this.mhrage = mhrage;
	}

	public String getMhrNation() {
		return mhrNation;
	}

	public void setMhrNation(String mhrNation) {
		this.mhrNation = mhrNation;
	}

	public String getMhrIllCode() {
		return mhrIllCode;
	}

	public void setMhrIllCode(String mhrIllCode) {
		this.mhrIllCode = mhrIllCode;
	}

	public String getMhrStatusCode() {
		return mhrStatusCode;
	}

	public void setMhrStatusCode(String mhrStatusCode) {
		this.mhrStatusCode = mhrStatusCode;
	}

	public String getMhrLocalCode() {
		return mhrLocalCode;
	}

	public void setMhrLocalCode(String mhrLocalCode) {
		this.mhrLocalCode = mhrLocalCode;
	}

	public String getMhrAddFile() {
		return mhrAddFile;
	}

	public void setMhrAddFile(String mhrAddFile) {
		this.mhrAddFile = mhrAddFile;
	}

	public String getMhrWriter() {
		return mhrWriter;
	}

	public void setMhrWriter(String mhrWriter) {
		this.mhrWriter = mhrWriter;
	}

	public String getMhrDelYn() {
		return mhrDelYn;
	}

	public void setMhrDelYn(String mhrDelYn) {
		this.mhrDelYn = mhrDelYn;
	}

	public String getMhrGen() {
		return mhrGen;
	}

	public void setMhrGen(String mhrGen) {
		this.mhrGen = mhrGen;
	}

	public String getMhrHeight() {
		return mhrHeight;
	}

	public void setMhrHeight(String mhrHeight) {
		this.mhrHeight = mhrHeight;
	}

	public String getMhrWeight() {
		return mhrWeight;
	}

	public void setMhrWeight(String mhrWeight) {
		this.mhrWeight = mhrWeight;
	}

	public String getMhrPhysical() {
		return mhrPhysical;
	}

	public void setMhrPhysical(String mhrPhysical) {
		this.mhrPhysical = mhrPhysical;
	}

	public String getMhrFace() {
		return mhrFace;
	}

	public void setMhrFace(String mhrFace) {
		this.mhrFace = mhrFace;
	}

	public String getMhrHairColor() {
		return mhrHairColor;
	}

	public void setMhrHairColor(String mhrHairColor) {
		this.mhrHairColor = mhrHairColor;
	}

	public String getMhrHair() {
		return mhrHair;
	}

	public void setMhrHair(String mhrHair) {
		this.mhrHair = mhrHair;
	}

	public String getMhrWear() {
		return mhrWear;
	}

	public void setMhrWear(String mhrWear) {
		this.mhrWear = mhrWear;
	}
	
	
	
}
