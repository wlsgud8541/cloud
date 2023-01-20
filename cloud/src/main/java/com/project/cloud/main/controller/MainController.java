package com.project.cloud.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.cloud.cs.domain.Mnotice;
import com.project.cloud.main.service.MainService;
import com.project.cloud.mh.domain.MhFind;
import com.project.cloud.mh.domain.MhReport;
import com.project.cloud.mp.domain.MpFind;

@Controller
public class MainController {
	@Autowired
	private MainService mainService;
	
	@RequestMapping("main")
	public String mainBoardList(Model model) {
		
		List<Mnotice> mainMnlist = mainService.mainMnList();
		model.addAttribute("mainMnList",mainMnlist);
		
		List<MhFind> mainMhfList = mainService.mainMhfList();
		model.addAttribute("mainMhfList",mainMhfList);
		  
		List<MpFind> mainMpfList = mainService.mainMpfList();
		model.addAttribute("mainMpfList", mainMpfList);
		
		
		return "main/mainView";
	}
	
	@RequestMapping("search")
	public String mainUsearch(Model model, 
											@RequestParam(value="type",required=false,defaultValue="null")String type,
											@RequestParam(value="keyword",required=false,defaultValue="null")String keyword) {
		List<Object> searchList = mainService.uSearch(type, keyword);
		model.addAttribute("searchList",searchList);
		return "main/searchView";
	}
	
	@RequestMapping("mhpSearch")
	public String mhpSearch(Model model,
							@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
							@RequestParam(value = "mhName",required = false, defaultValue = "") String mhName, 
							@RequestParam(value = "mhGen",required = false, defaultValue = "M") String mhGen, 
							@RequestParam(value = "mhInfoDate1",required = false, defaultValue = "") String mhInfoDate1, 
							@RequestParam(value = "mhInfoDate2",required = false, defaultValue = "") String mhInfoDate2, 
							@RequestParam(value = "mhrLocalCode",required = false, defaultValue = "01") String mhrLocalCode, 
							@RequestParam(value = "mhfDate1",required = false, defaultValue = "") String mhfDate1, 
							@RequestParam(value = "mhfDate2",required = false, defaultValue = "") String mhfDate2) {
		
//		int pageSize = 4;
//		int pageGroup = 5;
//		String type = "";
//		String keyWord = "";
		int startRow = 0;
		int pageSize = 10;
		System.out.println("mhName : "+mhName);
		System.out.println("mhGen : "+mhGen);
//		int listCount = mainService.mhrSrch(startRow, pageSize, mhName, mhGen, mhInfoDate1, mhInfoDate2, mhrLocalCode);
//		Map<String, Object> mhrSrch = gms.pageList(listCount, pageSize, pageGroup, pageNum, type, keyWord);
		
		List<MhReport> mhrSrch = mainService.mhrSrch(startRow, pageSize, mhName, mhGen, mhInfoDate1, mhInfoDate2, mhrLocalCode);
		model.addAttribute("mhrSrch",mhrSrch);
		
		List<MhFind> mhfSrch = mainService.mhfSrch(startRow, pageSize, mhfDate1, mhfDate2);
		model.addAttribute("mhfSrch",mhfSrch);
		
		
		return"main/mhpSearchView";
	}
}
