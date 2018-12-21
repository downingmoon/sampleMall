<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


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

