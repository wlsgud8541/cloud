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
import com.project.cloud.mp.domain.MpProtect;
import com.project.cloud.mp.domain.MpReport;

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
		
//		Map<, V>
		
		List<MpReport> mainMprList = mainService.mainMprList();
		model.addAttribute("mainMprList",mainMprList);
		
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
	
	@RequestMapping("mhSearch")
	public String mhSearch(Model model,
							@RequestParam(value = "mhName",required = false, defaultValue = "") String mhName, 
							@RequestParam(value = "mhCode",required = false, defaultValue = "") String mhCode, 
							@RequestParam(value = "mhGen",required = false, defaultValue = "") String mhGen, 
							@RequestParam(value = "mhInfoDate1",required = false, defaultValue = "") String mhInfoDate1, 
							@RequestParam(value = "mhInfoDate2",required = false, defaultValue = "") String mhInfoDate2, 
							@RequestParam(value = "mhrLocalCode",required = false, defaultValue = "") String mhrLocalCode) {
		
		
		List<MhReport> mhrSrch = mainService.mhrSrchList(mhName,mhCode, mhGen, mhInfoDate1, mhInfoDate2, mhrLocalCode);
		
		model.addAttribute("mhrSrch",mhrSrch);
		
		return"main/mhSearchView";
	}
	
	@RequestMapping("mpSearch")
	public String mpSearch(Model model,
			@RequestParam(value = "mpGen",required = false, defaultValue = "") String mpGen, 
			@RequestParam(value = "mpType",required = false, defaultValue = "") String mpType, 
			@RequestParam(value = "mpKeyword",required = false, defaultValue = "") String mpKeyword, 
			@RequestParam(value = "mpDate1",required = false, defaultValue = "") String mpDate1, 
			@RequestParam(value = "mpDate2",required = false, defaultValue = "") String mpDate2, 
			@RequestParam(value = "mpLocalCode",required = false, defaultValue = "") String mpLocalCode) {
		
		List<MpReport> mprSrchList = mainService.mprSrchList(mpGen, mpType, mpKeyword, mpDate1, mpDate2, mpLocalCode);
		model.addAttribute("mprSrchList",mprSrchList);
		
		List<MpProtect> mppSrchList = mainService.mppSrchList(mpGen, mpType, mpKeyword, mpDate1, mpDate2, mpLocalCode);
		model.addAttribute("mppSrchList",mppSrchList);
		
		return "main/mpSearchView";
	}
}
