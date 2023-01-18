package com.project.cloud.gm.service;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

public interface GlobalMethodService {
	// 파일 업로드 공통 기능
	public String addFile(HttpServletRequest request, MultipartFile multipartFile) throws IOException;
	
	// 파일 다운로드 공통기능
	public void fileDownload(HttpServletRequest request, HttpServletResponse response) throws IOException;
	
	// 페이징 처리
	public Map<String, Object> pageList(int listCount, int pageSize, int pageGroup, int pageNum, String type, String keyWord);
	
	//현재날짜
	public String todayTimeStamp();
}
