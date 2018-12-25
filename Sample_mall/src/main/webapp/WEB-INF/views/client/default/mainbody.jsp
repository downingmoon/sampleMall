<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<div class="slideImg">
	<!-- TODO: 이미지 슬라이드 쇼 들어가기 -->
	<div class="sliderDiv">
		<div id="thumbnail-slider">
			<div class="inner">
				<ul>
					<c:forEach items="${mainImg}" var="mainImg">
					<li>
						<img class="thumb" src="/shop/resources/img/mainPageImage/${mainImg.m_no}/${mainImg.m_imgname}">
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
<c:choose>
	<c:when test="${list.size() == 0}">
		<center><h4>등록된 상품이 없습니다.</h4></center>
	</c:when>
	<c:otherwise>
	<div class="row">
		<c:forEach items="${list}" var="list">
			<div class="col-md-3 col-xs-6 col-lg-3 col-xl-2">
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
								<span class="label label-danger">품절</span>
							</c:when>
							<c:otherwise>
								가격 : ${list.p_price}원<br>
							</c:otherwise>
						</c:choose>
				</a><br>
			</div>
		</c:forEach>
	</div>
	</c:otherwise>
	</c:choose>
	</div>

