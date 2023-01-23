package com.project.cloud.gm.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.sql.DriverManager;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;

@Service
public class GlobalMethodServiceImpl implements GlobalMethodService{

	// 파일 업로드 공통처리
	@Override
	public String addFile(HttpServletRequest request, MultipartFile multipartFile) throws IOException {
		
		System.out.println("originalName : " + multipartFile.getOriginalFilename());
		System.out.println("name : " + multipartFile.getName());

		if (!multipartFile.isEmpty()) {
			
			System.out.println("File upload start");
			
			String filePath = request.getServletContext().getRealPath("resources/upload/");
			UUID uid = UUID.randomUUID();
			String saveName = uid.toString() + "_" + multipartFile.getOriginalFilename();
			
			File file = new File(filePath, saveName);
			
			multipartFile.transferTo(file);
			
			return saveName;
		}
		
		return null;
	}

	// 파일 다운로드 공통 처리
	@Override
	public void fileDownload(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String fileName = request.getParameter("fileName");
		String filePath = request.getServletContext().getRealPath("resources/upload/");
		
		File file = new File(filePath, fileName);

		fileName = URLEncoder.encode(file.getName(), "UTF-8");
		
		response.setContentType("application/download; charset=UTF-8");
		response.setContentLength((int)file.length());
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"; ");
		response.setHeader("Content-Transfer-Encoding","binary");
		
		OutputStream outputStream = response.getOutputStream();
		FileInputStream fileInputStream = new FileInputStream(file);
		
		FileCopyUtils.copy(fileInputStream, outputStream);
		
		if (fileInputStream != null) {
			fileInputStream.close();
		}
		
		outputStream.flush();
		
	}

	@Override
	public Map<String , Object> pageList(int listCount, int pageSize, int pageGroup, int pageNum, String type, String keyWord) {
		
		Map<String , Object> modelMap = new HashMap<String, Object>();
		
		int currentPage = pageNum;
		// 현재페이지 시작 index
		int startRow = (currentPage - 1) * pageSize + 1;
		// 시작페이지
		int startPage = (currentPage / pageGroup) * pageGroup + 1 - (currentPage % pageGroup == 0 ? pageGroup : 0);
		// 종료페이지
		int endPage = startPage + pageGroup - 1;
		// 전체페이지
		int pageCount = listCount / pageGroup + (listCount % pageSize == 0 ? 0 : 1);
		
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		
		System.out.println("startRow : "+startRow);
		System.out.println("pageSize : "+pageSize);
		
		modelMap.put("startRow", startRow);
		modelMap.put("pageCount", pageCount);
		modelMap.put("startPage", startPage);
		modelMap.put("endPage", endPage);
		modelMap.put("currentPage", currentPage);
		
		return modelMap;
	
	}
	
	// 현재 날짜
	@Override
	public String todayTimeStamp() {
		LocalDate now = LocalDate.now();
		String nowDate = now+"";
		return nowDate;
	}

	@Override
	public void jpReport(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			Map<String, Object> jpReportMap) {

		Map<String, Object> paramMap = new HashMap<String, Object>();
		String filePath = request.getServletContext().getRealPath("resources/upload/");
		
		String reportType = "";

		String code = "";
		String mhrName = "";
		String mhrage = "";
		String mhrGen = "";
		String mhrInfoDate = "";
		String mhrHair = "";
		String mhrHairColor = "";
		String mhrWear = "";
		String mhrContent = "";
		String mhrAddFile = "";
		String memberTell = "";
		
		if (jpReportMap.get("code") != null) {
			code = jpReportMap.get("code").toString();
		}
		if (jpReportMap.get("memberTell") != null) {
			memberTell = jpReportMap.get("memberTell").toString();
		}

		
		// 실종자 관련 벨류 세팅
		if (jpReportMap.get("mhrName") != null) {
			mhrName = jpReportMap.get("mhrName").toString();
		}
		if (jpReportMap.get("mhrage") != null) {
			mhrage = jpReportMap.get("mhrage").toString();
		}
		if (jpReportMap.get("mhrGen") != null) {
			mhrGen = jpReportMap.get("mhrGen").toString();
		}
		if (jpReportMap.get("mhrInfoDate") != null) {
			mhrInfoDate = jpReportMap.get("mhrInfoDate").toString();
		}
		if (jpReportMap.get("mhrHair") != null) {
			mhrHair = jpReportMap.get("mhrHair").toString();
		}
		if (jpReportMap.get("mhrHairColor") != null) {
			mhrHairColor = jpReportMap.get("mhrHairColor").toString();
		}
		if (jpReportMap.get("mhrWear") != null) {
			mhrWear = jpReportMap.get("mhrWear").toString();
		}
		if (jpReportMap.get("mhrContent") != null) {
			mhrContent = jpReportMap.get("mhrContent").toString();
		}
		if (jpReportMap.get("mhrAddFile") != null) {
			mhrAddFile = jpReportMap.get("mhrAddFile").toString();
		}
		String characteristic = mhrHair + ", " + mhrHairColor + ", " + mhrWear;
		if (mhrGen != null && mhrGen.trim().equals("M")) {
			mhrGen = "남자";
		}
		if (mhrGen != null && mhrGen.trim().equals("F")) {
			mhrGen = "여자";
		}
		if (mhrInfoDate != null && !mhrInfoDate.equals("")) {
			mhrInfoDate = mhrInfoDate.substring(0,10);
		}
		if (mhrAddFile != null && mhrAddFile != "") {
			mhrAddFile = filePath + mhrAddFile;
		}
		
		
		// 실종 반려동물 관련 벨류 세팅
		String mprPetType = "";
		String mprGen = "";
		String mprLocalCode = "";
		String mprInfoDate = "";
		String mprContent = "";
		String mprAddFile = "";
		
		if (jpReportMap.get("mprPetType") != null) {
			mprPetType = jpReportMap.get("mprPetType").toString();
		}
		if (jpReportMap.get("mprGen") != null) {
			mprGen = jpReportMap.get("mprGen").toString();
		}
		if (jpReportMap.get("mprLocalCode") != null) {
			mprLocalCode = jpReportMap.get("mprLocalCode").toString();
		}
		if (jpReportMap.get("mprInfoDate") != null) {
			mprInfoDate = jpReportMap.get("mprInfoDate").toString();
		}
		if (jpReportMap.get("mprContent") != null) {
			mprContent = jpReportMap.get("mprContent").toString();
		}
		if (jpReportMap.get("mprAddFile") != null) {
			mprAddFile = jpReportMap.get("mprAddFile").toString();
		}
		
		if (mprPetType != null && mprPetType.equals("01")) {
			mprPetType = "강아지";
		}
		if (mprPetType != null && mprPetType.equals("02")) {
			mprPetType = "고양이";
		}
		if (mprPetType != null && mprPetType.equals("03")) {
			mprPetType = "기타";
		}
		
		if (mprLocalCode != null) {
			switch (mprLocalCode) {
				case "01": mprLocalCode = "서울"; break;
				case "02": mprLocalCode = "경기"; break;
				case "03": mprLocalCode = "인천"; break;
				case "04": mprLocalCode = "대전"; break;
				case "05": mprLocalCode = "광주"; break;
				case "06": mprLocalCode = "대구"; break;
				case "07": mprLocalCode = "울산"; break;
				case "08": mprLocalCode = "부산"; break;
				case "09": mprLocalCode = "세종"; break;
				case "10": mprLocalCode = "강원"; break;
				case "11": mprLocalCode = "충북"; break;
				case "12": mprLocalCode = "충남"; break;
				case "13": mprLocalCode = "전북"; break;
				case "14": mprLocalCode = "전남"; break;
				case "15": mprLocalCode = "경북"; break;
				case "16": mprLocalCode = "경남"; break;
				case "17": mprLocalCode = "제주"; break;
			}
		}
		
		if (mprGen != null && mprGen.trim().equals("M")) {
			mprGen = "수컷";
		}
		if (mprGen != null && mprGen.trim().equals("F")) {
			mprGen = "암컷";
		}
		if (mprInfoDate != null && !mprInfoDate.equals("")) {
			mprInfoDate = mprInfoDate.substring(0,10);
		}
		if (mprAddFile != null && mprAddFile != "") {
			mprAddFile = filePath + mprAddFile;
		}

		
		if (code != null && code.equals("mh")) { // 실종자의 경우
			reportType = "mhPrint.jrxml";
			
			//벨류 세팅
			paramMap.put("img",mhrAddFile); 
			paramMap.put("name",mhrName); 
			paramMap.put("age",mhrage); 
			paramMap.put("gen",mhrGen); 
			paramMap.put("date",mhrInfoDate); 
			paramMap.put("characteristic",characteristic); 
			paramMap.put("content",mhrContent); 
			paramMap.put("tel",memberTell); 
			
		}else if(code != null && code.equals("mp")) { // 반려동물의 경우
			
			reportType = "mpPrint.jrxml";
			paramMap.put("img",mprAddFile); 
			paramMap.put("mprPetType",mprPetType); 
			paramMap.put("mprGen",mprGen); 
			paramMap.put("mprLocalCode",mprLocalCode); 
			paramMap.put("mprInfoDate",mprInfoDate); 
			paramMap.put("mprContent",mprContent); 
			paramMap.put("tel",memberTell);  
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
