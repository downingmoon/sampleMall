<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	function chkSubmitId() {
		var frm = document.frm_id;
		if(frm.u_name.value == "") {
			alert('이름을 입력해주세요.');
			frm.u_name.focus();
			return false;
		} else if(frm.u_phone.value == "") {
			alert('연락처를 입력해주세요.');
			frm.u_phone.focus();
			return false;
		} else if(frm.u_phone.value.length != 13) {
			alert('연락처는 "-"포함 13자리로 입력해주세요.');
			frm.u_phone.focus();
			return false;
		} else {
			$.ajax({
				url : 'findIdAjax',
				type : 'post',
				data : {
					u_name : $('.name').val(),
					u_phone : $('.phone').val()
				},
				success : function(result) {
					if(result == '-1') {
						if(confirm('정보와 일치하는 ID가 없습니다.\n확인을 누르시면 회원가입 화면으로 이동합니다.')) {
							location.href='join';
						}
					} else {
						alert('입력하신 정보와 일치하는 아이디는 "' + result +'"입니다.\n다시 로그인해주세요.');
						location.href='list'
					}
				},
				error : function() {
					alert('아이디를 찾는도중 에러가 발생했습니다.');
				}
			});
		}
	}
	
	function chkSubmitPw() {
		var frm = document.frm_pw;
		if(frm.u_id.value == "") {
			alert('아이디를 입력해주세요.');
			frm.u_id.focus();
			return false;
		} else {
			$.ajax({
				url : 'idCheckAjax',
				type : 'post',
				data : {
					u_id : $('.u_id').val()
				},
				success : function(result) {
					if(result == true) {
						alert('존재하지 않는 아이디입니다.\n아이디를 다시 확인해주세요.');
						return false;
					} else {
						return true;
					}
				},
				error : function() {
					alert('에러가 발생했습니다.');
					return false;
				}
			})
			
		}
	}
</script>
<div class="col-md-6 col-lg-6">
	<form name="frm_id">
		<table class="table">
			<tbody>
				<tr>
					<td><small>아이디 찾기</small></td>
				</tr>
				<tr>
					<td><input type="text" name="u_name" class="form-control name" placeholder="이름을 입력해주세요."></td>
				</tr>
				<tr>
					<td><input type="text" name="u_phone" class="form-control phone" placeholder="휴대폰 번호를 입력해주세요."></td>
				</tr>
				<tr>
					<td><button style="width:100%;"type="submit"  onclick="return chkSubmitId()" class="btn btn-primary">아이디 찾기</button></td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
<div class="col-md-6 col-lg-6">
	<form action="forgotPw" method="post" name="frm_pw" onsubmit="return chkSubmitPw()">
		<table class="table">
			<tbody>
				<tr>
					<td><small>비밀번호 찾기</small></td>
				</tr>
				<tr>
					<td><input type="text" name="u_id" class="form-control u_id" placeholder="아이디를 입력해주세요."></td>
				</tr>
				<tr>
					<td><button style="width:100%;"type="submit" class="btn btn-primary">비밀번호 찾기</button></td>
				</tr>
			</tbody>
		</table>
	</form>
</div>