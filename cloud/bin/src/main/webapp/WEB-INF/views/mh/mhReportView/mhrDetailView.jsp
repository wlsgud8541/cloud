<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실종자 상세화면</title>
</head>
<body>
		${report.mhrNo },${report.mhrName},${report.mhrage},${report.mhrIllCode},
		${report.mhrGen},${report.mhrHeight},${report.mhrWeight},${report.mhrFace},
		${report.mhrHairColor},${report.mhrHair},${report.mhrWear},${report.mhrStatusCode},
		${report.mhrLocalCode},${report.mhrTitle},${report.mhrContent}
		
		
</body>
</html>