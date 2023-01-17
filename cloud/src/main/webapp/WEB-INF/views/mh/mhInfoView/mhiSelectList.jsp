<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<body>
  <table border="1" width="100%"> 
         <tr> 
             <th>발생일시</th> 
             <th>착의사항</th> 
             <th>현재나이</th> 
             <th>당시나이</th> 
             <th>대상구분</th> 
             <th>성별구분(여자, 남자)</th> 
             <th>발생장소</th> 
             <th>성명</th> 
             <th>사진</th>     
         </tr> 
      
        
          <c:if test="${not empty jMap}">
	         <c:forEach var="jMap" items="${jMap.jsonobj.list}">
	             <tr> 
	                 <td>${jMap.occrde}</td> 
	                 <td>${jMap.alldressingDscd}</td> 
	                 <td>${jMap.ageNow}</td> 
	                 <td>${jMap.age}</td> 
	                 <td>${jMap.writingTrgetDscd}</td>
	                 <td>${jMap.sexdstnDscd}</td> 
	                 <td>${jMap.occrAdres}</td> 
	                 <td>${jMap.nm}</td> 
	                 <td><a href='https://www.safe182.go.kr/home/lcm/lcmMssGet.do?gnbMenuCd=014000000000&lnbMenuCd=014001000000&rptDscd=2&msspsnIdntfccd=" + ${jMap.jsonobj.list.msspsnIdntfccd}+ "'><img style='width:96px;height:128px;' width='96' height='128' border='0' src='https://www.safe182.go.kr/api/lcm/imgView.do?msspsnIdntfccd="+${jMap.jsonobj.list.msspsnIdntfccd}+ "'/></a></td>
	        </c:forEach>
        </c:if>
        <c:if test = "${empty jMap}">
        	<h2>자료가 없습니다.</h2>
        </c:if>
<!--           <td><a href='https://www.safe182.go.kr/home/lcm/lcmMssGet.do?gnbMenuCd=014000000000&lnbMenuCd=014001000000&rptDscd=2&msspsnIdntfccd=" + list.msspsnIdntfccd + "'><img style='width:96px;height:128px;' width='96' height='128' border='0' src='https://www.safe182.go.kr/api/lcm/imgView.do?msspsnIdntfccd=" + list.msspsnIdntfccd + "'/></a></td>
         
        <td> &nbsp; </td>        
          </tr> --> 
        
         </table> 
</body>
