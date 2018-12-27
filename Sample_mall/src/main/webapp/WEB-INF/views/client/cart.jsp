<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.springframework.security.core.Authentication"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	String username = auth.getName();
%>
<script>
	function cartDel(c_no) {
		var u_id = $('#u_id').val(); 
		$.ajax({
			url:"cartDeleteAjax",
			type:"post",
			data: {
				c_no : c_no,
				u_id : u_id
			},
			success : function() {
				alert("상품이 삭제되었습니다.");
				location.reload();
			},
			error : function() {
				alert("삭제도중 에러가 발생했습니다.");
			}
		});
	}
</script>

<center><h3>장바구니</h3></center><br>
<c:set value="${list.size()}" var="data"/>

<c:choose>
	<c:when test="${data == 0}">
		장바구니에 상품이 없습니다.
	</c:when>
	<c:otherwise>
<table class="table table-striped table-bordered table-list">
	<tr>
		<th>번호</th>
		<th>상품명</th>
		<th>상품가격</th>
		<th>수량</th>
		<th></th>
	</tr>
	<c:forEach var="list" items="${list}">
		<tr>
			<td>${list.c_no}</td>
			<td>${list.p_name}</td>
			<td>${list.p_price}</td>
			<td>${list.amount}</td>
			<td><button type="button" class="btn btn-danger" onclick="cartDel(${list.c_no})">삭제</button></td>
		</tr>
	</c:forEach>
</table>
<input type="hidden" id="u_id" value="<%=username%>">
	</c:otherwise>
</c:choose>