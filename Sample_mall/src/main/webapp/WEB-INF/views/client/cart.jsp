<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
장바구니
<c:forEach var="list" items="${list}">
	<pre>
		번호          물품명          가격          수량
		${list.c_no}          ${list.p_name}          ${list.p_price}원          ${lisst.amount}
	</pre>
</c:forEach>