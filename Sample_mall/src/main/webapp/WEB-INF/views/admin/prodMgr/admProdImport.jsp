<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath}/resources/js/admProdMod.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admProdInsert.css">

<script>
	$(function() {
		$('.')
	})
</script>

<form action="prodImport" method="post" onsubmit="return chkSubmit()" onreset="return chkReset()" name="frm" enctype="multipart/form-data">
<div class="container">
	<div class="row">
		<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 toppad">
			<div class="panel panel-info">
				<div class="panel-body">
					<div class="row">
						<div class="col-md-12 col-lg-12 ">
							<table class="table table-user-information">
								<tbody>
									<tr>
										<td>입고된 상품번호:</td>
										<td><select class="form-control" name="p_no" class="p_no">
										<c:forEach var="list" items="${list}">
											<option value="${list.p_no}">${list.p_no}-${list.p_name}</option>
										</c:forEach>
										</select></td>
									</tr>
									<tr>
										<td>입고수량 : </td>
										<td><input class="form-control" type="number" name="stock" class="stock"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="panel-footer">
					<button type="submit" class="btn btn-sm btn-primary">
						<i class="glyphicon glyphicon-check"></i></button> <span class="center">
					<button type="button" class="btn btn-sm btn-primary" onclick="location.href='prodInsert'">상품등록</button>
					</span>
				</div>
			</div>
		</div>
	</div>
</div>
</form>
