<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath}/resources/js/admProdMod.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admProdInsert.css">
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
<script>
	function chkSubmit() {
		var frm = document.frm;
		if(frm.b_receivername.value == "") {
			alert("수령인 이름을 입력해주세요.");
			frm.b_receivername.focus();
			return false;
		}else if(frm.b_receiverphone.value == "") {
			alert("수령인 연락처를 입력해주세요.");
			frm.b_receiverphone.focus();
			return false;
		}else if(frm.b_receiverphone.value.length != 13) {
			alert("연락처는 13자리로 입력해주세요.('-' 포함)");
			frm.b_receiverphone.focus();
			return false;
		}else if(frm.mainAddr.value == "") {
			alert("배송지를 입력해주세요.");
			frm.mainAddr.focus();
			return false;
		}else if(frm.subAddr.value == "") {
			alert("배송지를 입력해주세요.");
			frm.subAddr.focus();
			return false;
		}else if(frm.b_paytype.value == "") {
			alert("결제수단을 선택해주세요.");
			frm.b_paytype.focus();
			return false;
		}else {
			return true;
		}
	}
</script>
<form action="nonMemberPurchaseComplete" method="post" onsubmit="return chkSubmit()" onreset="return chkReset()" name="frm" enctype="multipart/form-data">
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
										<th>상품명</th>
										<th>상품 가격</th>
										<th>수량</th>
									</tr>
										<tr>
											<td>${p_name}</td>
											<td>${p_price}</td>
											<td>${amount}</td>
										</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- 
				<div class="col-md-12" style="float:left;border-top:1px solid #ddd;">
					<p>배송비 : 2,500원</p>
				</div> -->
				<div class="col-md-12">
					<small>배송지 정보</small>
						<table class="table table-user-information">
							<tr>
								<th>수령인 이름 : </th>
								<td><input type="text" class="form-control" name="b_receivername"></td>
							</tr>
							<tr>
								<th>수령인 전화번호 : </th>
								<td><input type="text" class="form-control" name="b_receiverphone"></td>
							</tr>
							<tr>
								<th>수령인 배송지 </th>
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
				<div class="col-md-12">
					<small>결제수단</small><br>
					<select name="b_paytype" class="form-control">
						<option value="">-----결제수단을 선택해주세요-----</option>
						<option value="카드결제">카드결제</option>
						<option value="계좌이체">계좌이체</option>
					</select>
				</div>
				<div class="col-md-12" style="border-top:1px solid #ddd"><br>
					<p>사용가능 포인트 : 1000 point</p>
				</div>
				<div class="col-md-12">
					<h3 style="color:red;"><b>총 결제금액</b> : ${totalPrice}원<small>(상품가격+배송비)</small></h3>
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
<input type="hidden" name="totalPrice" value="${totalPrice}">
<c:forEach var="list" items="${prodList}" varStatus="i" >
	<input type="hidden" name="pList[${i.index}].b_p_no" value="${list.b_p_no}">
	<input type="hidden" name="pList[${i.index}].b_p_name" value="${list.b_p_name}">
	<input type="hidden" name="pList[${i.index}].b_amount" value="${list.b_amount}">
</c:forEach>
</form>
