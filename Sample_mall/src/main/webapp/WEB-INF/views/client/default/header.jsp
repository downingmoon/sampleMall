<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.springframework.security.core.Authentication"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	String username = auth.getName();
%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menuBar.css">

<div class="header">
	<div class="logo">
		<a href="list" style="cursor: pointer;"> <img
			src="${pageContext.request.contextPath}/resources/img/mainLogo.jpg"
			style="width: 100%; height: 100%; object-fit: contain;" /></a>
	</div>
	<div class="headText">
		<ul class="loginMenu">
			<li>
				<sec:authorize access="isAnonymous()">
					<a href="login">로그인</a>
				</sec:authorize> 
				
				<sec:authorize access="isAuthenticated()">
					<a href="<c:url value="/j_spring_security_logout"/>">로그아웃</a>
				</sec:authorize>
				
				<sec:authorize access="hasRole('ROLE_ADM')">
					<a href="${pageContext.request.contextPath}/admin/adminPage">관리자페이지</a>
				</sec:authorize>
				</li>
			<li><a href="join">회원가입</a></li>
			<li><a href="mypage?id=<%=username%>">마이페이지</a></li>
			<li><a href="goCart?u_id=<%=username%>">장바구니</a></li>
			<li><a href="#">주문조회</a></li>
			<li><a href="#">1:1문의</a></li>
		</ul>
		<!-- 
		<ul class="userInfoMenu">
			<li> <%=username%>님 환영합니다. </li>
			<li>가용 포인트 : 0점</li>
			<li>등급 : 일반</li>
		</ul>
		 -->
	</div>
</div>

<div class='menu'>
			<ul>
				<li>
					<a href='list'>Home</a>
				</li>
				<li>
					<a href='bestItems'>Top100</a>
				</li>
				<li class='active sub'>
					<a href='allCategories'>All Categories</a>
					<ul>
						<li class='sub'>
							<a href='mainTypeList?mainType=clothes'>의류</a>
							<ul>
								<li>
									<a href='mtm'>맨투맨/후드</a>
								</li>
								<li>
									<a href='slacks'>슬랙스</a>
								</li>
								<li>
									<a href='jeans'>청바지/면바지</a>
								</li>
								<li class='last'>
									<a href='coat'>코트/점퍼</a>
								</li>
							</ul>
						</li>
						<li class='sub'>
							<a href='mainTypeList?mainType=shoes'>신발</a>
							<ul>
								<li>
									<a href='workingShoes'>운동화</a>
								</li>
								<li class='last'>
									<a href='walker'>워커/정장화</a>
								</li>
							</ul>
						</li>
						<li class='sub'>
							<a href='mainTypeList?mainType=others'>잡화</a>
							<ul>
								<li>
									<a href='cap'>모자</a>
								</li>
								<li>
									<a href='socks'>양말</a>
								</li>
								<li class='last'>
									<a href='acc'>악세서리</a>
								</li>
							</ul>
						</li>						
					</ul>
				</li>
				<li>
					<a href="noticeAndEvents">Notcie/Events</a>
				</li>
				<li class='last'>
					<form action="searchItem" method="post">
						<input type="text" name="searchKeyword" placeholder="Search">
					</form>
				</li>
			</ul>
		</div>