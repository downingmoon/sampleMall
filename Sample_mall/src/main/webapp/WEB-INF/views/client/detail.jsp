<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>
	
	function clkGoCart(p_no) {
		var frm = document.createElement("form");
		frm.method="POST";
		frm.action="goCart";
		
		var ipt1 = document.createElement("input");
		ipt1.value = p_no;
		ipt1.name = "p_no";
		
		frm.appendChild(ipt1);
		document.body.appendChild(frm);
		frm.submit();
		alert("상품이 장바구니에 담겼습니다.");
	}
	
</script>

<div class="detail">
	<img src="${pageContext.request.contextPath}/resources/img/bestItem/${detail.p_no}.jpg">
		<div class="detailInfo">
			<p style="font-size: 2em;">상품명 : ${detail.p_name}</p>
			<p style="font-size : 1em;">가격 : ${detail.p_price}</p>
			<button onclick="clkGoCart(${detail.p_no})">장바구니 담기</button>
			<button onclick="clkGoPay(${detail.p_no})">구매하기</button>
		</div>
			
</div>
<p>상품상세설명 : ${detail.p_info}</p>

