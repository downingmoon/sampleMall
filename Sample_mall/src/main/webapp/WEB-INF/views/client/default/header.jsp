<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="header">
	<div class="logo">
		<a href="list" style="cursor: pointer;"> 
		<img src="${pageContext.request.contextPath}/resources/img/mainLogo.jpg"
			style="width: 100%; height: 100%; object-fit: contain;" /></a>
	</div>
	<div class="headText">
		<ul class="loginMenu">
			<li><a href="${pageContext.request.contextPath}/client/login">로그인</a></li>
			<li><a href="${pageContext.request.contextPath}/client/join">회원가입</a></li>
			<li><a href="#">마이페이지</a></li>
			<li><a href="#">주문조회</a></li>
			<li><a href="#">1:1문의</a></li>
		</ul>
	</div>
</div>
<nav class="menuBar">
	<ul class="menuList">
		<li><a href="list">홈으로</a></li>
		<li><a href="#">메뉴1</a></li>
		<li><a href="#">메뉴2</a></li>
		<li><a href="#">메뉴3</a></li>
	</ul>
</nav>