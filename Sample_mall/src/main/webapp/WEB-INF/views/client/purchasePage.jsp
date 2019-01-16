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
	
	$(function() {
		$('.usePoint').change(function() {
			var originPoint = '${totalPrice}';
			var usingPoint = $('input[name=usePoint]').val();
			var maxPoint = ${uVo.u_point};
			if(usingPoint > maxPoint) {
				alert('포인트는 최대 ${uVo.u_point}점 까지 사용가능합니다.');
				$('input[name=usePoint]').val(${uVo.u_point});
			}
		});
	});
	
	function usePointSubmit() {
		var originPoint = '${totalPrice}';
		var usingPoint = $('input[name=usePoint]').val();
		var stringPrice = $('.payTotaPrice').text();
		var intPrice = parseInt(stringPrice.replace(',',''));
		var resultPriceInt = (intPrice - usingPoint);
		var parsing = resultPriceInt.toString();
	    var resultPriceString = parsing.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		if(usingPoint == 0) {
			$('.payTotaPrice').text(originPoint);
		} else {
			$('.payTotaPrice').text(resultPriceString);
		}
		
	}
	//TODO : 사용하는 포인트 차감, 실제 결제가격에서 차감.
</script>
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
										<th>상품명</th>
										<th>상품 가격</th>
										<th>수량</th>
									</tr>
									<c:forEach var="list" items="${prodList}">
										<tr>
											<td><a href="detail?p_no=${list.b_p_no}">${list.b_p_name}</a></td>
											<td>${list.b_p_price}</td>
											<td>${list.b_amount}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<!-- 
				<div class="col-md-12" style="float:left;border-top:1px solid #ddd;">
					<p>배송비 : 2,500원</p>
				</div> -->
				<div class="col-md-6">
					<small><b>구매자 정보</b></small>
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
					<small><b>배송지 정보</b></small>
						<table class="table table-user-information">
							<tr>
								<th>수령인 이름 : </th>
								<td><input type="text" class="form-control" name="b_receivername"></td>
							</tr>
							<tr>
								<th>전화번호(13자리) : </th>
								<td><input type="text" class="form-control" name="b_receiverphone" placeholder="'-'포함 해서 입력하세요."></td>
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
					<small style="color:#ddd12;">배송메시지를 입력해주세요. (선택)</small>
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
					<div class="col-md-6">
						<table>
							<tr>
								<td>사용가능 포인트 : </td>
								<td colspan="2">${uVo.u_point} point</td>
							</tr>
							<tr>
								<td>사용할 포인트 : </td>
								<td><input type="number" name="usePoint" class="usePoint form-control"></td>
								<td><button type="button" class="btn btn-default" onclick="usePointSubmit()">사용하기</button></td>
							</tr>
						</table>
					</div>
					<input type="hidden" name="u_point" value="${uVo.u_point}">
				</div>
				<div class="col-md-12">
					<h3 style="color:red;"><b>총 결제금액</b> : <b class="payTotaPrice">${totalPrice}</b>원<small>(상품가격+배송비)</small></h3>
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
<input type="hidden" name="b_u_no" value="${u_no}">
<input type="hidden" class="totalPrice" name="totalPrice" value="${totalPrice}">
<input type="hidden" name="u_id" value="${u_id}">
<c:forEach var="cno" items="${c_no}" varStatus="i">
	<input type="hidden" name="c_no" value="${cno}">
</c:forEach>
<c:forEach var="list" items="${prodList}" varStatus="i" >
	<input type="hidden" name="pList[${i.index}].b_p_no" value="${list.b_p_no}">
	<input type="hidden" name="pList[${i.index}].b_p_name" value="${list.b_p_name}">
	<input type="hidden" name="pList[${i.index}].b_amount" value="${list.b_amount}">
</c:forEach>
<input type="hidden" name="b_savingpoint" value="${prodList[0].b_savingpoint}">
</form>
