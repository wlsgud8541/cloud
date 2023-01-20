package com.project.cloud.cs.controller;

import java.io.IOException;
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

import com.project.cloud.cs.domain.Mnotice;
import com.project.cloud.cs.domain.Mqna;
import com.project.cloud.cs.domain.Mrequest;
import com.project.cloud.cs.domain.MrequestComm;
import com.project.cloud.cs.service.MnoticeService;
import com.project.cloud.cs.service.MqnaService;
import com.project.cloud.cs.service.MrequestCommService;
import com.project.cloud.cs.service.MrequestService;
import com.project.cloud.gm.service.GlobalMethodService;
@Controller
public class CsController {
	
	// 공통 메소드 서비스
	@Autowired
	private GlobalMethodService gms;

	// 공지사항 Service 어노테이션 주입
	@Autowired
	private MnoticeService mnoticeService;
	
	// Q&A Service 어노테이션 주입
	@Autowired
	private MqnaService mqnaService;
	
	//건의 게시판 상세 service
	@Autowired
	private MrequestService mrequestService;
	
	// 건의 게시판 답글 상세 service
	@Autowired
	private MrequestCommService mrequestCommService;
	
	private Logger logger = LoggerFactory.getLogger(CsController.class);
	
	// 공지사항 게시판 리스트 조회
	@RequestMapping("/mnSelectList")
	public String mnSelectList(Model model,
							   @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
							   @RequestParam(value = "type", required = false, defaultValue = "title") String type,
							   @RequestParam(value = "keyWord", required = false, defaultValue = "") String keyWord) {
		
		logger.debug("keyWord : "+keyWord);

		// 페이징 처리 시작
		int pageSize = 10;   // 페이지 사이즈 갯수
		int pageGroup = 10; // 페이징 그룹
		int listCount = mnoticeService.mnSelectListCount(type, keyWord); // 게시글 갯수 조회
		
		
		/* 
		 * pageList : 페이징 처리 메서드
		 * 매개변수 (게시글갯수, 페이지 사이즈, 페이지 그룹, 현재 페이지 정보, 검색 타입, 검색 키워드)
		 * 반환값 : startRow / pageCount / startPage / endPage / currentPage
		 * */
		Map<String , Object> mnModel = gms.pageList(listCount, pageSize, pageGroup, pageNum, type, keyWord);  
		int startRow = (int)mnModel.get("startRow"); 
		List<Mnotice> mnSelectList = mnoticeService.mnSelectList(startRow, pageSize, type, keyWord);
		
		mnModel.put("mnList", mnSelectList);
		mnModel.put("listCount", listCount);
		mnModel.put("pageGroup", pageGroup);
		mnModel.put("keyWord", keyWord);
		mnModel.put("type", type);
		
		model.addAllAttributes(mnModel);
		
		return "customerSupportView/mNoticeView/mnSelectListView";
	}

	// 공지사항 게시판 상세화면 조회
	@RequestMapping("/mnSelectDetail")
	public String mnSelectDetail(Model model, int mnNo, int pageNum) {
		
		// readCount 증가 service method
		int result = mnoticeService.mnUpdateReadCount(mnNo);
		logger.debug("read cound 조회 결과 : "+result);
		
		// 게시판 상세내용 조회 service method
		Mnotice mnotice = mnoticeService.mnSelectDetail(mnNo);
		
		model.addAttribute("mnotice",mnotice);
		model.addAttribute("pageNum",pageNum);
		
		return "customerSupportView/mNoticeView/mnSelectDetailView";
	}
	
	// 공지사항 게시판 글쓰기 화면 프로세스
	@RequestMapping("/mnInsertProcess")
	public String mnInsertProcess(HttpServletRequest request, @RequestParam(value = "mnAddFile", required = false) MultipartFile multipartFile,
									int mmNo, String mnWriter, String mnTitle, String mnContent, String mnFixTopYn) throws IOException{
		
		Mnotice mnotice = new Mnotice();
		mnotice.setMmNo(mmNo);
		mnotice.setMnWriter(mnWriter);
		mnotice.setMnTitle(mnTitle);
		mnotice.setMnContent(mnContent);
		mnotice.setMnFixTopYn(mnFixTopYn);
		
		//파일 업로드 공통 처리 메소드
		String fileName = gms.addFile(request, multipartFile);
		mnotice.setMnAddFile(fileName);
		
		int result = mnoticeService.mnInsert(mnotice);
		
		logger.debug("데이터 insert 결과 : " + result);
		
		return "redirect:mnSelectList";
	}
	
	// 공지사항 수정하기 화면이동
	@RequestMapping("/mnUpdate")
	public String mnUpdate(Model model, int mnNo, int pageNum) {
		Mnotice mnotice = mnoticeService.mnSelectDetail(mnNo);
		
		model.addAttribute("mnotice",mnotice);
		model.addAttribute("pageNum",pageNum);
		
		return "customerSupportView/mNoticeView/mnModifyView";
	}
	
	// 공지사항 수정 화면 프로세스
	@RequestMapping("/mnUpdateProcess")
	public String mnUpdateProcess(HttpServletRequest request, @RequestParam(value = "mnAddFile", required = false) MultipartFile multipartFile,
								  int mnNo, int mmNo, String mnWriter, String mnTitle, String mnContent, String mnFixTopYn, int pageNum) throws IOException {
		
		Mnotice mnotice = new Mnotice();
		mnotice.setMnNo(mnNo);
		mnotice.setMmNo(mmNo);
		mnotice.setMnWriter(mnWriter);
		mnotice.setMnTitle(mnTitle);
		mnotice.setMnContent(mnContent);
		mnotice.setMnFixTopYn(mnFixTopYn);
		
		//파일 업로드 공통 처리 메소드
		String fileName = gms.addFile(request, multipartFile);
		mnotice.setMnAddFile(fileName);
		
		int result = mnoticeService.mnUpdate(mnotice);
		
		logger.debug("데이터 update 결과 : " + result);
		
		return "redirect:mnSelectList?pageNum="+pageNum;
	}
	
	// 공지사항 게시판 삭제 프로세스
	@RequestMapping("/mnDeleteProcess")
	public String mnDeleteProcess(int mnNo, int pageNum) {
		
		int result = mnoticeService.mnDelete(mnNo);
		
		logger.debug("데이터 delete 결과 : " + result);
		
		return "redirect:mnSelectList?pageNum="+pageNum;
	}
	
	// Q&A 게시판 목록화면 이동
	@RequestMapping("/mqSelectList")
	public String mqSelectList(Model model) {
		
		List<Mqna> mQnaList = mqnaService.mqSelectList();
		
		model.addAttribute("mQnaList", mQnaList);
		
		return "customerSupportView/mQnaView/mqSelectView";
	}
	
	// Q&A 게시판 등록 프로세스
	@RequestMapping("/mqInsertProcess")
	public String mqInsertProcess(Mqna mqna) {

		int result = mqnaService.mqInsert(mqna);
		logger.debug("qna게시판 insert 결과 : " + result);
		
		return "redirect:mqSelectList";
	}
	
	// Q&A 게시판 수정
	@RequestMapping("/mqModifyProcess")
	@ResponseBody
	public List<Mqna> mqUpdate(int mqNo, String mqTitle, String mqContent, String mqWriter) {
		logger.debug("mqNo : "+mqNo);
		logger.debug("mqTitle : "+mqTitle);
		logger.debug("mqContent"+mqContent);
		logger.debug("mqWriter : "+mqWriter);
		
		// Q&A 게시판 수정 처리
		mqnaService.mqUpdate(mqNo, mqTitle, mqContent, mqWriter);
		
		return mqnaService.mqSelectList();
	}
	
	@RequestMapping("/mqDeleteProcess")
	@ResponseBody
	public List<Mqna> mqDelete(int mqNo){
		
		// Q&A 게시판 삭제 처리
		int result = mqnaService.mqDelete(mqNo);
		
		logger.debug("qna 게시판 삭제 결과 : "+ result);
		
		return mqnaService.mqSelectList();
	}
	
	
	// 건의게시판 게시판 목록
	@RequestMapping("/mrSelectList")
	public String mrSelectList(Model model,
								@RequestParam(value = "pageNum",required = false, defaultValue = "1")int pageNum,
								@RequestParam(value = "type", required = false, defaultValue = "") String type,
								@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) {
		int pageSize = 15;
		int pageGroup = 10;
		int listCnt = mrequestService.getMrSelectCnt(type,keyword);
		
		Map<String, Object> mrModel = gms.pageList(listCnt, pageSize, pageGroup, pageNum, type, keyword);
		
		int startRow = (int)mrModel.get("startRow");
		
		List<Mrequest> mrSelectList = mrequestService.mrSelectList(startRow, pageSize,type,keyword);
		
		mrModel.put("mrList", mrSelectList);
		mrModel.put("listCnt", listCnt);
		mrModel.put("pageGroup", pageGroup);
		mrModel.put("type", type);
		mrModel.put("keyWord", keyword);
		
		model.addAllAttributes(mrModel);
		
		return "customerSupportView/mRequestView/mrSelectListView";
	}
	
	// 건의게시판 게시글 상세
	@RequestMapping("/mrSelectDetail")
	public String mrSelectDetail(Model model, int mreNo, int pageNum) {

		Mrequest mrequest = mrequestService.mrSelectDetail(mreNo);
		MrequestComm mrequestcomm = mrequestCommService.mrcSelectDetail(mreNo);
		//List<MrequestComm> mrcSelectList = mrequestCommService.mrcSelectList(mreNo);
		
		// 건의게시판 조회수 업데이트
		int readCnt = mrequestService.mreUpdateReadCnt(mreNo);
		logger.debug("조회수 : " + readCnt);
		
		model.addAttribute("mrequest",mrequest);
		model.addAttribute("pageNum",pageNum);
		//건의게시판 답글 리스트
		//model.addAttribute("mrcSelectList",mrcSelectList);
		// 건의 답변 상세
		model.addAttribute("mrequestcomm",mrequestcomm);
		return "customerSupportView/mRequestView/mrSelectDetailView";
	}
	
	// 건의게시판 건의작성 프로세스
	@RequestMapping("/mrInsertProcess")
	public String mrInsertProcess(HttpServletRequest request, @RequestParam(value = "mreAddFile", required = false) MultipartFile multipartFile,
									int mmNo, String mreWriter, String mreTitle, String mreContent) throws IOException {
		Mrequest mrequest = new Mrequest();
		mrequest.setMmNo(mmNo);
		mrequest.setMreWriter(mreWriter);
		mrequest.setMreTitle(mreTitle);
		mrequest.setMreContent(mreContent);
		
		// 파일업로드 공통처리 메서드
		String fileName = gms.addFile(request, multipartFile);
		mrequest.setMreAddFile(fileName);
		
		int result = mrequestService.mrInsert(mrequest);
		logger.debug("데이터 insert : " + result);
		
		return "redirect:mrSelectList";
	}
	
	// 건의게시판 수정 화면
	@RequestMapping("/mrUpdate")
	public String mrUpdate(Model model, int mreNo, int pageNum) {
		Mrequest mrequest = mrequestService.mrSelectDetail(mreNo);
		
		model.addAttribute("mrequest", mrequest);
		model.addAttribute("pageNum",pageNum);
		
		return "customerSupportView/mRequestView/mrModifyView";
	}
	
	//건의게시판 게시글 수정 프로세스
	@RequestMapping("/mrUpdateProcess")
	public String mrUpdateProcess(HttpServletRequest request, @RequestParam(value = "mreAddFile", required = false) MultipartFile multipartFile,
									int mreNo, int mmNo, String mreWriter, String mreTitle, String mreContent, int pageNum) throws IOException {
		Mrequest mrequest = new Mrequest();
		mrequest.setMreNo(mreNo);
		mrequest.setMmNo(mmNo);
		mrequest.setMreWriter(mreWriter);
		mrequest.setMreTitle(mreTitle);
		mrequest.setMreContent(mreContent);
		
		// 파일 업로드 공통처리 메소드
		String fileName = gms.addFile(request, multipartFile);
		mrequest.setMreAddFile(fileName);
		
		int result = mrequestService.mrUpdate(mrequest);
		logger.debug("데이터 update : " + result);
		
		return "redirect:mrSelectList?pageNum=" + pageNum;
	}
	
	// 건의게시판 게시글 삭제
	@RequestMapping("/mrDeleteProcess")
	public String mrDeleteProcess(int mreNo, int pageNum) {
		int result = mrequestService.mrDelete(mreNo);
		
		logger.debug("데이터 delete : " + result);
		
		return "redirect:mrSelectList?pageNum=" + pageNum;
		
	}
	
	// 건의게시판 추천 반영 프로세스
	@RequestMapping("/mreRecoCnt.ajax")
	@ResponseBody
	public Map<String, Integer> mreRecoCnt(int mreNo, int mreRecoCnt){
		return mrequestService.mreRecoCnt(mreNo, mreRecoCnt);
	}
	
	// 건의게시판 답글 작성 프로세스
	@RequestMapping("/mrcInsertProcess.ajax")
	@ResponseBody
	public MrequestComm mrcInsert(HttpServletRequest request, @RequestParam(value = "mreAddFile", required = false) MultipartFile multipartFile,
									MrequestComm mrequestComm) throws IOException{
		//파일 업로드 공동 메서드
		String fileName = gms.addFile(request, multipartFile);
		mrequestComm.setMreComAddFile(fileName);
		
		mrequestCommService.mrcInsert(mrequestComm);
		mrequestService.mrUpdateReplyCode(mrequestComm.getMreNo());
		
		return mrequestCommService.mrcSelectDetail(mrequestComm.getMreNo());
	}
	
	// 건의게시판 답변 수정 프로세스
	/*
	@RequestMapping("/mrcUpdateProcess.ajax")
	@ResponseBody
	public Map<String, MrequestComm> mrcUpdate(MrequestComm mrequestComm) {

		Map<String, MrequestComm> mrcMap = new HashMap<String, MrequestComm>();
		MrequestComm mValue = mrequestCommService.mrcSelectDetail(mrequestComm.getMreNo());
		int result = mrequestCommService.mrcUpdate(mrequestComm);

		mrcMap.put("mValue", mValue);
		
		return mrcMap;
	}
	*/
	@RequestMapping("/mrcUpdateProcess.ajax")
	@ResponseBody
	public MrequestComm mrcUpdate(HttpServletRequest request, @RequestParam(value = "mreAddFile", required = false) MultipartFile multipartFile,
									MrequestComm mrequestComm) throws IOException {
		
		//파일 업로드 공동구현 메서드
		String fileName = gms.addFile(request, multipartFile);
		mrequestComm.setMreComAddFile(fileName);
		
		mrequestCommService.mrcUpdate(mrequestComm);
		
		return mrequestCommService.mrcSelectDetail(mrequestComm.getMreNo());
	}
	
	// 건의게시판 답변 삭제 프로세스
	@RequestMapping("/mrcDeleteProcess.ajax")
	@ResponseBody
	public int mrcDelete(int mreComNo,int mreNo) {
		
		int result = mrequestCommService.mrcDelete(mreComNo);
		mrequestService.mrDelReplyCode(mreNo);
		
		return result;
	}
	
}

