<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="${pageContext.request.contextPath}/resources/js/admProdMod.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admProdInsert.css">

<form action="purchaseComplete" method="post" onsubmit="return chkSubmit()" onreset="return chkReset()" name="frm" enctype="multipart/form-data">
<div class="container">
	<div class="row">
		<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 toppad">
			<div class="panel panel-info">
				<div class="panel-body">
					<div class="row">
						<div class="col-md-12 col-lg-12 ">
							<table class="table table-user-information">
								<center><h3>주문내역</h3></center>
								<tbody>
									<tr>
										<td>주문번호 : </td>
										<td><div class="col-md-6">${vo.b_no}</div></td>
									</tr>
									
									<tr>
										<td>주문일자 : </td>
										<td><div class="col-md-6">${vo.b_regdate}</div></td>
									</tr>
									<tr>
										<td>구매자명 : </td>
										<td><div class="col-md-6">${vo.b_u_name}</div></td>
									</tr>
									<tr>
										<td>상품명 : </td>
										<td><div class="col-md-6">${vo.b_p_name}</div></td>
									</tr>
									<tr>
										<td>구매수량 : </td>
										<td><div class="col-md-6">${vo.b_amount}</div></td>
									</tr>
									<tr>
										<td>결제수단 : </td>
										<td><div class="col-md-6">${vo.b_paytype}</div></td>
									</tr>
									<c:set value="${vo.b_paytype}" var="data"/>
									<c:if test="${data == '계좌이체'}">
										<tr>
											<td>입금계좌 : </td>
											<td><div class="col-md-6">대구은행 031 - 07 - 025862 - 1 문다운</div></td>
										</tr>
									</c:if>
									<tr>
										<td>결제금액 : </td>
										<td><div class="col-md-6">${totalPrice}원</div></td>
									</tr>
									<tr>
										<td>받는사람 : </td>
										<td><div class="col-md-6">${vo.b_receivername}</div></td>
									</tr>
									<tr>
										<td>받는사람 연락처 : </td>
										<td><div class="col-md-6">${vo.b_receiverphone}</div></td>
									</tr>
									<tr>
										<td>받는사람 주소 : </td>
										<td><div class="col-md-6">${vo.b_address}</div></td>
									</tr>
									<tr>
										<td>배송메시지 : </td>
										<td><div class="col-md-6">${vo.d_del_msg}</div></td>
									</tr>
									<tr>
										<td>적립된 포인트 : </td>
										<td><div class="col-md-6">${vo.b_savingpoint}</div></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
			</div>
		</div>
	</div>
</div>
</div>
</form>
