package com.project.cloud.gm.controller;

import java.sql.DriverManager;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.cloud.gm.service.GlobalMethodService;
import com.project.cloud.mh.domain.MhReport;

import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;

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
	
	@RequestMapping("printTest")
	public void printTest(HttpSession session, HttpServletRequest request, HttpServletResponse response
						  ,@RequestParam Map<String, Object> mhReportMap) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		String reportType = "";
		String code = mhReportMap.get("code").toString();
		String mhrName = mhReportMap.get("mhrName").toString();
		String mhrage = mhReportMap.get("mhrage").toString();
		String mhrGen = mhReportMap.get("mhrGen").toString();
		String mhrInfoDate = mhReportMap.get("mhrInfoDate").toString();
		String mhrHair = mhReportMap.get("mhrHair").toString();
		String mhrHairColor = mhReportMap.get("mhrHairColor").toString();
		String mhrWear = mhReportMap.get("mhrWear").toString();
		String mhrContent = mhReportMap.get("mhrContent").toString();
		String memberTell = mhReportMap.get("memberTell").toString();

		String characteristic = mhrHair + ", " + mhrHairColor + ", " + mhrWear;
		
		if (mhrGen.trim().equals("M")) {
			mhrGen = "남자";
		}
		if (mhrGen.trim().equals("F")) {
			mhrGen = "여자";
		}
		mhrInfoDate = mhrInfoDate.substring(0,10);
		
		if (code != null && code.equals("mh")) { // 실종자의 경우
			reportType = "mhPrint.jrxml";
			
			//벨류 세팅
			paramMap.put("name",mhrName); 
			paramMap.put("age",mhrage); 
			paramMap.put("gen",mhrGen); 
			paramMap.put("date",mhrInfoDate); 
			paramMap.put("characteristic",characteristic); 
			paramMap.put("content",mhrContent); 
			paramMap.put("tel",memberTell); 
			
		}else if(code != null && code.equals("mh")) { // 반려동물의 경우
			reportType = "";
			paramMap.put("AAA","가나다"); 
		}

		JasperReport jasperReport;
		
		try {
			//jrxml 파일 경로
			jasperReport = JasperCompileManager.compileReport(session.getServletContext().getRealPath("/WEB-INF/report/"+reportType));
			
			//디비정보
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, paramMap, DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","cloud","12345678")); 

			ServletOutputStream outputStream = response.getOutputStream();

			response.setHeader("Content-disposition", "attachment; filename=" + "전단지.pdf");

			JasperExportManager.exportReportToPdfStream(jasperPrint, outputStream);
		
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
	}
	
}
