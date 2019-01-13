<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	window.onload = function() {
		if(${delCnt} != 0 || ${otoCnt} != 0) {
			alert('발송대기중 상품 : ${delCnt}건 \n답변대기중인 문의 : ${otoCnt}건 있습니다.');	
		}
	}
</script>
SampleMall 관리자페이지 입니다.<br>
