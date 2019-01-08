<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.springframework.security.core.Authentication"%>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
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
	
	function chkAll() {
		if($('.chkPno').is(':checked')) {
			$('input[name=p_no]').prop('checked',false);
		} else {
			$('input[name=p_no]').prop('checked',true);
		}
	}
</script>
<form action="buyProductsInCart" name="frm" method="post"
	class="col-md-12">
	<div class="panel panel-default panel-table">
		<div class="panel-heading">
			<div class="row">
				<div class="col col-md-6">
					<h3 class="panel-title">장바구니</h3>
				</div>
			</div>
		</div>
		<c:set value="${list.size()}" var="data" />
		<c:choose>
			<c:when test="${data == 0}">
			장바구니에 상품이 없습니다.
		</c:when>
			<c:otherwise>
				<div class="panel-body">
					<table class="table table-bordered table-list">
						<thead>
							<tr>
								<th><input type="checkbox" onclick="chkAll()" id="allChk">모두선택</th>
								<th>번호</th>
								<th>상품명</th>
								<th>상품가격</th>
								<th>수량</th>
								<th></th>
							</tr>
						<thead>
						<tbody>
							<c:forEach var="list" items="${list}">
								<tr>
									<td><input class="chkPno" type="checkbox" name="p_no" value="${list.p_no}"></td>
									<td>${list.c_no}</td>
									<td>${list.p_name}</td>
									<td>${list.p_price}</td>
									<td>${list.amount}</td>
									<td><button type="button" class="btn btn-danger" onclick="cartDel(${list.c_no})">삭제</button></td>
								</tr>
								<input type="hidden" name="p_name" value="${list.p_name}">
								<input type="hidden" name="p_price" value="${list.p_price}">
								<input type="hidden" name="amount" value="${list.amount}">
								<input type="hidden" name="c_no" value="${list.c_no}">
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="panel-footer">
					<div class="row">
						<button type="submit" class="btn btn-primary">선택한 상품 구매</button>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<input type="hidden" id="u_id" name="u_id" value="${u_id}">
</form>
