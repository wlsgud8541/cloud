package com.project.cloud.gm.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.cloud.gm.service.GlobalMethodService;

@Controller
public class GlobalMethodController {

	// 공통 메소드 서비스
	@Autowired
	private GlobalMethodService gms;
	
	@Autowired
	private SqlSessionTemplate sql;
	
	private Logger logger = LoggerFactory.getLogger(GlobalMethodController.class);
	
	// 파일 다운로드 기능
	@RequestMapping("/fileDownload")
	public void fileDownload(HttpServletRequest request, HttpServletResponse response) throws Exception {
		gms.fileDownload(request, response);
	}
	
	@RequestMapping("todayTime")
	
	public String todayTimeStamp() {
		return gms.todayTimeStamp();
	}
	
	@RequestMapping("jpReport")
	public void printTest(HttpSession session, HttpServletRequest request, HttpServletResponse response
						  ,@RequestParam(required = false) Map<String, Object> jpReportMap) {
		
			
		gms.jpReport(session, request, response, jpReportMap);
		
	}
	
}
