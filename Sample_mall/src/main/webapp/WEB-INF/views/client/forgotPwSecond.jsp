<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	function chkFindPw() {
		var frm = document.frm;
		if(frm.answer.value == "") {
			alert('답변이 입력되지 않았습니다.');
			frm.answer.focus();
			return false;
		} else if(frm.u_pw.value == "") {
			alert('비밀번호가 입력되지 않았습니다.');
			frm.u_pw.focus();
			return false;
		} else if(frm.u_pwChk.value == "") {
			alert('비밀번호 확인이 입력되지 않았습니다.');
			frm.u_pwChk.focus();
			return false;
		} else if(frm.u_pw.value != frm.u_pwChk.value) {
			alert('비밀번호와 비밀번호 확인이 다릅니다.');
			frm.u_pwChk.focus();
			return false;
		} else {
			$.ajax({
				url : 'pwAnswerChkAjax',
				type : 'post',
				data : {
					answer : frm.answer.value,
					u_id : frm.u_id.value
				},
				success : function(result) {
					if(result == false) {
						alert('비밀번호 찾기 답변이 맞지않습니다.');
						return false;
					} else {
						alert('비밀번호가 변경되었습니다.');
						frm.submit();
					}
				},
				error : function() {
					alert('에러가 발생했습니다.');
					return false;
				}
			});
			return false;
		}
	}
</script>
<form action="pwChange" name="frm">
	<div class="row" style="margin-top:15px;">
			<div class="col-md-12 col-lg-12 toppad">
				<div class="panel panel-info">
					<div class="panel-body">
						<div class="row">
							<div class=" col-md-12 col-lg-12 ">
								<table class="table table-user-information">
									<tbody>
										<tr>
											<td style="text-align: center;">비밀번호 찾기 질문 :</td>
											<td style="text-align: center;">${question}</td>
										</tr>
										<tr>
											<td style="text-align: center;">비밀번호 찾기 답변 : </td>
											<td><input type="text" name="answer" class="form-control answer"></td>
										</tr>
										<tr>
											<td style="text-align: center;">새 비밀번호 : </td>
											<td><input type="password" name="u_pw" class="form-control u_pw"></td>
										</tr>
										<tr>
											<td style="text-align: center;">비밀번호 확인 : </td>
											<td><input type="password" name="u_pwChk" class="form-control u_pwChk"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="panel-footer">
						<input type="hidden" name="u_id" value="${u_id}">
						<input type="submit" onclick="return chkFindPw()" value="비밀번호 재설정" class="btn btn-primary" >
					</div>
				</div>
			</div>
		</div>
	</form>