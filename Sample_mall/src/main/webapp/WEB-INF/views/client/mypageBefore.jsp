<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	window.onload = function() {
		var frm = document.myPageForm;
		frm.u_pw.focus();
	}
	//function myPageSubmitChk() {
	//	var frm = document.myPageForm;
	//	if(frm.u_pw.value == "") {
	//		alert('비밀번호가 입력되지 않았습니다.');
	//		frm.u_pw.focus();
	//		return false;
	//	}
	//}
	
	function myPageSubmitChk() {
		var frm = document.myPageForm;
		if(frm.u_pw.value == "") {
			alert("비밀번호를 입력해주세요.");
			frm.u_pw.focus();
			return false;
		} else {
			$.ajax({
				url : 'loginCheckAjax',
				type : 'post',
				data : {
					username : $('#u_id').val(),
					password : $('#u_pw').val()
				},
				success : function(result) {
					if(result == -1) {
						alert('비밀번호가 잘못되었습니다.');
						return false;
					} else if(result == 1) {
						frm.submit();
					} else {
						alert('알수없는 오류가 발생했습니다.');
						return false;
					}
				}
			});
			return false;
		}	
	}
</script>
<div class="col-md-10">
	<form style="margin-top:15px;"action="mypage" name="myPageForm" method="post" onsubmit="return myPageSubmitChk()">
		<small>비밀번호를 입력해주세요.</small><br>
		<input type="password" class="form-control" name="u_pw" id="u_pw">
		<input type="hidden" name="u_id" value="${u_id}" id="u_id">
		<button type="submit" class="btn btn-primary">확인</button>
	</form>
</div>