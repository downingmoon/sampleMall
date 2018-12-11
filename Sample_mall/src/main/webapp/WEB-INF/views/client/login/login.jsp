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

    <div class="loginFrm" style="align-items:center;justify-content:center;display:flex;margin-top:135px;">
      <form action="login" method="post" onsubmit="return loginFrm()" name="loginForm">
        <table class="loginTable" style="width:50%;height:30%;">
          <tr>
            <td>
              <input style="width:100%;" type="text" id="username" name="username" maxlength="20" placeholder="아이디 입력">
            </td>
          </tr>
          <tr>
            <td>
              <input style="width:100%;" type="password" id="password" name="password" maxlength="20" placeholder="비밀번호 입력">
            </td>
          </tr>
          <tr>
            <td>
              <input style="width:100%;" type="submit" value="LOGIN" class="submitBtn">
            </td>
          </tr>
        </table>
      </form>
    </div>


  </body>
</html>
