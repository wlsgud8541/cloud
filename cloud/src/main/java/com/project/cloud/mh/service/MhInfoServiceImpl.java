package com.project.cloud.mh.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.cloud.mh.dao.MhInfoDao;
import com.project.cloud.mh.domain.MhInfo;

@Service
public class MhInfoServiceImpl implements MhInfoService {

	@Autowired
	MhInfoDao mhiDao;

	public void setMhInfoDao(MhInfoDao mhiDao) {
		this.mhiDao = mhiDao;
	}

	@Override
	public List<MhInfo> mhiSelectList(int startRow, int pageSize, String type,String keyword,int pageCnt) throws IOException, ParseException, java.text.ParseException {
		/*
		  String esntlId = "10000513"; 
		  String authKey = "5d25f42ea60f4dd4";
		  */
		/* 
		String esntlId = "10000507";
		String authKey = "94a1953804314fa1";
		*/
		  
		  String esntlId = "10000515";
		  String authKey = "488bd9120cc840f4";
		  
		int rowSize= 12;
		int pageNum = pageCnt;
	    String[] writngTrgetDscds = {"010", "060", "070"};  
	    // 실종자 상태 코드 값 010 : 정상아동 | 020: 가출인 | 040: 시설보호무연고자 
	    //| 060 : 지적장애인 | 061: 지적장애인(18세미만) | 062: 지적장애인(18세 이상)
	    //| 070 : 치매환자 | 080 : 불상(기타) 
	    String sexdstnDscd = "";
	    String nm = "";
	    String detailDate1 = "";
	    String detailDate2 = "";
	    String age1 = "";
	    String age2 = "";
	    String etcSpfeatr = "";
	    String occrAdres = "";
	    String xmlUseYN = "";

	    String urlStr = "https://www.safe182.go.kr/api/lcm/findChildList.do";
	    String params = "esntlId=";
	    params += esntlId;
	    params += "&authKey=";
	    params += authKey;
	    params +="&rowSize=";
	    params += rowSize; 
    	params += "&page=";
    	params += pageNum;
	    for(int i=0; i<writngTrgetDscds.length; i++){
	        params += "&writngTrgetDscds=";
	        params += writngTrgetDscds[i];
	    }

	    params += "&sexdstnDscd=";
	    params += sexdstnDscd;
	    params += "&nm=";
	    params += nm;
	    params += "&detailDate1=";
	    params += detailDate1;
	    params += "&detailDate2=";
	    params += detailDate2;
	    params += "&age1=";
	    params += age1;
	    params += "&age2=";
	    params += age2;
	    params += "&etcSpfeatr=";
	    params += etcSpfeatr;
	    params += "&occrAdres=";
	    params += occrAdres;
	    params += "&xmlUseYN=";
	    params += xmlUseYN;
	    System.out.println(params);
	    URL url;
	    URLConnection connection;
	    OutputStreamWriter wr = null;
	    InputStreamReader isr = null;
	    BufferedReader br = null;

	    String result = "";
	
	    try{
	        url = new URL(urlStr);
	        connection = url.openConnection();
	        connection.setDoOutput(true);

	        wr = new OutputStreamWriter(connection.getOutputStream());
	        wr.write(params);
	        wr.flush();

	        isr = new InputStreamReader(connection.getInputStream(), "utf-8");
	        br = new BufferedReader(isr);
	        String buf = "";

	        while(true){
	             buf = br.readLine();
	             if(buf == null){
	                 break;
	             }else{
	                 result = buf;
	             }
	         }

	     } catch(MalformedURLException e){
	         e.printStackTrace();
	     } catch(IOException ioe){
	         ioe.printStackTrace();
	     } finally {
	    	 br.close();
	    	 isr.close();
	         wr.close();
	     }
	    String resultStr = result;
	    JSONParser jsonParser = new JSONParser();
	    JSONObject jsonobj = (JSONObject) jsonParser.parse(resultStr.replace("/\s/g", "<br />"));
	    
	    Map<String,Object> jsonMap = new HashMap<String,Object>();
	    jsonMap.put("jsonobj", jsonobj);
	    jsonMap.put("totalCount", jsonMap.get("totalCount"));
		   return mhiDao.mhiSelectList(startRow, pageSize, type, keyword);
	}

	@Override
	public MhInfo mhiSelectDetail() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int mhiInsert(MhInfo mhInfo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int mhiUpdate() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<MhInfo> lastIndex() {
		
		return mhiDao.lastIndex();
	}

	@Override
	public Map<String, Object> mhiAPIcount() {
		
		return null;
	}

	@Override
	public int mhinfoBackup() {
		
		return mhiDao.mhinfoBackup();
	}

	@Override
	public String mhiDay() {
		if(mhiDao.mhiDay() == null) {
			LocalDate now = LocalDate.now();
			String tmp = now + "";
			System.out.println(tmp+": 시간확인");
			return tmp;
		}
		return mhiDao.mhiDay();
	}

	@Override
	public int mhiCount() {
		
		return mhiDao.mhiCount();
	}

	@Override
	public Map<String,Object> mhiScheduler(int pageCnt) throws IOException, ParseException {
		/*
		String esntlId = "10000513"; 
		String authKey = "5d25f42ea60f4dd4";
		*/
		 /*
		String esntlId = "10000507";
		String authKey = "94a1953804314fa1";
		*/
		  
	  String esntlId = "10000515";
	  String authKey = "488bd9120cc840f4";
		int rowSize= 10;
		int pageNum = pageCnt;
	    String[] writngTrgetDscds = {"010", "060", "070"};  
	    // 실종자 상태 코드 값 010 : 정상아동 | 020: 가출인 | 040: 시설보호무연고자 
	    //| 060 : 지적장애인 | 061: 지적장애인(18세미만) | 062: 지적장애인(18세 이상)
	    //| 070 : 치매환자 | 080 : 불상(기타) 
	    String sexdstnDscd = "";
	    String nm = "";
	    String detailDate1 = "";
	    String detailDate2 = "";
	    String age1 = "";
	    String age2 = "";
	    String etcSpfeatr = "";
	    String occrAdres = "";
	    String xmlUseYN = "";

	    String urlStr = "https://www.safe182.go.kr/api/lcm/findChildList.do";
	    String params = "esntlId=";
	    params += esntlId;
	    params += "&authKey=";
	    params += authKey;
	    params +="&rowSize=";
	    params += rowSize; 
	  	params += "&page=";
	  	params += pageNum;
	    for(int i=0; i<writngTrgetDscds.length; i++){
	        params += "&writngTrgetDscds=";
	        params += writngTrgetDscds[i];
	    }

	    params += "&sexdstnDscd=";
	    params += sexdstnDscd;
	    params += "&nm=";
	    params += nm;
	    params += "&detailDate1=";
	    params += detailDate1;
	    params += "&detailDate2=";
	    params += detailDate2;
	    params += "&age1=";
	    params += age1;
	    params += "&age2=";
	    params += age2;
	    params += "&etcSpfeatr=";
	    params += etcSpfeatr;
	    params += "&occrAdres=";
	    params += occrAdres;
	    params += "&xmlUseYN=";
	    params += xmlUseYN;
	    System.out.println(params);
	    URL url;
	    URLConnection connection;
	    OutputStreamWriter wr = null;
	    InputStreamReader isr = null;
	    BufferedReader br = null;

	    String result = "";
	
	    try{
	        url = new URL(urlStr);
	        connection = url.openConnection();
	        connection.setDoOutput(true);

	        wr = new OutputStreamWriter(connection.getOutputStream());
	        wr.write(params);
	        wr.flush();

	        isr = new InputStreamReader(connection.getInputStream(), "utf-8");
	        br = new BufferedReader(isr);
	        String buf = "";

	        while(true){
	             buf = br.readLine();
	             if(buf == null){
	                 break;
	             }else{
	                 result = buf;
	             }
	         }

	     } catch(MalformedURLException e){
	         e.printStackTrace();
	     } catch(IOException ioe){
	         ioe.printStackTrace();
	     } finally {
	    	 br.close();
	    	 isr.close();
	         wr.close();
	     }
	    String resultStr = result;
	    JSONParser jsonParser = new JSONParser();
	    JSONObject jsonobj = (JSONObject) jsonParser.parse(resultStr.replace("/\s/g", "<br />"));
	   Map<String,Object> jsonMap = new HashMap<String, Object>();
	   jsonMap.put("jsonobj", jsonobj);
	   jsonMap.put("totalCount", jsonobj.get("totalCount"));
	   System.out.println(jsonobj);
	   HashMap<String, Object> getJson = new ObjectMapper().readValue(jsonobj.toString(), HashMap.class);
	   List jsonList = (List) getJson.get("list");
		 int insertAPIResult = 0;
		   for (int i = 0; i < jsonList.size(); i++) {
			   HashMap<String, Object> insertMap = new HashMap<String, Object>();
			   insertMap = (HashMap<String, Object>)jsonList.get(i);
		   
			   MhInfo mhInfo = new MhInfo();
	
			   if((insertMap.get("sexdstnDscd")+"").equals("남자")) {
				   mhInfo.setMhiSexdstnDscd("M");
			   }else if((insertMap.get("sexdstnDscd")+"").equals("여자")) {
				   mhInfo.setMhiSexdstnDscd("F");
			   }
			   
			   mhInfo.setMhiAge(insertMap.get("age")+"");
			   mhInfo.setMhiAgeNow(insertMap.get("ageNow")+"");
			   mhInfo.setMhiAlldressingDscd(insertMap.get("alldressingDscd")+"");
			   mhInfo.setMhiBdwgh(insertMap.get("bdwgh")+""); 
			   mhInfo.setMhiNm(insertMap.get("nm")+"");
			   mhInfo.setMhiNo((int)insertMap.get("rnum"));
			   mhInfo.setMhiOccrAdres(insertMap.get("occrAdres")+"");
			   mhInfo.setMhiOccrde(insertMap.get("occrde")+"");
			   mhInfo.setMhiTknphotolength(insertMap.get("tknphotolength")+"");
			   mhInfo.setMhiWritngTrgetDscd(insertMap.get("writngTrgetDscd")+"");
			   mhInfo.setMhiMsspsnIdntfccd(insertMap.get("msspsnIdntfccd")+"");
		   //map 추가
		   System.out.println("insertAPIResult : "+insertAPIResult);	   
				   insertAPIResult = insertAPIResult + mhiDao.mhiInsert(mhInfo);
			  }
			
			   System.out.println("API 데이터 INSERT 결과 수 : " + insertAPIResult);
			   
			if((long)jsonobj.get("totalCount") == insertAPIResult) {
				  System.err.println("데이터 누락건 발생");
			  }else {
				  System.out.println("데이터 정상 입력");
		  }
			return jsonMap;
	}
}
