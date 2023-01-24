<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<body>
<c:if test="${not empty searchList}">
	<h2>자료가 있습니다.</h2>
	<c:forEach var = "searchList" items="${searchList}">
		<c:if test="${(searchList.tableType) == '01'}" var="searchList">
			${searchList.searchTitle}
		</c:if>
	</c:forEach>
</c:if>

<c:if test="${empty searchList}">
	<h2> 자료가 없습니다.</h2>
</c:if>

</body>
