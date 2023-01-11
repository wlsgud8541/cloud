package com.project.cloud.gm.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

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
	
}
