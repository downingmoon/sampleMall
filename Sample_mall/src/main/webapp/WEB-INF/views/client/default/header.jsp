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
<script>

	function otoInquire(u_id) {
		if(u_id == 'anonymousUser') {
			alert('회원가입 후 이용해주세요.');
			location.href='join';
		} else {
			location.href='otoInquire?u_id='+u_id;
		}
	}
	
	function goCartClk(u_id) {
		if(u_id == 'anonymousUser') {
			alert('비회원 장바구니 구현 준비중');
			location.href='join';
		} else {
			location.href='goCart?u_id='+u_id;
		}
	}
	
</script>
<div class="row">
	<div class="logo col-md-5">
		<a href="list" style="cursor: pointer;"> <img
			src="${pageContext.request.contextPath}/resources/img/mainLogo.jpg"
			style="width: 100%; height: 100%; object-fit: contain;" /></a>
	</div>
	<div class="headText col-md-7 navbar-right">
		<ol class="breadcrumb" style="background-color: #fff">
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
			<li><a onclick="goCartClk('<%=username%>')" style="cursor:pointer;">장바구니&nbsp;<span class="badge">${cnt}</span></a></li>
			<li><a href="orderView?u_id=<%=username%>">주문조회</a></li>
			<li><a onclick="otoInquire('<%=username%>')" style="cursor:pointer;">1:1문의</a></li>
		</ol>
		
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
									<a href='detailTypeList?type=mtm'>맨투맨/후드</a>
								</li>
								<li>
									<a href='detailTypeList?type=slacks'>슬랙스</a>
								</li>
								<li>
									<a href='detailTypeList?type=jeans'>청바지/면바지</a>
								</li>
								<li class='last'>
									<a href='detailTypeList?type=coat'>코트/점퍼</a>
								</li>
							</ul>
						</li>
						<li class='sub'>
							<a href='mainTypeList?mainType=shoes'>신발</a>
							<ul>
								<li>
									<a href='detailTypeList?type=workingshoes'>운동화</a>
								</li>
								<li class='last'>
									<a href='detailTypeList?type=walker'>워커/정장화</a>
								</li>
							</ul>
						</li>
						<li class='sub'>
							<a href='mainTypeList?mainType=others'>잡화</a>
							<ul>
								<li>
									<a href='detailTypeList?type=cap'>모자</a>
								</li>
								<li>
									<a href='detailTypeList?type=socks'>양말</a>
								</li>
								<li class='last'>
									<a href='detailTypeList?type=acc'>악세서리</a>
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