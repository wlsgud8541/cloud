package com.project.cloud.main.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.cloud.cs.domain.Mnotice;
import com.project.cloud.gm.service.GlobalMethodService;
import com.project.cloud.main.service.MainService;
import com.project.cloud.mh.domain.MhFind;
import com.project.cloud.mh.domain.MhReport;
import com.project.cloud.mp.domain.MpFind;

@Controller
public class MainController {
	@Autowired
	private MainService mainService;
	@Autowired
	private GlobalMethodService gms;
	
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
							@RequestParam(value = "mhGen",required = false, defaultValue = "") String mhGen, 
							@RequestParam(value = "mhInfoDate1",required = false, defaultValue = "") String mhInfoDate1, 
							@RequestParam(value = "mhInfoDate2",required = false, defaultValue = "") String mhInfoDate2, 
							@RequestParam(value = "mhrLocalCode",required = false, defaultValue = "") String mhrLocalCode) {
		
		int pageSize = 10;
		int pageGroup = 5;
		int listCount = mainService.mhrCnt(mhName, mhGen, mhInfoDate1, mhInfoDate2, mhrLocalCode);
		
		String type = "";
		String keyWord = "";
		
		
		System.out.println("mhName : "+mhName);
		System.out.println("mhGen : "+mhGen);
		
		Map<String, Object> mhrSrchPage = gms.pageList(listCount, pageSize, pageGroup, pageNum, type, keyWord);
		int startRow1 = (int)mhrSrchPage.get("startRow");
		List<MhReport> mhrSrch = mainService.mhrSrchList(startRow1, pageSize, mhName, mhGen, mhInfoDate1, mhInfoDate2, mhrLocalCode);
		
		mhrSrchPage.put("mhrSrch", mhrSrch);
		mhrSrchPage.put("listCount", listCount);
		mhrSrchPage.put("pageGroup", pageGroup);
		mhrSrchPage.put("mhName", mhName);
		mhrSrchPage.put("mhGen", mhGen);
		mhrSrchPage.put("mhInfoDate1", mhInfoDate1);
		mhrSrchPage.put("mhInfoDate2", mhInfoDate2);
		mhrSrchPage.put("mhrLocalCode", mhrLocalCode);
		
		model.addAllAttributes(mhrSrchPage);
		
		return"main/mhpSearchView";
	}
}
