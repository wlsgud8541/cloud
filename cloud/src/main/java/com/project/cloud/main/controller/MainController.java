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
}
