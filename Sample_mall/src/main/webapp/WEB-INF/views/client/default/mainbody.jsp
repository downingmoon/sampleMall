<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="slideImg">
	<!-- TODO: 이미지 슬라이드 쇼 들어가기 -->
	<div class="sliderDiv">
		<div id="thumbnail-slider">
			<div class="inner">
				<ul>
					<li><a href="#"><img class="thumb"
							src="${pageContext.request.contextPath}/resources/img/slider/1.jpg"></a></li>
					<li><a href="#"><img class="thumb"
							src="${pageContext.request.contextPath}/resources/img/slider/2.jpg"></a></li>
					<li><a href="#"><img class="thumb"
							src="${pageContext.request.contextPath}/resources/img/slider/3.jpg"></a></li>
					<li><a href="#"><img class="thumb"
							src="${pageContext.request.contextPath}/resources/img/slider/4.jpg"></a></li>
					<li><a href="#"><img class="thumb"
							src="${pageContext.request.contextPath}/resources/img/slider/5.jpg"></a></li>
					<li><a href="#"><img class="thumb"
							src="${pageContext.request.contextPath}/resources/img/slider/6.jpg"></a></li>
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
				<a href="detail?p_no=${list.p_no}"> <img
					style="size: width:600px; height: 300px;"
					src="${pageContext.request.contextPath}/resources/img/bestItem/${list.p_no}.jpg"><br>
					${list.p_name}<br> 가격 : ${list.p_price}원<br>
				</a><br>
			</div>
		</c:forEach>

	</div>
</div>
