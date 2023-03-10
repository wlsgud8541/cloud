package com.project.cloud.mp.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.cloud.gm.service.GlobalMethodService;
import com.project.cloud.mp.domain.MpFind;
import com.project.cloud.mp.domain.MpFindComm;
import com.project.cloud.mp.domain.MpProtect;
import com.project.cloud.mp.domain.MpReport;
import com.project.cloud.mp.service.MpFindCommService;
import com.project.cloud.mp.service.MpFindService;
import com.project.cloud.mp.service.MpProtectService;
import com.project.cloud.mp.service.MpReportService;

@Controller
public class MpController {
	
	 private Logger logger= LoggerFactory.getLogger(this.getClass()); 
	
	// 페이징 처리 공통 메소드
	@Autowired
	private GlobalMethodService gms;
	
	
	@Autowired
	private MpFindCommService mpfCommService;
	
	/*
	 *		실종 반려동물 신고 컨트롤러
	 *		실종 반려동물 신고 컨트롤러
	 *		실종 반려동물 신고 컨트롤러
	 **/
	
	@Autowired
	private MpReportService mpReportService;
	
	@RequestMapping("/introduceSiteView")
	public String introduceSiteView() {
		
		return "/customerSupportView/introduceSupportView/introduceSiteView";
	}
	@RequestMapping("/relationSiteView")
	public String relationSiteView() {
		
		return "/customerSupportView/introduceSupportView/relationSiteView";
	}
	
	// 실종 반려동물 신고 리스트 조회
	@RequestMapping("/mprSelectList")
	public String mprSelectList(Model model,
				    @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
					@RequestParam(value = "mpGen",required = false, defaultValue = "") String mpGen, 
					@RequestParam(value = "mpType",required = false, defaultValue = "") String mpType, 
					@RequestParam(value = "mpKeyword",required = false, defaultValue = "") String mpKeyword,
					@RequestParam(value = "mpDate1",required = false, defaultValue = "") String mpDate1, 
					@RequestParam(value = "mpDate2",required = false, defaultValue = "") String mpDate2, 
					@RequestParam(value = "mpLocalCode",required = false, defaultValue = "") String mpLocalCode){
		
		int pageSize = 12; 
		int pageGroup = 10; 
		String type = "";
		String keyWord = "";
		int listCount = mpReportService.mprSelectListCount(mpGen, mpType, mpKeyword, mpDate1, mpDate2, mpLocalCode);
		
		logger.debug(listCount+"");
		
		Map<String , Object> mprModel = gms.pageList(listCount, pageSize, pageGroup, pageNum, type, keyWord);
		int startRow = (int)mprModel.get("startRow");
		List<MpReport> mprSelectList = mpReportService.mprSelectList(startRow, pageSize, mpGen, mpType, mpKeyword, mpDate1, mpDate2, mpLocalCode);
		
		mprModel.put("mprList", mprSelectList);
		mprModel.put("listCount", listCount);
		mprModel.put("pageGroup", pageGroup); 
		mprModel.put("mpGen", mpGen);
		mprModel.put("mpType", mpType);
		mprModel.put("mpKeyword", mpKeyword);
		mprModel.put("mpDate1", mpDate1);
		mprModel.put("mpDate2", mpDate2);
		mprModel.put("mpLocalCode", mpLocalCode);
		
		
		model.addAttribute("mprModel",mprModel);
		model.addAttribute("mprSelectList",mprSelectList);
		
		return "mp/mpReportView/mprSelectListView";
	}
	
	// 실종 반려동물 신고 리스트 상세화면 조회
	@RequestMapping("/mprSelectDetail")
	public String mprSelectDetail(Model model,int mprNo, int pageNum) {
		
		// readCount 증가 service method
		int result = mpReportService.mprUpdateReadCount(mprNo);
		System.out.println("readCount 조회결과 : " + result);
		System.out.println("pagenum:"+pageNum);
		MpReport mprDetail = mpReportService.mprSelectDetail(mprNo);
		model.addAttribute("mprDetail",mprDetail);
		model.addAttribute("pageNum",pageNum);
		System.out.println("pageNum:"+pageNum);
		return "mp/mpReportView/mprSelectDetailView";
	}
	
	// 실종 반려동물 신고 글쓰기 프로세스
	@RequestMapping("/mprInsertProcess")
	public String mprInsert(HttpServletRequest request, @RequestParam(value = "mprAddFile", required = false) MultipartFile multipartFile,
							int mmNo,String mprTitle, String mprContent, String mprWriter,String mprRegDate, String mprInfoDate,String mprStatusCode,String mprLocalCode,String mprPetType,String mprGen, String mprLocalDetail)throws IOException{

		
		String tempDate = mprInfoDate + " 00:00:00";
		Timestamp tDate = Timestamp.valueOf(tempDate);
		
		MpReport mpReport = new MpReport();
		mpReport.setMmNo(mmNo);
		mpReport.setMprWriter(mprWriter);
		mpReport.setMprTitle(mprTitle);
		mpReport.setMprContent(mprContent);
		mpReport.setMprInfoDate(tDate);
		mpReport.setMprStatusCode(mprStatusCode);
		mpReport.setMprLocalCode(mprLocalCode);
		mpReport.setMprPetType(mprPetType);
		mpReport.setMprGen(mprGen);
		mpReport.setMprLocalDetail(mprLocalDetail);
		
		//파일 업로드 공통 처리 메소드
		String fileName = gms.addFile(request, multipartFile);
		mpReport.setMprAddFile(fileName);
		int result = mpReportService.mprInsert(mpReport);
		
		System.out.println("데이터 insert 결과 : " + result);
		
		return "redirect:mprSelectList";
	}
	
	// 실종 반려동물 신고 디테일 수정화면
	@RequestMapping("/mprUpdate")
	public String mprUpdate(Model model,int mprNo, int pageNum) {
		MpReport mpModify = mpReportService.mprSelectDetail(mprNo);
		
		model.addAttribute("mpModify",mpModify);
		model.addAttribute("pageNum",pageNum);
		
		return "mp/mpReportView/mprModifyView";
	}
	
	// 실종 반려동물 신고 디테일 수정화면 프로세스
	@RequestMapping("mprUpdateProcess")
	public String mprUpdateProcess(HttpServletRequest request, @RequestParam(value = "mprAddFile", required = false) MultipartFile multipartFile,
									int mprNo,int mmNo,String mprTitle,String mprWriter,String mprContent,String mprInfoDate,String mprStatusCode,String mprLocalCode,String mprPetType,String mprGen, String mprLocalDetail, int pageNum)throws IOException {
		
		String tempDate = mprInfoDate + " 00:00:00";
		Timestamp tDate = Timestamp.valueOf(tempDate);
		
		MpReport mpReport = new MpReport();
		mpReport.setMprNo(mprNo);
		mpReport.setMmNo(mmNo);
		mpReport.setMprTitle(mprTitle);
		mpReport.setMprWriter(mprWriter);
		mpReport.setMprContent(mprContent);
		mpReport.setMprInfoDate(tDate);
		mpReport.setMprStatusCode(mprStatusCode);
		mpReport.setMprLocalCode(mprLocalCode);
		mpReport.setMprPetType(mprPetType);
		mpReport.setMprGen(mprGen);
		mpReport.setMprLocalDetail(mprLocalDetail);
		System.out.println("mprNo:"+mprNo);
		//파일 업로드 공통 처리 메소드
		String fileName = gms.addFile(request, multipartFile);
		mpReport.setMprAddFile(fileName);
		
		int result = mpReportService.mprUpdate(mpReport);
		
		System.out.println("데이터 update 결과 : " + result);
		
		return "redirect:mprSelectList?pageNum="+pageNum;
		
	}
	
	// 실종 반려동물 신고 삭제 프로세스
	@RequestMapping("/mprDeleteProcess")
	public String mprDeleteProcess(int mprNo,int pageNum) {
		System.out.println("mprNo : "+mprNo);
		
		int result = mpReportService.mprDelete(mprNo);
		
		System.out.println("데이터 delete 결과 : " + result);
		
		return "redirect:mprSelectList?pageNum="+pageNum;
	}
	
	
	/* 반려동물 목격 게시판 컨트롤러 */
	/* 반려동물 목격 게시판 컨트롤러 */
	/* 반려동물 목격 게시판 컨트롤러 */
	@Autowired
	private MpFindService mpFindService;
	
	
	/*
	 *		실종 반려동물 신고 컨트롤러
	 **/
	// 실종 반려동물 목격 리스트 조회
	@RequestMapping("/mpfSelectList")
	public String mpfSelectList(Model model,
			@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
			@RequestParam(value = "type", required = false, defaultValue = "null") String type,
			@RequestParam(value = "keyWord", required = false, defaultValue = "null") String keyWord) {
		
		logger.debug("keyWord : "+keyWord);
		
		int pageSize = 10; 
		int pageGroup = 10; 
		int listCount = mpFindService.mpfSelectListCount(type, keyWord);
		
		Map<String , Object> mpfModel = gms.pageList(listCount, pageSize, pageGroup, pageNum, type, keyWord);  
		int startRow = (int)mpfModel.get("startRow"); 
		List<MpFind> mpfSelectList = mpFindService.mpfSelectList(startRow, pageSize, type, keyWord);
		
		mpfModel.put("mpfList", mpfSelectList);
		mpfModel.put("listCount", listCount);
		mpfModel.put("pageGroup", pageGroup);
		mpfModel.put("keyWord", keyWord);
		mpfModel.put("type", type);
		
		model.addAttribute("mpfModel",mpfModel);
		model.addAttribute("mpfSelectList",mpfSelectList);
		
		return "mp/mpFindView/mpfSelectListView";
	}
	
	// 실종 반려동물 목격 리스트 상세화면 조회
	@RequestMapping("/mpfSelectDetail")
	public String mpfSelectDetail(Model model,int mpfNo, int pageNum) {
		
		List<MpFindComm> mpfCommList = mpfCommService.mpfcSelectList(mpfNo);
		model.addAttribute("mpfCommList",mpfCommList);
		
		// readCount 증가 service method
		int result = mpFindService.mpfUpdateReadCount(mpfNo);
		System.out.println("readCount 조회결과 : " + result);
		System.out.println("pagenum:"+pageNum);
		MpFind mpfDetail = mpFindService.mpfSelectDetail(mpfNo);
		model.addAttribute("mpfDetail",mpfDetail);
		model.addAttribute("pageNum",pageNum);
		System.out.println("pageNum:"+pageNum);
		return "mp/mpFindView/mpfSelectDetailView";
	}
	
	// 실종 반려동물 목격 글쓰기 프로세스
	@RequestMapping("/mpfInsertProcess")
	public String mpfInsert(HttpServletRequest request, @RequestParam(value = "mpfAddFile", required = false) MultipartFile multipartFile,
							int mmNo,String mpfTitle, String mpfContent, String mpfWriter,String mpfRegDate, String mpfInfoDate,String mpfLocalCode,String mpfPetType, String mpfLocalDetail)throws IOException{
		
		
		String tempDate = mpfInfoDate + " 00:00:00";
		Timestamp tDate = Timestamp.valueOf(tempDate);
		
		MpFind mpFind = new MpFind();
		mpFind.setMmNo(mmNo);
		mpFind.setMpfWriter(mpfWriter);
		mpFind.setMpfTitle(mpfTitle);
		mpFind.setMpfContent(mpfContent);
		mpFind.setMpfInfoDate(tDate);
		mpFind.setMpfLocalCode(mpfLocalCode);
		mpFind.setMpfPetType(mpfPetType);
		mpFind.setMpfLocalDetail(mpfLocalDetail);
		
		//파일 업로드 공통 처리 메소드
		String fileName = gms.addFile(request, multipartFile);
		mpFind.setMpfAddFile(fileName);
		int result = mpFindService.mpfInsert(mpFind);
		
		System.out.println("데이터 insert 결과 : " + result);
		
		return "redirect:mpfSelectList";
	}
	
	// 실종 반려동물 목격 디테일 수정화면
	@RequestMapping("/mpfUpdate")
	public String mpfUpdate(Model model,int mpfNo, int pageNum) {
		MpFind mpModify = mpFindService.mpfSelectDetail(mpfNo);
		
		model.addAttribute("mpModify",mpModify);
		model.addAttribute("pageNum",pageNum);
		
		return "mp/mpFindView/mpfModifyView";
	}
	
	// 실종 반려동물 목격 디테일 수정화면 프로세스
	@RequestMapping("mpfUpdateProcess")
	public String mpfUpdateProcess(HttpServletRequest request, @RequestParam(value = "mpfAddFile", required = false) MultipartFile multipartFile,
			int mpfNo,int mmNo,String mpfTitle,String mpfWriter,String mpfContent,String mpfInfoDate,String mpfStatusCode,String mpfLocalCode,String mpfPetType,String mpfLocalDetail,int pageNum)throws IOException {
		
		MpFind mpFind = new MpFind();
		
		String tempTime = mpfInfoDate + " 00:00:00";
		Timestamp time = Timestamp.valueOf(tempTime);
		
		mpFind.setMpfNo(mpfNo);
		mpFind.setMmNo(mmNo);
		mpFind.setMpfTitle(mpfTitle);
		mpFind.setMpfWriter(mpfWriter);
		mpFind.setMpfContent(mpfContent);
		mpFind.setMpfInfoDate(time);
		mpFind.setMpfStatusCode(mpfStatusCode);
		mpFind.setMpfLocalCode(mpfLocalCode);
		mpFind.setMpfPetType(mpfPetType);
		mpFind.setMpfLocalDetail(mpfLocalDetail);
		System.out.println("mpfNo:"+mpfNo);
		//파일 업로드 공통 처리 메소드
		String fileName = gms.addFile(request, multipartFile);
		mpFind.setMpfAddFile(fileName);
		
		int result = mpFindService.mpfUpdate(mpFind);
		
		System.out.println("데이터 update 결과 : " + result);
		
		return "redirect:mpfSelectList?pageNum="+pageNum;
		
	}
	
	// 실종 반려동물 목격 삭제 프로세스
	@RequestMapping("/mpfDeleteProcess")
	public String mpfDeleteProcess(int mpfNo,int pageNum) {
		System.out.println("mpfNo : "+mpfNo);
		
		int result = mpFindService.mpfDelete(mpfNo);
		
		System.out.println("데이터 delete 결과 : " + result);
		
		return "redirect:mpfSelectList?pageNum="+pageNum;
	}
	
	@Autowired
	private MpProtectService mpProtectService;
	
	
	/*
	 *		실종 반려동물 임시보호 컨트롤러
	 *		실종 반려동물 임시보호 컨트롤러
	 *		실종 반려동물 임시보호 컨트롤러
	 **/
	// 실종 반려동물 임시보호 리스트 조회
	@RequestMapping("/mppSelectList")
	public String mppSelectList(Model model,
			   @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
			   @RequestParam(value = "type", required = false, defaultValue = "null") String type,
			   @RequestParam(value = "keyWord", required = false, defaultValue = "null") String keyWord) {
		
		logger.debug("keyword : " + keyWord);
		
		int pageSize = 10; 
		int pageGroup = 10; 
		int listCount = mpProtectService.mppSelectListCount(type, keyWord);
		
		Map<String , Object> mppModel = gms.pageList(listCount, pageSize, pageGroup, pageNum, type, keyWord);  
		int startRow = (int)mppModel.get("startRow"); 
		List<MpProtect> mppSelectList = mpProtectService.mppSelectList(startRow, pageSize, type, keyWord);
		
		mppModel.put("mppList", mppSelectList);
		mppModel.put("listCount", listCount);
		mppModel.put("pageGroup", pageGroup);
		mppModel.put("keyWord", keyWord);
		mppModel.put("type", type);
		
		model.addAttribute("mppModel",mppModel);
		model.addAttribute("mppSelectList",mppSelectList);
		
		return "mp/mpProtectView/mppSelectListView";
	}
	
	// 실종 반려동물 신고 임시보호 상세화면 조회
	@RequestMapping("/mppSelectDetail")
	public String mppSelectDetail(Model model,int mppNo, int pageNum) {
		
		// readCount 증가 service method
		int result = mpProtectService.mppUpdateReadCount(mppNo);
		System.out.println("readCount 조회결과 : " + result);
		System.out.println("pagenum:"+pageNum);
		MpProtect mppDetail = mpProtectService.mppSelectDetail(mppNo);
		model.addAttribute("mppDetail",mppDetail);
		model.addAttribute("pageNum",pageNum);
		System.out.println("pageNum:"+pageNum);
		return "mp/mpProtectView/mppSelectDetailView";
	}
	
	// 실종 반려동물 임시보호 글쓰기 프로세스
	@RequestMapping("/mppInsertProcess")
	public String mppInsert(HttpServletRequest request, @RequestParam(value = "mppAddFile", required = false) MultipartFile multipartFile,
							int mmNo,String mppTitle, String mppContent, String mppWriter,String mppStatusCode,String mppRegDate, String mppInfoDate, String mppLocalCode,String mppPetType,String mppGen,String mppLocalDetail)throws IOException{

		
		String tempDate = mppInfoDate + " 00:00:00";
		Timestamp tDate = Timestamp.valueOf(tempDate);
		
		MpProtect mpProtect = new MpProtect();
		mpProtect.setMmNo(mmNo);
		mpProtect.setMppWriter(mppWriter);
		mpProtect.setMppTitle(mppTitle);
		mpProtect.setMppContent(mppContent);
		mpProtect.setMppInfoDate(tDate);
		mpProtect.setMppStatusCode(mppStatusCode);
		mpProtect.setMppLocalCode(mppLocalCode);
		mpProtect.setMppPetType(mppPetType);
		mpProtect.setMppGen(mppGen.trim());
		mpProtect.setMppLocalDetail(mppLocalDetail);
		
		//파일 업로드 공통 처리 메소드
		String fileName = gms.addFile(request, multipartFile);
		mpProtect.setMppAddFile(fileName);
		int result = mpProtectService.mppInsert(mpProtect);
		
		System.out.println("데이터 insert 결과 : " + result);
		
		return "redirect:mppSelectList";
	}
	
	// 실종 반려동물 임시보호 디테일 수정화면
	@RequestMapping("/mppUpdate")
	public String mppUpdate(Model model,int mppNo, int pageNum) {
		MpProtect mpModify = mpProtectService.mppSelectDetail(mppNo);
		
		model.addAttribute("mpModify",mpModify);
		model.addAttribute("pageNum",pageNum);
		
		return "mp/mpProtectView/mppModifyView";
	}
	
	// 실종 반려동물 임시보호 디테일 수정화면 프로세스
	@RequestMapping("mppUpdateProcess")
	public String mppUpdateProcess(HttpServletRequest request, @RequestParam(value = "mppAddFile", required = false) MultipartFile multipartFile,
									int mppNo,int mmNo,String mppTitle,String mppWriter,String mppContent,String mppInfoDate,String mppStatusCode, String mppLocalCode,String mppPetType,String mppGen,String mppLocalDetail,int pageNum)throws IOException {
		
		String tempTime = mppInfoDate + " 00:00:00";
		Timestamp time = Timestamp.valueOf(tempTime);
		
		MpProtect mpProtect = new MpProtect();
		mpProtect.setMppNo(mppNo);
		mpProtect.setMmNo(mmNo);
		mpProtect.setMppTitle(mppTitle);
		mpProtect.setMppWriter(mppWriter);
		mpProtect.setMppContent(mppContent);
		mpProtect.setMppInfoDate(time);
		mpProtect.setMppStatusCode(mppStatusCode);
		mpProtect.setMppLocalCode(mppLocalCode);
		mpProtect.setMppPetType(mppPetType);
		mpProtect.setMppGen(mppGen);
		mpProtect.setMppLocalDetail(mppLocalDetail);
		System.out.println("mppNo:"+mppNo);
		//파일 업로드 공통 처리 메소드
		String fileName = gms.addFile(request, multipartFile);
		mpProtect.setMppAddFile(fileName);
		
		int result = mpProtectService.mppUpdate(mpProtect);
		
		System.out.println("데이터 update 결과 : " + result);
		
		return "redirect:mppSelectList?pageNum="+pageNum;
		
	}
	
	// 실종 반려동물 임시보호 삭제 프로세스
	@RequestMapping("/mppDeleteProcess")
	public String mppDeleteProcess(int mppNo,int pageNum) {
		System.out.println("mppNo : "+mppNo);
		
		int result = mpProtectService.mppDelete(mppNo); 
		
		System.out.println("데이터 delete 결과 : " + result);
		
		return "redirect:mppSelectList?pageNum="+pageNum;
	}
	
	
	
	
	// 실종 반려동물 목격 게시판 댓글 작성기능
	@RequestMapping("/mpfCommInsert")
	@ResponseBody
	public List<MpFindComm> mpfComInsert(Model model, int mpfNo, int mmNo, String mpfComWriter, String mpfComContent){
		MpFindComm mpfCom =  new MpFindComm();
		
		mpfCom.setMpfNo(mpfNo);
		mpfCom.setMmNo(mmNo);
		mpfCom.setMpfComWriter(mpfComWriter);
		mpfCom.setMpfComContent(mpfComContent);
		
		int result = mpfCommService.mpfcInsert(mpfCom);
		System.out.println("result : " + result);
		List<MpFindComm> mpfCommList = mpfCommService.mpfcSelectList(mpfCom.getMpfNo());
		
		return mpfCommList;
	}
	
	// 실종자 목격 게시판 댓글 수정
	@RequestMapping("/mpfcUpdate")
	@ResponseBody
	public List<MpFindComm> mpfComUpdate(int mpfNo, int mpfComNo, String mpfContent){
		System.out.println("getMpfNo : "+ mpfNo);
		System.out.println("getMpfComNo : "+ mpfComNo);
		System.out.println("getMhfComContent : "+mpfContent);
		
		MpFindComm mpfCom =  new MpFindComm();
		mpfCom.setMpfNo(mpfNo);
		mpfCom.setMpfComNo(mpfComNo);
		mpfCom.setMpfComContent(mpfContent);
		
		int result = mpfCommService.mpfcUpdate(mpfCom);
		System.out.println("result : " + result);
		List<MpFindComm> mpfCommList = mpfCommService.mpfcSelectList(mpfNo); 
		
		return mpfCommList;
	}
	
	// 실종 반려동물 목격 게시판 댓글 삭제기능
	@RequestMapping("/mpfCommDelete")
	@ResponseBody
	public List<MpFindComm> mpfComDelete(MpFindComm mpfindCom){
		int result = mpfCommService.mpfcDelete(mpfindCom);
		System.out.println("result : " + result);
		return mpfCommService.mpfcSelectList(mpfindCom.getMpfNo());
	}
}




