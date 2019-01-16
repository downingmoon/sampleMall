<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.springframework.security.core.Authentication"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	String username = auth.getName();
	pageContext.setAttribute("br", "<br>");
	pageContext.setAttribute("cn", "\n");
%>
<script src="${pageContext.request.contextPath}/resources/js/detail.js"></script>

<div class="container">
	<div class="row">
		<div class="col-xs-4 col-md-4 col-lg-4 item-photo">
			<img class="img"
				src="/shop/resources/img/product/mainImg/${detail.p_no}/${detail.p_mainimg}.jpg" />
		</div>
		<div class="col-xs-8 col-md-8 col-lg-8" style="border: 0px solid gray">
			<h3>${detail.p_name}</h3>
			<h6 class="title-price">
				<small style="color: #337ab7;">판매가격</small>
			</h6>
			<h3 style="margin-top: 0px;">
				<c:set var="data" value="${detail.stock}" />
				<c:choose>
					<c:when test="${data <= 10 && data > 0}">
								${detail.p_price}원&nbsp;
								<small style="color: red;">품절임박! 남은수량 ${detail.stock}개!</small>
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
            <c:choose>
            	<c:when test="${data != 0}">
            	
			<form action="buyProd" method="post" name="frm" onsubmit="return chkBeforePay('<%=username%>')">
				<div class="section" style="padding-bottom: 20px;">
					<h6 class="title-attr">
						<small style="color: #337ab7;">수량</small>
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

				<div class="btn-group btn-group-justified" role="group"
					style="padding-bottom: 20px; width: 70%;">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-primary addToCart">
							<span style="margin-right: 20px"
								class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
							장바구니 담기
						</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-primary" onclick="return chkBeforePay(1,'<%=username%>')">
							<span style="margin-right: 20px" class="glyphicon glyphicon-ok"
								aria-hidden="true"></span> 바로구매
						</button>
					</div>
				</div>
				<div class="btn-group btn-group-justified" role="group"
					style="padding-bottom: 20px; width: 70%;">
					<div class="btn-group" role="group">
						<button type="button" onclick="return chkBeforePay(2,'<%=username%>')" class="btn btn-secondary">
							<span style="margin-right: 20px" class="glyphicon glyphicon-user"
								aria-hidden="true"></span> 비회원 구매
						</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" id="wishBtn" class="btn btn-danger addToWishList">
							<span id="wish" class="glyphicon glyphicon-heart-empty"
								style="margin-right: 20px; font-size: 1em"></span> 상품 찜하기
						</button>
						<!-- 찜한 상품은 empty 빼기 -->
					</div>
				</div>
				<input type="hidden" name="p_no" id="p_no" value="${detail.p_no}">
				<input type="hidden" name="u_id" id="u_id" value="<%=username%>">
				<input type="hidden" name="p_name" id="p_name" value="${detail.p_name}">
				<input type="hidden" name="p_price" id="p_price" value="${detail.p_price}">
			</form>
			</c:when>
				<c:otherwise>
					<h3>해당상품은 품절되었습니다.</h3>
				</c:otherwise>
            </c:choose>
		</div>
		<div class="col-xs-9 col-md-12 col-lg-12" style="text-align: center">
			<div style="width: 100%; border-top: 1px solid silver">
				<div class="com-md-12">
					<c:forEach var="list" items="${list}">
						<img src="/shop/resources/img/product/detailImg/${list.p_no}/${list.p_detailimg}.jpg" style="width:70%;height:70%">
				 	</c:forEach>
				<p style="padding: 15px;">${fn:replace(detail.p_info, cn, br)}</p>
				</div>
			</div>
		</div>
	</div>
</div>
</body>