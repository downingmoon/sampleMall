<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<center><h3>${category}</h3></center>

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