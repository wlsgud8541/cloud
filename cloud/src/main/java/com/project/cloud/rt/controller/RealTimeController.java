package com.project.cloud.rt.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.cloud.rt.domain.RealTime;
import com.project.cloud.rt.service.RealTimeService;

@Controller
public class RealTimeController {
	
	@Autowired
	private RealTimeService rtService;
	
	private Logger logger = LoggerFactory.getLogger(RealTimeController.class);
	
	@RequestMapping("realTimeMhInfo")
	public String realTimeMhInfo(Model model, HttpSession session){
		Object sessionMmNo = session.getAttribute("mmNo");
		String mmNo = sessionMmNo.toString();
		
		logger.debug("mmNo : "+mmNo);
		
		List<RealTime> rtList = new ArrayList<RealTime>();
		//조회
		rtList = rtService.realTimeInfoData(mmNo);
		model.addAttribute("rtList", rtList);
		
		return "/realTimeInfo/realTimeMhInfo";
	}

	@RequestMapping("realTimeMhInfoAjax")
	@ResponseBody
	public List<RealTime> realTimeMhInfoAjax(String mmNo){
		List<RealTime> rtList = new ArrayList<RealTime>();
		rtList = rtService.realTimeInfoData(mmNo);
		
		return rtList;
	}
	
	@RequestMapping("realTimeInfoData")
	@ResponseBody
	public List<RealTime> realTimeInfoData(String mmNo, String strAddr, String latitude, String longitude){
		
		List<RealTime> rtList = new ArrayList<RealTime>();
		logger.debug("데이터 전송 테스트");
		logger.debug("mmNo : " + mmNo);
		logger.debug("strAddr : "+strAddr);
		//추가
		int result = rtService.realTimeInfoDataInsert(mmNo,strAddr,latitude,longitude);
		//조회
		rtList = rtService.realTimeInfoData(mmNo);
		
		return rtList;
	}
}
