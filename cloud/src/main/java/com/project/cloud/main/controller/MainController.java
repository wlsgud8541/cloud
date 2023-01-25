package com.project.cloud.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.cloud.cs.domain.Mnotice;
import com.project.cloud.main.domain.Main;
import com.project.cloud.main.service.MainService;
import com.project.cloud.mh.controller.MhController;
import com.project.cloud.mh.domain.MhFind;
import com.project.cloud.mh.domain.MhInfo;
import com.project.cloud.mh.domain.MhReport;
import com.project.cloud.mh.service.MhInfoService;
import com.project.cloud.mp.domain.MpFind;
import com.project.cloud.mp.domain.MpProtect;
import com.project.cloud.mp.domain.MpReport;

@Controller
public class MainController {
	@Autowired
	private MainService mainService;
	
	@Autowired
	private MhInfoService mhiService;
	
	private Logger logger = LoggerFactory.getLogger(MainController.class);
	@RequestMapping("main")
	public String mainBoardList(Model model) {
		
		List<Mnotice> mainMnlist = mainService.mainMnList();
		model.addAttribute("mainMnList",mainMnlist);
		
		List<MhFind> mainMhfList = mainService.mainMhfList();
		model.addAttribute("mainMhfList",mainMhfList);
		  
		List<MpFind> mainMpfList = mainService.mainMpfList();
		model.addAttribute("mainMpfList", mainMpfList);
		
		List<MhInfo> mainMhiList = mainService.mainMhiList();
		model.addAttribute("mainMhiList",mainMhiList);
		
		try {
			List<MhInfo> mhiList = mhiService.mhiSelectList(0, 16, "", "", 0);
			model.addAttribute("jMap", mhiList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		List<MpReport> mainMprList = mainService.mainMprList();
		model.addAttribute("mainMprList",mainMprList);
		
		return "main/mainView";
	}
	
	@RequestMapping("myChartAjax")
	@ResponseBody
	public HashMap<String, List<Main>> myChartAjax(){
		
		HashMap<String, List<Main>> resultMap = new HashMap<String, List<Main>>();
		
		List<Main> mhGrph = mainService.mhGraph();
		List<Main> mpGrph = mainService.mpGraph();
		resultMap.put("mhGrph", mhGrph);
		resultMap.put("mpGrph", mpGrph);
		
		//System.out.println("mhG : " + mhGrph); System.out.println("mpG : " + mpGrph);
		
		return resultMap;
	}
	
	@RequestMapping("search")
	public String mainUsearch(Model model, @RequestParam(value="uSearch", required=false, defaultValue="") String uSearch,
											@RequestParam(value="type", required=false, defaultValue="") String type,
											@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum) {
	logger.debug("search : ");
	logger.debug(uSearch);
	List<Main> searchList  = mainService.mainUsearch(uSearch);
	model.addAttribute("searchList",searchList);
	model.addAttribute("uSearch",uSearch);
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
