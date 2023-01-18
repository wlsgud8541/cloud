<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Cloud</title> 
	<!--
		BoardController에서 클래스 레벨에 @RequestMapping 애노테이션을 사용해
		별도로 경로 매핑을 하지 않고 boardList(Model model) 메서드에만
		@RequestMapping({"/boardList", "/list"}) 애노테이션으로 요청 매핑을 설정했다.
		그리고 WEB-INF/spring/appServlet/servlet-context.xml에서 정적 리소스와
		관련된 url 맵핑을 아래와 같이 설정했기 때문에
		<mvc:resources mapping="/resources/**" location="/resources/" />		
		css의 위치를 "resources/css/index.css"와 같이 지정해야 한다.
	 
		브라우저 주소 표시줄에 http://localhost:8080/springstudy-bbs01/list
		또는 http://localhost:8080/springstudy-bbs01/boardList 등으로
		표시되므로 css 디렉터리는 ContextRoot/resources/css에 위치하기 때문에 현재
		위치를 기준으로 상대 참조 방식으로 "resources/css/index.css"를 지정해야 한다.
	-->	
	<title>스프링 게시판</title>	
	<link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet" >
	<link rel="stylesheet" type="text/css" href="resources/css/w3.css" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">		
	<link rel="stylesheet" type="text/css" href="resources/css/board.css" />	
	<link rel="stylesheet" type="text/css" href="resources/css/member.css" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
	
	<script src="resources/js/jquery-3.2.1.min.js"></script>
	<script src="resources/js/member.js"></script>
	<script src="resources/js/notice.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<c:if test="${param.body == 'views/main/mainView.jsp'}">
<body class="bodyBg">
</c:if>
<c:if test="${param.body != 'main/mainView'}">
<body>
</c:if>
	<div>
      <c:if test="${param.body != 'views//mMemberView/mmPassChangeView.jsp'}">
         <%@ include file="template/header.jsp" %>
      </c:if>
      
      <div style="margin-top: 220px;"class="container">
         <jsp:include page="${ param.body }" />
      </div>

      <c:if test="${param.body != 'views//mMemberView/mmPassChangeView.jsp'}">
         <%@ include file="template/footer.jsp" %>
      </c:if>
   </div>
    <script src="resources/bootstrap/bootstrap.bundle.min.js"></script>	
</body>
</html>