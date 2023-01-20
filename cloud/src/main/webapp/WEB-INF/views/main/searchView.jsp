<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body>
<c:if test="${not empty searchList}">
	<c:forEach var = "list" items="${searchList}">
		${list.writer}
	</c:forEach>
</c:if>


</body>
