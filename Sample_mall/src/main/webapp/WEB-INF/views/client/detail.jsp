<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.springframework.security.core.Authentication"%>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	String username = auth.getName();
%>
<script>
	
	function clkGoCart(p_no,u_no, amount) {
		var frm = document.createElement("form");
		frm.method="POST";
		frm.action="goCart";
		
		var prodNo = document.createElement("input");
		prodNo.value = p_no;
		prodNo.name = "p_no";
		
		var userNo = document.createElement("input");
		userNo.value = u_no;
		userNo.name = "u_no";
		
		frm.appendChild(prodNo);
		frm.appendChild(userNo);
		document.body.appendChild(frm);
		var yn = submit("상품을 장바구니에 담으시겠습니까?");
		if(yn == true) {
			frm.submit();
		}
	}
	
</script>

<div class="detail">
	<img
		src="/shop/resources/img/product/mainImg/${detail.p_no}/${detail.p_mainimg}.jpg">
	<div class="detailInfo">
		<form action="goCart" method="post" onsubmit="return clkGoCart()">
			<p style="font-size: 2em;">상품명 : ${detail.p_name}</p>
			<p style="font-size: 1em;">
				<c:set var="data" value="${detail.stock}" />
				<c:set var="data" value="${detail.stock}" />
				<c:choose>
					<c:when test="${data <= 10 && data > 0}">
								가격 : ${list.p_price}원<br>
					 			품절임박! 남은수량 ${detail.stock}개!<br>
					</c:when>
					<c:when test="${data == 0}">
						<div class="blinkcss">
							품절<br>
						</div>
					</c:when>
					<c:otherwise>
								가격 : ${detail.p_price}원<br>
					</c:otherwise>
				</c:choose>
			</p>
			수량 : <input type="number" id="amount" name="amount" value="1"><br>
			<c:choose>
				<c:when test="${data != 0}">
					<button type="submit">장바구니 담기</button>
					<button type="button" onclick="clkGoPay(${detail.p_no}, document.getElementById('amount'))">구매하기</button>
				</c:when>
				<c:otherwise>
				품절된 상품은 구매할수 없습니다.
			</c:otherwise>
			</c:choose>
			<input type="hidden" name="p_no" value="${detail.p_no}">
			<input type="hidden" name="u_id" value="<%=username%>">
		</form>
	</div>

</div>
<p>상품상세설명 : ${detail.p_info}</p>
<!--  TODO : 상세이미지 불러오는 메소드  -->

