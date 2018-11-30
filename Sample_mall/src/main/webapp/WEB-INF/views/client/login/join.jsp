<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form onsubmit="return joinFrm()" name="joinForm">
		<p>
			<label for="u_id">아이디</label>
			<input type="text" id="u_id" name="u_id" value="joy97q12" />
		</p>
		<p>
			<label for="u_pw">비밀번호</label>
			<input type="password" id="u_pw" name="u_pw" value="1020" />
		</p>
		<p>
			<label for="u_pwChk">비밀번호 확인</label>
			<input type="password" id="u_pwChk" name="u_pwChk" value="1020" />
		</p>
		<p>
			<label for="u_name">이름</label>
			<input type="text" id="u_name" name="u_name" value="문다운"/>
		</p>
		<p>
			<label for="u_auth">권한</label>
			<input type="text" id="u_auth" name="u_auth" value="USER"/>
		</p>
		<button type="submit" class="btn">회원가입</button>
	</form:form>

