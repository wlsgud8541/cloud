package com.project.cloud.gm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.cloud.gm.service.GlobalMethodService;

@Controller
public class GlobalMethodController {

	// 공통 메소드 서비스
	@Autowired
	private GlobalMethodService gms;
	
	// 파일 다운로드 기능
	@RequestMapping("/fileDownload")
	public void fileDownload(HttpServletRequest request, HttpServletResponse response) throws Exception {
		gms.fileDownload(request, response);
	}
	
	@RequestMapping("todayTime")
	public String todayTimeStamp() {
		return gms.todayTimeStamp();
	}
	
}
