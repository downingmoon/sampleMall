<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<center><h3>${category}</h3></center>
<c:choose>
	<c:when test="${list.size() == 0}">
		<center><h4>등록된 상품이 없습니다.</h4></center>
	</c:when>
	<c:otherwise>
<div class="row">
		<c:forEach items="${list}" var="list">
			<div style="height:380px;" class="col-xs-12 col-sm-6 col-md-4 col-lg-3 col-xl-2">
				<a href="detail?p_no=${list.p_no}"> 
					<img style="width:300px; height: 300px;"
					src="/shop/resources/img/product/mainImg/${list.p_no}/${list.p_mainimg}.jpg"><br>
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