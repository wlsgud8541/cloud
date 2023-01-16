package com.project.cloud.mm.domain;

import java.sql.Timestamp;

public class Mmember {
	private int mmNo;
	private Timestamp mmUseUserInfoEdate;
	private Timestamp mmJoinDate;
	private Timestamp mmSecedeDate;
	private String mmId;
	private String mmPass;
	private String mmName;
	private String mmBirth;
	private String mmGen;
	private String mmEmail;
	private String emailId;
	private String emailDomain;
	private String selectDomain;
	private String mmTel;
	private String tel1;
	private String tel2;
	private String tel3;
	private String mmAddr1;
	private String mmAddr2;
	private String mmUseUserInfoYn;
	private String mmActivateYn;
	private String mmIdConnKAKAO;
	private String mmIdConnGOOGLE;
	private String mmIdConnNaver;
	private String mmZipCode;

	// 카카오 회원 
	private String kakaoId;
	private String kakaoEmail;
	private String kakaoGender;
	
	// 네이버 회원
	private String naverId;
	private String naverGender;
	private String naverEmail;
	private String naverMobile;
	private String naverName;
	private String naverBirthyear;
	private String naverBirthday;
	
	
	public Mmember() {}
	
	

	public Mmember(int mmNo, Timestamp mmUseUserInfoEdate, Timestamp mmJoinDate, Timestamp mmSecedeDate, String mmId,
			String mmPass, String mmName, String mmBirth, String mmGen, String mmEmail, String emailId,
			String emailDomain, String selectDomain, String mmTel, String tel1, String tel2, String tel3,
			String mmAddr1, String mmAddr2, String mmUseUserInfoYn, String mmActivateYn, String mmIdConnKAKAO,
			String mmIdConnGOOGLE, String mmIdConnNaver, String mmZipCode, String kakaoId, String kakaoEmail,
			String kakaoGender, String naverId, String naverGender, String naverEmail, String naverMobile,
			String naverName, String naverBirthyear, String naverBirthday) {
			
			this.mmNo = mmNo;
			this.mmUseUserInfoEdate = mmUseUserInfoEdate;
			this.mmJoinDate = mmJoinDate;
			this.mmSecedeDate = mmSecedeDate;
			this.mmId = mmId;
			this.mmPass = mmPass;
			this.mmName = mmName;
			this.mmBirth = mmBirth;
			this.mmGen = mmGen;
			this.mmEmail = mmEmail;
			this.emailId = emailId;
			this.emailDomain = emailDomain;
			this.selectDomain = selectDomain;
			this.mmTel = mmTel;
			this.tel1 = tel1;
			this.tel2 = tel2;
			this.tel3 = tel3;
			this.mmAddr1 = mmAddr1;
			this.mmAddr2 = mmAddr2;
			this.mmUseUserInfoYn = mmUseUserInfoYn;
			this.mmActivateYn = mmActivateYn;
			this.mmIdConnKAKAO = mmIdConnKAKAO;
			this.mmIdConnGOOGLE = mmIdConnGOOGLE;
			this.mmIdConnNaver = mmIdConnNaver;
			this.mmZipCode = mmZipCode;
			this.kakaoId = kakaoId;
			this.kakaoEmail = kakaoEmail;
			this.kakaoGender = kakaoGender;
			this.naverId = naverId;
			this.naverGender = naverGender;
			this.naverEmail = naverEmail;
			this.naverMobile = naverMobile;
			this.naverName = naverName;
			this.naverBirthyear = naverBirthyear;
			this.naverBirthday = naverBirthday;
	}


	
	// 네이버 회원 getter, setter
	public String getNaverId() {
		return naverId;
	}
	
	public void setNaverId(String naverId) {
		this.naverId = naverId;
	}
	
	public String getNaverGender() {
		return naverGender;
	}
	
	public void setNaverGender(String naverGender) {
		this.naverGender = naverGender;
	}
	
	public String getNaverEmail() {
		return naverEmail;
	}
	
	public void setNaverEmail(String naverEmail) {
		this.naverEmail = naverEmail;
	}
	
	public String getNaverMobile() {
		return naverMobile;
	}
	
	public void setNaverMobile(String naverMobile) {
		this.naverMobile = naverMobile;
	}
	
	public String getNaverName() {
		return naverName;
	}
	
	public void setNaverName(String naverName) {
		this.naverName = naverName;
	}
	
	public String getNaverBirthyear() {
		return naverBirthyear;
	}
	
	public void setNaverBirthyear(String naverBirthyear) {
		this.naverBirthyear = naverBirthyear;
	}
	
	public String getNaverBirthday() {
		return naverBirthday;
	}
	
	public void setNaverBirthday(String naverBirthday) {
		this.naverBirthday = naverBirthday;
	}

	// 카카오 회원 getter, setter
	public String getKakaoId() {
		return kakaoId;
	}

	public void setKakaoId(String kakaoId) {
		this.kakaoId = kakaoId;
	}

	public String getKakaoEmail() {
		return kakaoEmail;
	}

	public void setKakaoEmail(String kakaoEmail) {
		this.kakaoEmail = kakaoEmail;
	}

	public String getKakaoGender() {
		return kakaoGender;
	}

	public void setKakaoGender(String kakaoGender) {
		this.kakaoGender = kakaoGender;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getEmailDomain() {
		return emailDomain;
	}

	public void setEmailDomain(String emailDomain) {
		this.emailDomain = emailDomain;
	}

	public String getSelectDomain() {
		return selectDomain;
	}

	public void setSelectDomain(String selectDomain) {
		this.selectDomain = selectDomain;
	}

	public String getTel1() {
		return tel1;
	}

	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}

	public String getTel2() {
		return tel2;
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

	public String getTel3() {
		return tel3;
	}

	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}

	public String getMmZipCode() {
		return mmZipCode;
	}

	public void setMmZipCode(String mmZipCode) {
		this.mmZipCode = mmZipCode;
	}

	public int getMmNo() {
		return mmNo;
	}

	public void setMmNo(int mmNo) {
		this.mmNo = mmNo;
	}

	public Timestamp getMmUseUserInfoEdate() {
		return mmUseUserInfoEdate;
	}

	public void setMmUseUserInfoEdate(Timestamp mmUseUserInfoEdate) {
		this.mmUseUserInfoEdate = mmUseUserInfoEdate;
	}

	public Timestamp getMmJoinDate() {
		return mmJoinDate;
	}

	public void setMmJoinDate(Timestamp mmJoinDate) {
		this.mmJoinDate = mmJoinDate;
	}

	public Timestamp getMmSecedeDate() {
		return mmSecedeDate;
	}

	public void setMmSecedeDate(Timestamp mmSecedeDate) {
		this.mmSecedeDate = mmSecedeDate;
	}

	public String getMmId() {
		return mmId;
	}

	public void setMmId(String mmId) {
		this.mmId = mmId;
	}

	public String getMmPass() {
		return mmPass;
	}

	public void setMmPass(String mmPass) {
		this.mmPass = mmPass;
	}

	public String getMmName() {
		return mmName;
	}

	public void setMmName(String mmName) {
		this.mmName = mmName;
	}

	public String getMmBirth() {
		return mmBirth;
	}

	public void setMmBirth(String mmBirth) {
		this.mmBirth = mmBirth;
	}

	public String getMmGen() {
		return mmGen;
	}

	public void setMmGen(String mmGen) {
		this.mmGen = mmGen;
	}

	public String getMmEmail() {
		return mmEmail;
	}

	public void setMmEmail(String mmEmail) {
		this.mmEmail = mmEmail;
	}

	public String getMmTel() {
		return mmTel;
	}

	public void setMmTel(String mmTel) {
		this.mmTel = mmTel;
	}

	public String getMmAddr1() {
		return mmAddr1;
	}

	public void setMmAddr1(String mmAddr1) {
		this.mmAddr1 = mmAddr1;
	}

	public String getMmAddr2() {
		return mmAddr2;
	}

	public void setMmAddr2(String mmAddr2) {
		this.mmAddr2 = mmAddr2;
	}

	public String getMmUseUserInfoYn() {
		return mmUseUserInfoYn;
	}

	public void setMmUseUserInfoYn(String mmUseUserInfoYn) {
		this.mmUseUserInfoYn = mmUseUserInfoYn;
	}

	public String getMmActivateYn() {
		return mmActivateYn;
	}

	public void setMmActivateYn(String mmActivateYn) {
		this.mmActivateYn = mmActivateYn;
	}

	public String getMmIdConnKAKAO() {
		return mmIdConnKAKAO;
	}

	public void setMmIdConnKAKAO(String mmIdConnKAKAO) {
		this.mmIdConnKAKAO = mmIdConnKAKAO;
	}

	public String getMmIdConnGOOGLE() {
		return mmIdConnGOOGLE;
	}

	public void setMmIdConnGOOGLE(String mmIdConnGOOGLE) {
		this.mmIdConnGOOGLE = mmIdConnGOOGLE;
	}

	public String getMmIdConnNaver() {
		return mmIdConnNaver;
	}

	public void setMmIdConnNaver(String mmIdConnNaver) {
		this.mmIdConnNaver = mmIdConnNaver;
	}
	
}
