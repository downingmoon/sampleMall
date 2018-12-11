<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>

<center><form:form onsubmit="return joinFrm()" onreset="return confirm('정말로 다시 작성하시겠습니까? 작성중인 모든 내용이 지워집니다.')" name="joinForm" style="width:40%;">
	<table>
		<tr>
			<th>이름</th>
			<td><input type="text" id="u_name" name="u_name"/></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><input type="text" id="u_id" name="u_id"/></td>
		</tr> 
		<tr>
			<th>비밀번호</th>
			<td><input type="password" id="u_pw" name="u_pw"/></td>
		</tr> 
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="password" name="u_pwChk"/></td>
		</tr>
		<tr>
			<th>휴대폰번호</th>
			<td><input type="text" name="u_phone" maxlength="13"/></td>
		</tr>
		<tr>
			<th>주소(선택)</th>
			<td><input type="text" name="" class="postcodify_address" placeholder="기본주소"/>
			<input type="text" name="" class="postcodify_details" placeholder="상세주소"/>
			<button type="button"id="postcodify_search_button">검색</button>
			</td>
		</tr>
		<tr>
			<th>생일6자리(선택)</th>
			<td><input type="number" name="u_birth" maxlength="6"/></td>
		</tr>
		<tr>
			<th>비밀번호 분실시 질문</th>
			<td><select name="u_findpw_question">
				<option value="나의 보물 1호는?">나의 보물 1호는?</option>
				<option value="가장 좋아하는 게임은?">가장 좋아하는 게임은?</option>
				<option value="처음 키운 강아지의 이름은?">처음 키운 강아지의 이름은?</option>
				<option value="나의 고향은?">나의 고향은?</option>
				<option value="나의 좌우명은?">나의 좌우명은?</option>
			</select></td>
		</tr>
		<tr>
			<th>비밀번호 분실시 답변</th>
			<td><input type="text" name="u_findpw_answer"/></td>
		</tr>
		<tr>
			<th>권한</th>
			<td><input type="text" name="u_auth"/></td>
		</tr>
		<tr>
			<th><input style="float:right;" type="submit" value="회원가입"></th>
			<td><input type="reset" value="다시작성"></td>
		</tr>
		</table>
	</form:form>
</center>
