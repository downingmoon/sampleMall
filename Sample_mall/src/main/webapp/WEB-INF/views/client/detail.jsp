<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.springframework.security.core.Authentication"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	String username = auth.getName();
%>
<script>
	$(function() {
		$('.addToCart').on('click', function() {
			var u_id = $('#u_id').val();
			$.ajax({
				url:'addToCartAjax',
				type:'post',
				data: {
					amount:$('#amount').val(),
					u_id:$('#u_id').val(),
					p_no:$('#p_no').val()
				},
				success :function() {
					if(confirm('장바구니에 상품이 담겼습니다. 쇼핑을 계속하시겠습니까? 취소를 누르면 장바구니로 이동합니다.') != true) {
						location.href='goCart?u_id='+ u_id;
					}
				},
				error : function() {
					alert('장바구니에 담는도중 에러가 발생했습니다.');
				}
			});
		});
	});
	
</script>

<div class="detail">
	<img
		src="/shop/resources/img/product/mainImg/${detail.p_no}/${detail.p_mainimg}.jpg">
	<div class="detailInfo">
		<form action="buyProd" method="post" onsubmit="return clkGoCart()">
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
					<button type="button" class="addToCart">장바구니 담기</button>
					<button type="submit" onclick="clkGoPay(${detail.p_no}, document.getElementById('amount'))">구매하기</button>
				</c:when>
				<c:otherwise>
				품절된 상품은 구매할수 없습니다.
			</c:otherwise>
			</c:choose>
			<input type="hidden" name="p_no" id="p_no" value="${detail.p_no}">
			<input type="hidden" name="u_id" id="u_id" value="<%=username%>">
		</form>
	</div>

</div>
<p>상품상세설명 : ${detail.p_info}</p>
<!--  TODO : 상세이미지 불러오는 메소드  -->

