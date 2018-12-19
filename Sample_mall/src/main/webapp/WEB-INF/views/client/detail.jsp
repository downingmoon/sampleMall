<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.springframework.security.core.Authentication"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
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
	<img src="${pageContext.request.contextPath}/resources/img/bestItem/${detail.p_mainimg}.jpg">
		<div class="detailInfo">
			<form action="goCart" method="post" onsubmit="return clkGoCart()">
			<p style="font-size: 2em;">상품명 : ${detail.p_name}</p>
			<p style="font-size : 1em;">가격 : ${detail.p_price}</p>
			수량 : <input type="number" id="amount" name="amount" value="1"><br>
			<button type="submit">장바구니 담기</button>
			<button type="button" onclick="clkGoPay(${detail.p_no}, document.getElementById('amount'))">구매하기</button>
			<input type="hidden" name="p_no" value="${detail.p_no}">
			<input type="hidden" name="u_id" value="<%=username%>">
			</form>
		</div>
			
</div>
<p>상품상세설명 : ${detail.p_info}</p>

