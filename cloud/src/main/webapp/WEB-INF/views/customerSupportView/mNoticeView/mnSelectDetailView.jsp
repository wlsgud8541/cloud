<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- content -->
<div class="w3-content">
	<div class="my-4">
		<h3>${mnotice.mnTitle}</h3>
	</div>
	<div>
		<table class="topbox">
			<tr>
				<td class="gunThWriter py-2"><b>&nbsp;&nbsp;${mnotice.mnWriter}</b></td>
				<td class="gunThDate py-2"><fmt:formatDate
						value="${mnotice.mnRegDate}" pattern="yyyy-MM-dd HH:mm" /></td>
				<td class="gunThReadCount ms-3 py-2">μ‘°νμ : ${mnotice.mnReadCnt }</td>
			</tr>
			<c:if test="${mnotice.mnAddFile != null}">
			<tr>
				<td class="py-2">&nbsp;&nbsp;πΎ | <a href="fileDownload?fileName=${mnotice.mnAddFile}">λ€μ΄λ‘λ</a></td>
			</tr>	
			</c:if>
			<c:if test="${mnotice.mnAddFile == null}">
			<tr>
				<td class="py-2">&nbsp;&nbsp;πΎ | νμΌμμ</td>
			</tr>	
			</c:if>
			 
		</table>
		<div class="py-4 px-3">
			<pre>${mnotice.mnContent }</pre>
		</div>
	</div>
	<div class="boxLine"></div>
	<div class="row">
		<div class="col text-center mt-4">
		<c:if test="${sessionScope.userId == 'admin0001'}">
			<input type="button" class="btn btn-outline-success" id="mnUpdate" data-mnNo="${mnotice.mnNo}" data-pageNum="${pageNum}"value="μμ νκΈ°"> 
			<input type="button" class="btn btn-outline-success  mx-3"  id="mnDelete" data-mnNo="${mnotice.mnNo}" data-pageNum="${pageNum}"value="μ­μ νκΈ°" />
		</c:if> 
			<input type="button" onclick="location.href='mnSelectList?pageNum=${pageNum}'" class="btn btn-outline-success" value="λͺ©λ‘μΌλ‘" />
		</div>
	</div>
</div>