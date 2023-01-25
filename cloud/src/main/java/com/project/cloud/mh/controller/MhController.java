package com.project.cloud.mh.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.cloud.gm.service.GlobalMethodService;
import com.project.cloud.mh.dao.MhInfoDao;
import com.project.cloud.mh.domain.MhFind;
import com.project.cloud.mh.domain.MhFindComm;
import com.project.cloud.mh.domain.MhInfo;
import com.project.cloud.mh.domain.MhReport;
import com.project.cloud.mh.service.MhFindCommService;
import com.project.cloud.mh.service.MhFindService;
import com.project.cloud.mh.service.MhInfoService;
import com.project.cloud.mh.service.MhReportService;


@Controller
public class MhController {

	// 공통 메소드 서비스 주입
	@Autowired
	private GlobalMethodService gm;
	@Autowired
	MhInfoDao mhiDao;
	// 실종자 게시판 service 어노테이션 주입
	@Autowired
	private MhReportService service;
	@Autowired 
	private MhFindService mhfService;
	@Autowired
	private MhFindCommService mhfCommService;
	@Autowired
	private MhInfoService mhiService;
	
	private Logger logger = LoggerFactory.getLogger(MhController.class);
	public void setMhReportService(MhReportService service) {
		this.service = service;
	}
	// 실종자 정보 게시판뷰
	@RequestMapping("/mhrSelectList")
	public String mhrSelectList(Model model,
											@RequestParam(value="type",required=false, defaultValue="")String type,
											@RequestParam(value="keyword",required=false, defaultValue="")String keyword,
											@RequestParam(value="pageNum",required=false,defaultValue="1")int pageNum,
											@RequestParam(value = "mpGen",required = false, defaultValue = "") String mpGen, 
											@RequestParam(value = "mpType",required = false, defaultValue = "") String mpType, 
											@RequestParam(value = "mpKeyword",required = false, defaultValue = "") String mpKeyword, 
											@RequestParam(value = "mpInfoDate1",required = false, defaultValue = "") String mpInfoDate1, 
											@RequestParam(value = "mpInfoDate2",required = false, defaultValue = "") String mpInfoDate2, 
											@RequestParam(value = "mpLocalCode",required = false, defaultValue = "") String mpLocalCode)
																																	{
		System.out.println(keyword+":keyword");
		System.out.println(type+":type");
		// 페이징처리
		int pagesize = 10;
		int pagegroup = 10;
		// 총 게시글 수 조회
		int listCount = service.mhrListCount(type,keyword);
		logger.debug("실종자 정보 게시판 리스트카운트"+listCount);
		Map<String,Object> mhrList = gm.pageList(listCount, pagesize, pagegroup, pageNum, type, keyword);
		int startRow = (int)mhrList.get("startRow");
		List<MhReport> list = service.mhrSelectList(startRow,pagesize,type,keyword);
		mhrList.put("list", list);
		mhrList.put("listCount", listCount);
		mhrList.put("pagegroup", pagegroup);
		mhrList.put("type", type);
		mhrList.put("keyword", keyword);
		model.addAllAttributes(mhrList);
		return "mh/mhReportView/mhrSelectListView";
	}
	// 실종자 정보 상세보기뷰로 이동
	@RequestMapping("/mhrDetailView")
	public String mhrSelectDetail(Model model, int mhrNo, int pageNum) {
		MhReport report = service.mhrSelectDetail(mhrNo);
		MhReport reportReadCount = service.mhrReadCount(mhrNo,true);
		model.addAttribute("reportReadCount",reportReadCount);
		logger.debug("실종자 정보 상세보기 mhrNo"+mhrNo);
		model.addAttribute("report",report);
		model.addAttribute("pageNum",pageNum);
		return "mh/mhReportView/mhrDetailView";
	}
	// 실종자 정보 추가 하기
	@RequestMapping(value="/mhrInsertProcess")
	public String mhrInsert( String mhrWriter,String mhrMage,  String mhrage, String mhrInfoDate, 
										String mhrTitle, String mhrContent, String mhrNation, String mhrIllCode,
										String mhrStatusCode, String mhrLocalCode, String mhrName, String mhrGen,
										@RequestParam(value="mhrHeight",required=false)String mhrHeight,
										@RequestParam(value="mhrWeight",required=false)String mhrWeight, 
										@RequestParam(value="mhrFace",required=false)String mhrFace, 
										@RequestParam(value="mhrHairColor",required=false)String mhrHairColor,
										@RequestParam(value="mhrHair",required=false)String mhrHair,
										@RequestParam(value="mhrWear",required=false)String mhrWear,
										int mmNo, Timestamp mhrRegDate, 
										@RequestParam(value="mhrAddFile", required=false)MultipartFile file,
										HttpServletRequest request) throws IOException {

		MhReport mhReport = new MhReport();
		
		String tempDate = mhrInfoDate + " 00:00:00";
		Timestamp tsDate = Timestamp.valueOf(tempDate);
		
		logger.debug("mhrLocalCode : "+mhrLocalCode);
		String FileName = gm.addFile(request, file);
		mhReport.setMmNo(mmNo);
		mhReport.setMhrMage(mhrMage);
		mhReport.setMhrage(mhrage);
		mhReport.setMhrTitle(mhrTitle);
		mhReport.setMhrContent(mhrContent);
		mhReport.setMhrName(mhrName);
		mhReport.setMhrNation(mhrNation);
		mhReport.setMhrIllCode(mhrIllCode);
		mhReport.setMhrStatusCode(mhrStatusCode);
		mhReport.setMhrLocalCode(mhrLocalCode);
		mhReport.setMhrWriter(mhrWriter);
		mhReport.setMhrGen(mhrGen);
		mhReport.setMhrHeight(mhrHeight);
		mhReport.setMhrWeight(mhrWeight);
		mhReport.setMhrFace(mhrFace);
		mhReport.setMhrHairColor(mhrHairColor);
		mhReport.setMhrHair(mhrHair);
		mhReport.setMhrWear(mhrWear);
		mhReport.setMhrInfoDate(tsDate);
		mhReport.setMhrAddFile(FileName);
		int result = service.mhrInsert(mhReport);
		logger.debug("글추가"+result);
		return "redirect:mhrSelectList";
	}
	// 실종자 정보 수정화면 이동
	@RequestMapping("/mhrModifyView")
	public String mhrUpdate(int mhrNo, Model model) {
		MhReport mhReport = service.mhrSelectDetail(mhrNo);
		model.addAttribute("mhReport",mhReport);
		return "mh/mhReportView/mhrModifyView";
	}
	// 실종자 정보 수정프로세스
	@RequestMapping(value="/mhrUpdateProcess")
	public String mhrUpdatePorcess( HttpServletRequest request,String mhrTitle,
										String mhrContent, String mhrName, String mhrMage, String mhrage,
										String mhrRegDate, String mhrNation, String mhrIllCode, String mhrStatusCode,
										String mhrLocalCode, String mhrGen, String mhrHeight, String mhrWeight,
										String mhrPhysical, String mhrHairColor, String mhrHair, String mhrWear,int mmNo, int mhrNo,
										@RequestParam(value="mhrAddFile",required=false)MultipartFile file, String mhrInfoDate) throws IOException {
		MhReport mhReport = new MhReport();
		String tempDate = mhrInfoDate + " 00:00:00";
		logger.debug(tempDate);
		Timestamp temp = Timestamp.valueOf(tempDate);
		mhReport.setMhrNo(mhrNo);
		mhReport.setMhrTitle(mhrTitle);
		mhReport.setMhrContent(mhrContent);
		mhReport.setMhrName(mhrName);
		mhReport.setMhrMage(mhrMage);
		mhReport.setMhrage(mhrage);	
		mhReport.setMhrNation(mhrNation);
		mhReport.setMhrIllCode(mhrIllCode);
		mhReport.setMhrStatusCode(mhrStatusCode);
		mhReport.setMhrLocalCode(mhrLocalCode);
		mhReport.setMhrGen(mhrGen);
		mhReport.setMhrHeight(mhrHeight);
		mhReport.setMhrWeight(mhrWeight);
		mhReport.setMhrPhysical(mhrPhysical);
		mhReport.setMhrHairColor(mhrHairColor);
		mhReport.setMhrHair(mhrHair);
		mhReport.setMhrWear(mhrWear);
		mhReport.setMhrInfoDate(temp);
		String FileName = gm.addFile(request, file);
		mhReport.setMhrAddFile(FileName);
		int tmp = service.mhrUpdate(mhReport);
		logger.debug("수정 결과:"+tmp);
		
		return "redirect:mhrSelectList";
	}
	// 실종자 정보 게시글 삭제 프로세스
	@RequestMapping("/mhrDeleteProcess")
	public String mhrDeleteProcess(int mhrNo) {
		logger.debug("딜리트:"+mhrNo);
		int tmp = service.mhrDelete(mhrNo);
		logger.debug("삭제 결과:"+tmp);
		return "redirect:mhrSelectList";
	}
	
	// 실종자 목격 게시판 뷰
	@RequestMapping("/mhfSelectList")
	public String mhfSelectList(Model model,
											@RequestParam(value="pageNum",required=false,defaultValue="1")int pageNum,
											@RequestParam(value="keyword",required=false,defaultValue="")String keyword,
											@RequestParam(value="type",required=false,defaultValue="")String type) {
		// 페이지네이션
		int pageSize = 10;
		int pageGroup = 10;
		//페이지 총 게시글의 수
		int listCount = mhfService.mhfSelectListCount(type, keyword);
		logger.debug("listCount:"+listCount);
		Map<String, Object> mhfMap = gm.pageList(listCount, pageSize, pageGroup, pageNum, type, keyword);
		int startRow = (int) mhfMap.get("startRow");
		List<MhFind> mhfList = mhfService.mhfSelectList(startRow, pageSize, type, keyword);
		mhfMap.put("mhfList", mhfList);
		mhfMap.put("listCount", listCount);
		mhfMap.put("pageGroup", pageGroup);
		mhfMap.put("type", type);
		mhfMap.put("keyword", keyword);
		model.addAllAttributes(mhfMap);
		System.out.println(listCount+"목격 게시판 리스트");
		return "mh/mhFindView/mhfSelectListView";
	}
	// 실종자 목격 게시판 상세화면 뷰
	@RequestMapping("/mhfDetailView")
	public String mhfDetailView(int mhfNo, 
								@RequestParam(value="pageNum",required=false,defaultValue="1")int pageNum, Model model) {
		MhFind mhfind = mhfService.mhfSelectDetail(mhfNo);
		MhFind mhfindReadCount = mhfService.mhfSelectReadCount(mhfNo, true);
		List<MhFindComm> mhfCommList = mhfCommService.mhfcSelectList(mhfNo);
		model.addAttribute("mhfCommList",mhfCommList);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("mhfindReadCount",mhfindReadCount);
		model.addAttribute("mhfind",mhfind);
		return "mh/mhFindView/mhfDetailView";
	}
	
	// 실종자 목격 게시판 작성
	@RequestMapping("/mhfInsertProcess")
	public String mhfInsertProcess(HttpServletRequest request, 
												String mhfTitle, String mhfContent, String mhfWriter, String mhfGen,
												String mhfInfoDate, String mhfSecretYn,
												@RequestParam(value="mhfAddFile",required=false)MultipartFile file,
												Timestamp mhfRegDate, int mmNo)throws IOException {
		String date1 = mhfInfoDate + " 00:00:00";
		Timestamp tmp = Timestamp.valueOf(date1);
		MhFind mhfind = new MhFind();
		String FileName = gm.addFile(request, file);
		mhfind.setMhfTitle(mhfTitle);
		mhfind.setMhfContent(mhfContent);
		mhfind.setMhfWriter(mhfWriter);
		mhfind.setmhfGen(mhfGen);
		mhfind.setMhfSecretYn(mhfSecretYn);
		mhfind.setMhfInfoDate(tmp);
		mhfind.setMhfAddFile(FileName);
		mhfind.setMhfRegDate(mhfRegDate);
		mhfind.setMmNo(mmNo);
		int result = mhfService.mhfInsert(mhfind);
		logger.debug("실종자 목격 게시판 등록"+result);
		
		return "redirect:mhfSelectList";
	}
	// 실종자 목격 게시판 수정뷰 이동
	@RequestMapping("/mhfModifyView")
	public String mhfUpdate(int mhfNo, Model model) {
		MhFind mhfind = mhfService.mhfSelectDetail(mhfNo);
		model.addAttribute("mhfind",mhfind);
		return "mh/mhFindView/mhfModifyView";
	}
	// 실종자 목격 게시판 수정
	@RequestMapping("/mhfUpdateProcess")
	public String mhfUpdateProcess(HttpServletRequest request, String mhfTitle, String mhfContent,
													@RequestParam(value="mhfAddFile",required=false)MultipartFile file,
													int mhfNo, String mhfGen, String mhfInfoDate,
													String mhfSecretYn)throws IOException {
		MhFind mhfind = new MhFind();
		String date1 = mhfInfoDate + " 00:00:00";
		Timestamp tmp = Timestamp.valueOf(date1);
		mhfind.setMhfTitle(mhfTitle);
		mhfind.setMhfContent(mhfContent);
		mhfind.setmhfGen(mhfGen);
		mhfind.setMhfSecretYn(mhfSecretYn);
		mhfind.setMhfNo(mhfNo);
		logger.debug(mhfInfoDate);
		mhfind.setMhfInfoDate(tmp);
		String FileName = gm.addFile(request, file);
		mhfind.setMhfAddFile(FileName);
		int result = mhfService.mhfUpdate(mhfind);
		logger.debug("목격 게시판 수정:"+result);
	
		return "redirect:mhfSelectList";
	}
	// 실종자 목격 게시판 삭제
	@RequestMapping("/mhfDeleteProcess")
	public String mhfDeleteProcess(int mhfNo) {
		int result = mhfService.mhfDelete(mhfNo);
		logger.debug("삭제프로세스:"+result);
		return "redirect:mhfSelectList";
	}

	// 실종자 목격 게시판 댓글 추가
	@RequestMapping("/mhfCommInsert")
	@ResponseBody
	public List<MhFindComm> mhfComInsert(MhFindComm mhfCom) {
		int result = mhfCommService.mhfcInsert(mhfCom);
		logger.debug("댓글쓰기결과:"+result);
		return mhfCommService.mhfcSelectList(mhfCom.getMhfNo());
	}
	
	// 실종자 목격 게시판 댓글 수정
	@RequestMapping("/mhfcUpdate")
	@ResponseBody
	public List<MhFindComm> mhfComUpdate(MhFindComm mhfCom){
		logger.debug("getMhfComNo : "+mhfCom.getMhfComNo());
		logger.debug("getMhfComContent : "+mhfCom.getMhfComContent());
		
		int result = mhfCommService.mhfcUpdate(mhfCom);
		logger.debug("댓글 수정:"+result);
		return mhfCommService.mhfcSelectList(mhfCom.getMhfNo());
	}
	
	// 실종자 목격 게시판 댓글 삭제
	@RequestMapping("/mhfcDelete")
	@ResponseBody
	public List<MhFindComm> mhfcDelete(MhFindComm mhfCom) {
		int result = mhfCommService.mhfcDelete(mhfCom);
		logger.debug("댓글삭제:"+result);
		return mhfCommService.mhfcSelectList(mhfCom.getMhfNo());
	}
	
	
	// 실종자 정보 게시판 api
	
	@RequestMapping("/mhInfo")
	public String mhInfoList(Model model,
										@RequestParam(value="pageNum",required=false, defaultValue="1") int pageNum,
										@RequestParam(value="keyword", required=false, defaultValue="null") String keyword,
										@RequestParam(value="type",required=false, defaultValue="null") String type)throws IOException, ParseException, java.text.ParseException {
		int pageGroup = 10;
		int pageSize = 10;
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize + 1;
		int pageCnt = 1;
		
//		HashMap<String, Object> jsonobj = new ObjectMapper().readValue(
//				mhiService.mhiSelectList(startRow, pageSize, type, keyword, pageCnt).get("jsonobj").toString(), HashMap.class);
		
		
		int totalCount = mhiService.mhiCount();
		
		Map<String, Object> mapList = gm.pageList(totalCount, pageSize, pageGroup, pageNum, type, keyword);
		
		List<MhInfo> mhiList = mhiService.mhiSelectList(startRow, pageSize, type, keyword, pageCnt);
		mapList.put("jMap", mhiList);
		mapList.put("pagegroup", pageGroup);
		mapList.put("listCount", totalCount);
		model.addAllAttributes(mapList);
		 
		return "mh/mhInfoView/mhiSelectList";
	}
	@Scheduled(cron="0 0 0/1 * * *")
	public void mhiScheduler() throws IOException, ParseException {
		
		int pageCnt = 1;
		mhiService.mhinfoBackup();
		Map<String, Object> map = new HashMap<String, Object>();
		boolean flag = true;
		do {
			map = mhiService.mhiScheduler(pageCnt);
			Map<String, Object> tempMap = (HashMap<String, Object>) map.get("jsonobj");
			List list = (List)tempMap.get("list");
			
			if (list.size() == 0) {
				flag = false;
			}else {
				pageCnt++;
			}
		} while (flag);
	}
} 
