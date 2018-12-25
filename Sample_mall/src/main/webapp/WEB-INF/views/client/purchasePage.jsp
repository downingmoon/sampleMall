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
								<center><h3>${p_name} 구매</h3></center>
								<tbody>
									<tr>
										<td>상품명 : </td>
										<td><div class="col-md-6">${p_name}</div></td>
									</tr>
									<tr>
										<td>상품가격 : </td>
										<td><div class="col-md-6">${p_price}원</div></td>
									</tr>
									<tr>
										<td>수량 : </td>
										<td><div class="col-md-6">${amount}</div></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- 
				<div class="col-md-12" style="float:left;border-top:1px solid #ddd;">
					<p>배송비 : 2,500원</p>
				</div> -->
				<div class="col-md-6">
					<small><b>구매자 정보</b></small> 기본배송지<input type="radio" name="shipAddress" checked="checked"> 신규배송지<input type="radio" name="shipAddress">
						<table class="table table-user-information">
							<tr>
								<th>이름 : </th>
								<td>${uVo.u_name}</td>
							</tr>
							<tr>
								<th>전화번호 : </th>
								<td>${uVo.u_phone}</td>
							</tr>
							<tr>
								<th>주소 : </th>
								<td>${uVo.u_mainaddress}, ${uVo.u_subaddress}</td>
						</table>
				</div>
				<div class="col-md-6">
					<small>배송지 정보</small>
						<table class="table table-user-information">
							<tr>
								<th>받으시는분 이름 : </th>
								<td><input type="text" class="form-control" name="b_receivername"></td>
							</tr>
							<tr>
								<th>전화번호 : </th>
								<td><input type="text" class="form-control" name="b_receiverphone"></td>
							</tr>
							<tr>
								<th>배송지 설정 </th>
								<th><button type="button" class="btn btn-md btn-primary" id="postcodify_search_button">검색</button> </th>
							</tr>
							<tr>
								<td><input type="text" name="mainAddr" class="postcodify_address form-control" placeholder="기본주소"/></td>
								<td><input type="text" name="subAddr" class="postcodify_details form-control" placeholder="상세주소"/></td>
							</tr>
						</table>
				</div>
				<div class="col-md-12">
					<small style="color:#ddd12;">배송메시지를 입력해주세요.</small>
					<textarea class="form-control" rows="5" name="d_del_msg" placeholder="배송메시지는 최대 30자까지 입력가능합니다."></textarea><br>
				</div>
				<div class="col-md-12" style="border-top:1px solid #ddd"><br>
					<p>사용가능 포인트 : 1000 point</p>
				</div>
				<div class="col-md-12">
					<h3 style="color:red;"><b>총 결제금액</b> : ${p_price}원<small>(상품가격)</small> + 2,500원<small>(배송비)</small></h3><br>
					<h4 style="color:red;">= 13,502,500원</h4>
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
<input type="hidden" name="b_p_no" value="${p_no}">
<input type="hidden" name="b_u_no" value="${u_no}">
<input type="hidden" name="b_p_name" value="${p_name}">
<input type="hidden" name="b_amount" value="${amount}">
</form>
