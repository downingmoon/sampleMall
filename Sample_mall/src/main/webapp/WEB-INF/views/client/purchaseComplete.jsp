<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="${pageContext.request.contextPath}/resources/js/admProdMod.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admProdInsert.css">
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>

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
									<tr>
										<td>결제금액 : </td>
										<td><div class="col-md-6">${vo.b_paytotal}</div></td>
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
										<td>적립된 포인트 : </td>
										<td><div class="col-md-6">${vo.b_savingpoint}</div></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				<div class="panel-footer"> 
					<button type="reset" class="btn btn-sm btn-secondory">
						<i class="glyphicon glyphicon-return">뒤로가기</i></button>
					<span class="center">
						<button type="submit" class="btn btn-sm btn-danger">
							<i class="glyphicon glyphicon-check">구매하기</i></button>
					</span>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</form>
