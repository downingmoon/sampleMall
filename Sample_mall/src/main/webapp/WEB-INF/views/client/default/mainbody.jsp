<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<div class="slideImg">
	<!-- TODO: 이미지 슬라이드 쇼 들어가기 -->
	<div class="sliderDiv">
		<div id="thumbnail-slider">
			<div class="inner">
				<ul>
					<c:forEach items="${list}" var="list">
					<li><a href="detail?p_no=${list.p_no}">
						<img class="thumb" src="${pageContext.request.contextPath}/resources/img/slider/${list.p_no}.jpg"></a>
					</li>
					</c:forEach>
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
			<div class="itemInfo">
				<a href="detail?p_no=${list.p_no}"> 
				<img style="size: width:600px; height: 300px;" src="/shop/resources/img/product/mainImg/${list.p_no}/${list.p_mainimg}.jpg"><br> 
					${list.p_name}<br> 
						<c:set var="data" value="${list.stock}" />
						<c:choose>
							<c:when test="${data <= 10 && data > 0}">
								가격 : ${list.p_price}원<br>
					 			품절임박! 남은수량 ${list.stock}개!<br>
							</c:when>
							<c:when test="${data == 0}">
								<div class="blinkcss">품절<br></div>
							</c:when>
							<c:otherwise>
								가격 : ${list.p_price}원<br>
							</c:otherwise>
						</c:choose>
				</a><br>
			</div>
		</c:forEach>

	</div>
</div>
