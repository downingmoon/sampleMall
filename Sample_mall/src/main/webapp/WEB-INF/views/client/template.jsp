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
<title>Dahwoon Moon Portfolio</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">

<!--link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css"-->

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slideMenu.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detail.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/slideMenu.js"></script>
<script>
	function loginFrm() {
		var frm = document.loginForm;

		if (frm.u_id.value == "") {
			frm.u_id.focus();
			alert("ID가 입력되지 않았습니다.");
			return false;
		} else if (frm.u_pw.value == "") {
			frm.u_pw.focus();
			alert("비밀번호가 입력되지 않았습니다.");
			return false;
		}
		// TODO: function 한개 추가하기, 로그인한 사용자 이름 가져오는 함수
		return true;
		alert(frm.u_id.value + "님 환영합니다.");
	}

	function joinFrm() {
		var frm = document.joinForm;

		if (frm.u_id.value == "") {
			frm.u_id.focus();
			alert("ID가 입력되지 않았습니다.");
			return false;
		} else if (frm.u_pw.value == "") {
			frm.u_pw.focus();
			alert("비밀번호가 입력되지 않았습니다.");
			return false;
		} else if (frm.u_pw.value != frm.u_pwChk.value) {
			frm.u_pwChk.focus();
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			return false;
		} else if (frm.u_pwChk.value == "") {
			frm.u_pwChk.focus();
			alert("비밀번호 확인이 입력되지 않았습니다.");
			return false;
		} else if (frm.u_name.value == "") {
			frm.u_name.focus();
			alert("이름이 입력되지 않았습니다.");
			return false;
		} else if (frm.u_auth.value == "") {
			frm.u_auth.focus();
			alert("권한이 입력되지 않았습니다.");
			return false;
		}
		alert(frm.u_name.value + "님 회원가입 완료. 다시 로그인 해주세요.");
		return true;
	}

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
</script>
</head>
<body>
	<div class="bodywrap">

		<jsp:include page="default/header.jsp" />

		<div class="container">
			<jsp:include page="${target}.jsp" />
		</div>
		<jsp:include page="default/footer.jsp" />

	</div>

</body>
</html>