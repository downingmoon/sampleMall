<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
<script>
window.onload = function() {
	alert("권한은 ADM, USER 두가지로 입력해주세요. \nUSER : 유저\nADM : 관리자(관리자페이지 진입가능)");
}
	function chkJoinSubmit() {
		var frm = document.frm;
		
		if(frm.u_name.value == "") {
			alert("이름을 입력해주세요.");
			frm.u_name.focus();
			return false;
		} else if(frm.u_pw.value != frm.u_pwChk.value) {
			alert("비밀번호가 일치하지 않습니다.");
			frm.u_pwChk.focus();
			return false;
		} else if(frm.u_phone.value.length != 13) {
			alert("휴대폰 번호는 13자리('-'포함)로 입력해주세요.");
			frm.u_phone.focus();
			return false;
		} else if(frm.u_auth.value != 'ADM' || frm.u_auth.value != 'USER') {
			alert("권한은 ADM, USER 두가지로 입려해주세요. \n USER : 유저\n ADM : 관리자(관리자페이지 진입)");
			 from.u_auth.focus();
			 return false;
		}
	}
</script>

<center><form:form onsubmit="return chkJoinSubmit()" onreset="return confirm('정말로 다시 작성하시겠습니까? 작성중인 모든 내용이 지워집니다.')" name="frm" style="width:60%;">
	<table class="table">
		<tr>
			<th>이름</th>
			<td><input class="form-control" type="text" id="u_name" name="u_name" required/></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><input class="form-control" type="text" id="u_id" name="u_id" required/></td>
		</tr> 
		<tr>
			<th>비밀번호</th>
			<td><input class="form-control" type="password" id="u_pw" name="u_pw" required/></td>
		</tr> 
		<tr>
			<th>비밀번호 확인</th>
			<td><input class="form-control" type="password" name="u_pwChk" required/></td>
		</tr>
		<tr>
			<th>휴대폰번호</th>
			<td><input class="form-control" type="text" name="u_phone" maxlength="13" placeholder="ex)010-0000-0000" required/></td>
		</tr>
		<tr>
			<th>주소(선택)</th>
			<td>
				<input type="text" name="u_mainaddress" class="postcodify_address form-control" placeholder="기본주소"/>
				<input type="text" name="u_subaddress" class="postcodify_details form-control" placeholder="상세주소"/>
				<button type="button"id="postcodify_search_button" class="btn btn-primary">검색</button>
			</td>
		</tr>
		<tr>
			<th>생일6자리(선택)</th>
			<td><input class="form-control" type="number" name="u_birth" maxlength="6" placeholder="ex)190101"/></td>
		</tr>
		<tr>
			<th>비밀번호 분실시 질문</th>
			<td><select class="form-control" name="u_findpw_question" required>
				<option value="나의 보물 1호는?">나의 보물 1호는?</option>
				<option value="가장 좋아하는 게임은?">가장 좋아하는 게임은?</option>
				<option value="처음 키운 강아지의 이름은?">처음 키운 강아지의 이름은?</option>
				<option value="나의 고향은?">나의 고향은?</option>
				<option value="나의 좌우명은?">나의 좌우명은?</option>
			</select></td>
		</tr>
		<tr>
			<th>비밀번호 분실시 답변</th>
			<td><input class="form-control" type="text" name="u_findpw_answer" required/></td>
		</tr>
		<tr>
			<th>권한</th>
			<td><input class="form-control" type="text" name="u_auth" placeholder="ADM 혹은 USER" required/></td>
		</tr>
		<tr>
			<th><input class="btn btn-primary" style="float:right;" type="submit" value="회원가입"></th>
			<td><input class="btn btn-danger" type="reset" value="다시작성"></td>
		</tr>
		</table>
	</form:form>
</center>
