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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login_new.css">
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
			alert('회원가입 후 이용해주세요.');
			location.href='join';
		} else {
			location.href='goCart?u_id='+u_id;
		}
	}
	
	function goMypage(u_id) {
		if(u_id == 'anonymousUser') {
			alert('회원가입 후 이용해주세요.');
			location.href='join';
		} else {
			location.href='mypage?u_id='+u_id;
		}
	}
	
	function searchFrmChk() {
		var frm = document.searchFrm;
		if(frm.searchKeyword.value == "") {
			alert("검색어를 입력해주세요.");
			frm.searchKeyword.focus();
			return false;
		}
	}
	
	function loginFrm() {
		var frm = document.loginForm;
		if(frm.username.value == "") {
			alert("아이디를 입력해주세요.");
			frm.username.focus();
			return false;
		} else if(frm.password.value == "") {
			alert("비밀번호를 입력해주세요.");
			frm.password.focus();
			return false;
		} else {
			$.ajax({
				url : 'loginCheckAjax',
				type : 'post',
				data : {
					username : $('#username').val(),
					password : $('#password').val()
				},
				success : function(result) {
					if(result == -1) {
						alert('비밀번호가 잘못되었습니다.');
						return false;
					} else if(result == 0) {
						alert('아이디가 잘못되었습니다.');
						return false;
					} else if(result == 1) {
						frm.submit();
					} else {
						alert('알수없는 오류가 발생했습니다.');
						return false;
					}
				}
			});
			return false;
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
  			<sec:authorize access="isAnonymous()">
				<li><a onclick="clkLogin()" href="#" data-toggle="modal" data-target="#login-modal">로그인</a></li>
			</sec:authorize>
				 
			<sec:authorize access="isAuthenticated()">
				<li><a href="<c:url value="/j_spring_security_logout"/>">로그아웃</a></li>
			</sec:authorize>
				
			<sec:authorize access="hasRole('ROLE_ADM')">
				<li><a href="${pageContext.request.contextPath}/admin/adminPage">관리자페이지</a></li>
			</sec:authorize>
			
			<sec:authorize access="isAnonymous()">
				<li><a href="join">회원가입</a></li>
			</sec:authorize>
			<li><a onclick="goMypage('<%=username%>')" style="cursor:pointer;">마이페이지</a></li>
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
					<form action="searchItem" method="post" name="searchFrm" onsubmit="return searchFrmChk()">
						<input type="text" class="form-control" name="searchKeyword" placeholder="Search">
					</form>
				</li>
			</ul>
		</div>

<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
	<div class="modal-dialog">
		<div class="loginmodal-container">
			<h1>SampleMall 로그인</h1><br>
				<form action="login" method="post" onsubmit="return loginFrm()" name="loginForm">
					<input class="form-control" type="text" id="username" name="username" maxlength="20" placeholder="아이디 입력">
					<input class="form-control" type="password" id="password" name="password" maxlength="20" placeholder="비밀번호 입력">
					<input class="login loginmodal-submit" type="submit" onclick="return loginFrm()" value="LOGIN" class="submitBtn">
				</form>
				<div class="login-help">
					<a href="forgotPw">비밀번호 찾기</a>
				</div>
		</div>
	</div>
</div>