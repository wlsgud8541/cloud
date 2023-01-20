package com.project.cloud.rt.domain;

public class RealTime {
	private int rthNo;
	private int rtpNo;
	private int mmNo;
	private String rthPlace;
	private String rthRegTime;
	private String rthRegDate;
	private String rthLatitude;
	private String rthLongitude;
	
	private String rtpPlace;
	private String rtpRegTime;
	private String rtpRegDate;
	private String rtpLatitude;
	private String rtpLongitude;

	
	public RealTime() {}


	public RealTime(int rthNo, int rtpNo, int mmNo, String rthPlace, String rthRegTime, String rthRegDate,
			String rthLatitude, String rthLongitude, String rtpPlace, String rtpRegTime, String rtpRegDate,
			String rtpLatitude, String rtpLongitude) {
			
			this.rthNo = rthNo;
			this.rtpNo = rtpNo;
			this.mmNo = mmNo;
			this.rthPlace = rthPlace;
			this.rthRegTime = rthRegTime;
			this.rthRegDate = rthRegDate;
			this.rthLatitude = rthLatitude;
			this.rthLongitude = rthLongitude;
			this.rtpPlace = rtpPlace;
			this.rtpRegTime = rtpRegTime;
			this.rtpRegDate = rtpRegDate;
			this.rtpLatitude = rtpLatitude;
			this.rtpLongitude = rtpLongitude;
	}


	public int getRthNo() {
		return rthNo;
	}


	public void setRthNo(int rthNo) {
		this.rthNo = rthNo;
	}


	public int getRtpNo() {
		return rtpNo;
	}


	public void setRtpNo(int rtpNo) {
		this.rtpNo = rtpNo;
	}


	public int getMmNo() {
		return mmNo;
	}


	public void setMmNo(int mmNo) {
		this.mmNo = mmNo;
	}


	public String getRthPlace() {
		return rthPlace;
	}


	public void setRthPlace(String rthPlace) {
		this.rthPlace = rthPlace;
	}


	public String getRthRegTime() {
		return rthRegTime;
	}


	public void setRthRegTime(String rthRegTime) {
		this.rthRegTime = rthRegTime;
	}


	public String getRthRegDate() {
		return rthRegDate;
	}


	public void setRthRegDate(String rthRegDate) {
		this.rthRegDate = rthRegDate;
	}


	public String getRthLatitude() {
		return rthLatitude;
	}


	public void setRthLatitude(String rthLatitude) {
		this.rthLatitude = rthLatitude;
	}


	public String getRthLongitude() {
		return rthLongitude;
	}


	public void setRthLongitude(String rthLongitude) {
		this.rthLongitude = rthLongitude;
	}


	public String getRtpPlace() {
		return rtpPlace;
	}


	public void setRtpPlace(String rtpPlace) {
		this.rtpPlace = rtpPlace;
	}


	public String getRtpRegTime() {
		return rtpRegTime;
	}


	public void setRtpRegTime(String rtpRegTime) {
		this.rtpRegTime = rtpRegTime;
	}


	public String getRtpRegDate() {
		return rtpRegDate;
	}


	public void setRtpRegDate(String rtpRegDate) {
		this.rtpRegDate = rtpRegDate;
	}


	public String getRtpLatitude() {
		return rtpLatitude;
	}


	public void setRtpLatitude(String rtpLatitude) {
		this.rtpLatitude = rtpLatitude;
	}


	public String getRtpLongitude() {
		return rtpLongitude;
	}


	public void setRtpLongitude(String rtpLongitude) {
		this.rtpLongitude = rtpLongitude;
	}
	
	
}
