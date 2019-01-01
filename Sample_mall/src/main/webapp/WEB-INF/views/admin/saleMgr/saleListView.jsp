<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	function a(b_no) {
		console.log(b_no);
		$.ajax({
			url: 'delComplAjax',
			type: 'post',
			timeout : 5000,
			data : {
				b_no : b_no
			},
			success : function() {
				alert('주문번호 '+b_no+'번 발송 완료되었습니다.');
				location.reload();
			},
			error : function() {
				alert('error');
			}
		});
	}
</script>
<c:set var="data" value="${list}" />
<c:choose>
	<c:when test="${list.size() == 0}">
		<center>주문된 상품이 없습니다.</center>
	</c:when>
	<c:otherwise>
		<div class="col-md-6" style="width: 100%;">
			<div class="panel panel-primary">
				<table class="table table-hover" id="dev-table">
					<thead>
						<tr>
							<th>주문번호</th>
							<th>고객번호</th>
							<th>상품명</th>
							<th>수량</th>
							<th>결제방식</th>
							<th>주문일자</th>
							<th>총금액</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="list">
							<tr>
								<td>${list.b_no}</td>
								<td>${list.b_u_no}</td>
								<td>${list.b_p_name}</td>
								<td>${list.b_amount}</td>
								<td>${list.b_paytype}</td>
								<td>${list.b_regdate}</td>
								<td>${list.b_paytotal}</td>
								<td style="display: flex;">
									<button type="button" onclick="a('${list.b_no}')"
										class="btn btn-info btn-sm blue">
										발송완료
									</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</c:otherwise>
</c:choose>