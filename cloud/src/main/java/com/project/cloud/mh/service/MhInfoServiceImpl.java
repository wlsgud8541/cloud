package com.project.cloud.mh.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cloud.mh.dao.MhInfoDao;
import com.project.cloud.mh.domain.MhInfo;

@Service
public class MhInfoServiceImpl implements MhInfoService{

	@Autowired
	MhInfoDao mhiDao;
	public void setMhInfoDao(MhInfoDao mhiDao) {
		this.mhiDao = mhiDao;
	}
	@Override
	public Map<String, Object> mhiSelectList() throws IOException, ParseException {
		String esntlId = "10000507";
	    String authKey = "94a1953804314fa1";
	    String rowSize = "10";
	    String pageNum = "1";
	    String[] writngTrgetDscds = {"010", "060", "070"};
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
	    params += "&rowSize=";
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
	         wr.close();
	         isr.close();
	         br.close();
	     }
	    String resultStr = result;
	    JSONParser jsonParser = new JSONParser();
	    JSONObject jsonobj = (JSONObject) jsonParser.parse(resultStr.replace("/\s/g", "<br />"));
	   Map<String,Object> jsonMap = new HashMap<String, Object>();
	   jsonMap.put("jsonobj", jsonobj);
	   jsonMap.put("occrde", detailDate1);
	   jsonMap.put("alldressingDscd", etcSpfeatr);
	   jsonMap.put("ageNow",age1);
	   jsonMap.put("age", age2);
	   jsonMap.put("writingTrgetDscd", writngTrgetDscds);
	   jsonMap.put("sexdstnDscd", sexdstnDscd);
	   jsonMap.put("occrAres", occrAdres);
	   jsonMap.put("nm", nm);
	   System.out.println(params);
	   System.out.println(jsonobj); 
		
		   return jsonMap;
	}

	@Override
	public MhInfo mhiSelectDetail() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int mhiInsert() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int mhiUpdate() {
		// TODO Auto-generated method stub
		return 0;
	}

}
