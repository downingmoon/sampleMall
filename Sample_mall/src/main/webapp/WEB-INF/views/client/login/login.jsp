<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>로그인</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
  </head>
  <body>

    <div class="loginFrm">
      <form action="login" method="post" onsubmit="return loginFrm()" name="loginForm">
        <table class="loginTable">
          <tr>
            <td>
              <input type="text" id="username" name="u_id" size="20" maxlength="20" placeholder="아이디 입력">
            </td>
          </tr>
          <tr>
            <td>
              <input type="password" id="password" name="u_pw" size="20" maxlength="20" placeholder="비밀번호 입력">
            </td>
          </tr>
          <tr>
            <td>
              <input type="submit" value="로그인" class="submitBtn">
            </td>
          </tr>
        </table>
      </form>
    </div>

  </body>
</html>
