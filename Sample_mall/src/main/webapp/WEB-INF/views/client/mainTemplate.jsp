
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("cn", "\n");
	pageContext.setAttribute("br", "<br>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slideMenu.css">
<script src="${pageContext.request.contextPath}/resources/js/slideMenu.js"></script>
<script>
	function clkTr(board_no) {
		//location.href="detail?board_no=" + board_no;
		var form = document.createElement("form");
		form.method = "POST";
		form.action = "detail";
		var element1 = document.createElement("input");
		element1.value = board_no;
		element1.name = "board_no";

		form.appendChild(element1);
		document.body.appendChild(form);
		form.submit();
	}

	function clkLogin() {
		var popUrl = "${pageContext.request.contextPath}/client/login";
		var popOption = "width=200px,height=100px,left=700px,top=300px,resizable=no,menubar=no,directories=no"
		window.open(popUrl, "", popOption);
	}
</script>
</head>
<body>
	<div class="bodywrap">

		<jsp:include page="default/header.jsp" />

		<div class="container">
		
			<jsp:include page="default/${target}.jsp" />
		
		</div>
		
		<jsp:include page="default/footer.jsp"/>

	</div>

</body>
</html>