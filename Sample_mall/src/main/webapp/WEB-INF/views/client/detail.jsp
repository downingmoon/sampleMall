<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.springframework.security.core.Authentication"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	String username = auth.getName();
%>
<script src="${pageContext.request.contextPath}/resources/js/detail.js"></script>
<!-- 
<div class="detail">
	<img
		src="/shop/resources/img/product/mainImg/${detail.p_no}/${detail.p_mainimg}.jpg">
	<div class="detailInfo">
		<form action="buyProd" method="post" onsubmit="return clkGoCart()">
			<p style="font-size: 2em;">상품명 : ${detail.p_name}</p>
			<p style="font-size: 1em;">
				<c:set var="data" value="${detail.stock}" />
				<c:choose>
					<c:when test="${data <= 10 && data > 0}">
								가격 : ${detail.p_price}원<br>
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
 -->
<div class="container">
	<div class="row">
		<div class="col-xs-4 col-md-4 col-lg-4 item-photo">
			<img class="img" src="/shop/resources/img/product/mainImg/${detail.p_no}/${detail.p_mainimg}.jpg" />
		</div>
		<div class="col-xs-8 col-md-8 col-lg-8" style="border: 0px solid gray">
			<h3>${detail.p_name}</h3>
			<h6 class="title-price">
				<small style="color:#337ab7;">판매가격</small>
			</h6>
			<h3 style="margin-top: 0px;">
				<c:set var="data" value="${detail.stock}" />
				<c:choose>
					<c:when test="${data <= 10 && data > 0}">
								${detail.p_price}원&nbsp;
								<small style="color:red;">품절임박! 남은수량 ${detail.stock}개!</small>
					</c:when>
					<c:when test="${data == 0}">
						<span class="label label-danger">품절</span>
					</c:when>
					<c:otherwise>
								${detail.p_price}원
					</c:otherwise>
				</c:choose>
			</h3>

			<!--  -----색상, 옵션-----
                    <div class="section">
                    
                        <h6 class="title-attr" style="margin-top:15px;" ><small>COLOR</small></h6>                    
                        <div>
                            <div class="attr" style="width:25px;background:#5a5a5a;"></div>
                            <div class="attr" style="width:25px;background:white;"></div>
                        </div>
                    </div>
                    <div class="section" style="padding-bottom:5px;">
                        <h6 class="title-attr"><small>CAPACIDAD</small></h6> 
                                            
                        <div>
                            <div class="attr2">16 GB</div>
                            <div class="attr2">32 GB</div>
                        </div>
                        
                    </div> 
                     -->
       <form>
			<div class="section" style="padding-bottom: 20px;">
				<h6 class="title-attr">
					<small style="color:#337ab7;">수량</small>
				</h6>
				<div>
					<div class="btn-minus">
						<span class="glyphicon glyphicon-minus"></span>
					</div>
					<input name="amount" id="amount" class="amount" value="1" />
					<div class="btn-plus">
						<span class="glyphicon glyphicon-plus"></span>
					</div>
				</div>
			</div>
			
			<div class="btn-group btn-group-justified" role="group" style="padding-bottom:20px;width:70%;">
				<div class="btn-group" role="group">
				<button class="btn btn-primary addToCart">
					<span style="margin-right: 20px"
						class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
					장바구니 담기
				</button>
				</div>
				<div class="btn-group" role="group">
				<button class="btn btn-primary">
					<span style="margin-right: 20px"
						class="glyphicon glyphicon-ok" aria-hidden="true"></span>
					바로구매
				</button>
				</div>
			</div>
			<div class="btn-group btn-group-justified" role="group" style="padding-bottom:20px;width:70%;">
				<div class="btn-group" role="group">
				<button class="btn btn-secondary">
					<span style="margin-right: 20px"
						class="glyphicon glyphicon-user" aria-hidden="true"></span>
					비회원 구매
				</button>
				</div>
				<div class="btn-group" role="group">
					<button id="wish" class="btn btn-danger addToWishList"><span class="glyphicon glyphicon-heart-empty"
						style="margin-right:20px;font-size: 1em"></span> 상품 찜하기</button>
						<!-- 찜한 상품은 empty 빼기 -->
				</div>
			</div>
			<input type="hidden" name="p_no" id="p_no" value="${detail.p_no}">
			<input type="hidden" name="u_id" id="u_id" value="<%=username%>">
			</form>
		</div>
		

		<div class="col-xs-9 col-md-12 col-lg-12">
			<div style="width: 100%; border-top: 1px solid silver">
				<p style="padding: 15px;">
					${detail.p_info} 
				</p>
				<!-- 
				<small>
					<ul class="ul">
						<li class="li">Super AMOLED capacitive touchscreen display
							with 16M colors</li>
						
					</ul>
				</small>
				 -->
			</div>
		</div>
	</div>
</div>
</body>


<!--  TODO : 상세이미지 불러오는 메소드  -->

