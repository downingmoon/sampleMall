<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<center><h3>TOP100</h3></center>
<c:set var="data" value="${list.stock}" />

<div class="items">
		<c:forEach items="${list}" var="list">
			<div class="itemInfo">
				<a href="detail?p_no=${list.p_no}"> 
				<img style="size: width:600px; height: 300px;"src="${pageContext.request.contextPath}/resources/img/bestItem/${list.p_mainimg}.jpg"><br>
					${list.p_name}<br>
					<c:choose>
					<c:when test="${data le 10}">
					가격 : ${list.p_price}원 품절임박<br>
					</c:when>
					<c:when test="${data eq 0}">
					품절<br>
					</c:when>
					<c:otherwise>
					가격 : ${list.p_price}원<br>
					</c:otherwise>
					</c:choose>
				</a><br>
			</div>
		</c:forEach>

	</div>