<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>List</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slideMenu.css">
  <script src="${pageContext.request.contextPath}/resources/js/slideMenu.js"></script>
  <script>
    function loginFrm() {
      var frm = document.loginForm;

      if(frm.u_id.value == "") {
        frm.u_id.focus();
        alert("ID가 입력되지 않았습니다.");
        return false;
      } else if(frm.u_pw.value == "") {
        frm.u_pw.focus();
        alert("비밀번호가 입력되지 않았습니다.");
        return false;
      }
      // TODO: function 한개 추가하기, 로그인한 사용자 이름 가져오는 함수
      alert("(이름넣기)님 환영합니다.");
      return false;
    }


    function clkTr(board_no) {
		//location.href="detail?board_no=" + board_no;
		var form = document.createElement("form");
	    form.method = "POST";
	    form.action = "detail";
	    var element1 = document.createElement("input");
	    element1.value=board_no;
	    element1.name="board_no";

	    form.appendChild(element1);
	    document.body.appendChild(form);
	    form.submit();
	}

  function clkLogin() {
    var popUrl = "${pageContext.request.contextPath}/client/login";
    var popOption = "width=200px,height=100px,left=700px,top=300px,resizable=no,menubar=no,directories=no"
    window.open(popUrl,"",popOption);
  }
  </script>
</head>
<body>
	<div class="bodywrap">
		<div class="header">
			<div class="logo">
				<a href="index.html" style="cursor: pointer;"> <img
					src="${pageContext.request.contextPath}/resources/img/mainLogo.jpg"
					style="width: 100%; height: 100%; object-fit: contain;" /></a>
			</div>
			<div class="headText">
				<ul class="loginMenu">
					<li><a href="javascript:clkLogin()">로그인</a></li>
					<li><a href="#">회원가입</a></li>
					<li><a href="#">마이페이지</a></li>
					<li><a href="#">주문조회</a></li>
					<li><a href="#">1:1문의</a></li>
				</ul>
				<!-- <h1>project</h1> -->
			</div>
		</div>
		<nav class="menuBar">
			<ul class="menuList">
				<li><a href="#">홈으로</a></li>
				<li><a href="#">메뉴1</a></li>
				<li><a href="#">메뉴2</a></li>
				<li><a href="#">메뉴3</a></li>
			</ul>
		</nav>

		<div class="container">
			<div class="slideImg">
				<!-- TODO: 이미지 슬라이드 쇼 들어가기 -->
				<div class="sliderDiv">
					<div id="thumbnail-slider">
						<div class="inner">
							<ul>
								<li><a href="#"><img class="thumb" src="${pageContext.request.contextPath}/resources/img/slider/1.jpg"></a></li>
								<li><a href="#"><img class="thumb" src="${pageContext.request.contextPath}/resources/img/slider/2.jpg"></a></li>
								<li><a href="#"><img class="thumb" src="${pageContext.request.contextPath}/resources/img/slider/3.jpg"></a></li>
								<li><a href="#"><img class="thumb" src="${pageContext.request.contextPath}/resources/img/slider/4.jpg"></a></li>
								<li><a href="#"><img class="thumb" src="${pageContext.request.contextPath}/resources/img/slider/5.jpg"></a></li>
								<li><a href="#"><img class="thumb" src="${pageContext.request.contextPath}/resources/img/slider/8.jpg"></a></li>
							</ul>
						</div>
					</div>
				</div>

			</div>
			<div class="bestItem">
				<!-- TODO: 베스트 상품 띄우기 -->
				<p>BEST ITEM</p>

				<div class="items">
				<c:forEach items="${list}" var="list">
					<a href="#"> <img src="${pageContext.request.contextPath}/resources/img/bestItem/${list.p_no}.jpg"><br>
						<div class="itemInfo">${list.p_name}<br> 
						가격 : ${list.p_price}원<br> 
						</div>
					</a>
					</c:forEach> 
					
				</div>
			</div>
			<!-- <div class="noticeBoard">

      </div> -->
		</div>

		<footer style="bottom: 0;">copyright@MDW All rights reserved</footer>
	</div>
</body>
</html>