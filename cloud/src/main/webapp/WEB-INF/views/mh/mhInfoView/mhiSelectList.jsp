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
	         <c:forEach var="jMap" items="${jMap}">
	             <tr> 
	                 <td>${jMap.mhiOccrde}</td> 
	                 <td>${jMap.mhiAlldressingDscd}</td> 
	                 <td>${jMap.mhiAgeNow}</td> 
	                 <td>${jMap.mhiAge}</td> 
	                 <td>${jMap.mhiWritngTrgetDscd}</td>
	                 <td>${jMap.mhiSexdstnDscd}</td> 
	                 <td>${jMap.mhiOccrAres}</td> 
	                 <td>${jMap.mhiNm}</td> 
	                 <td><a href='https://www.safe182.go.kr/home/lcm/lcmMssGet.do?gnbMenuCd=014000000000&lnbMenuCd=014001000000&rptDscd=2&msspsnIdntfccd=${jMap.mhiMsspsnIdntfccd}'><img style='width:96px;height:128px;' width='96' height='128' border='0' src='https://www.safe182.go.kr/api/lcm/imgView.do?msspsnIdntfccd=${jMap.mhiMsspsnIdntfccd}'/></a></td>
	        </c:forEach>
        	
        </c:if>
        <c:if test = "${empty jMap}">
        	<h2>자료가 없습니다.</h2>
        </c:if>
<!--           <td><a href='https://www.safe182.go.kr/home/lcm/lcmMssGet.do?gnbMenuCd=014000000000&lnbMenuCd=014001000000&rptDscd=2&msspsnIdntfccd=" + list.msspsnIdntfccd + "'><img style='width:96px;height:128px;' width='96' height='128' border='0' src='https://www.safe182.go.kr/api/lcm/imgView.do?msspsnIdntfccd=" + list.msspsnIdntfccd + "'/></a></td>
         
        <td> &nbsp; </td>        
          </tr> --> 
        
   </table> 
   <div class="row">
				<div class="col">
					<nav>
						<ul>
							<c:if test="${startPage > pagegroup}">
								<li class="page-item">
									<a class="page-link" href="mhInfo?pageNum=${startPage - pagegroup}">Pre</a>
								</li>
							</c:if>
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i == currentPage}">
									<li class="page-item">
										<span class="page-link">${i}</span>
									</li>
								</c:if>
								<c:if test="${i != currentPage}">
									<li><a class="page-link" href="mhInfo?pageNum=${i}">${i}</a></li>
								</c:if>
							</c:forEach>
							<c:if test="${endPage>pageCount}">
								<li class="page-item">
									<a class="page-link" href="mhInfo?pageNum=${startPage+pagegroup}">Next</a>
								</li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
</body>
