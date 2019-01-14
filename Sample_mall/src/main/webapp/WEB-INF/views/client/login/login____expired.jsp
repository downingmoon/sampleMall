<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<div style="align-items: center;">
      <form action="login" method="post" onsubmit="return loginFrm()" name="loginForm">
        <div class="col-md-10">
              <input class="form-control" type="text" id="username" name="username" maxlength="20" placeholder="아이디 입력">
        </div>
        <div class="col-md-10">
              <input class="form-control" type="password" id="password" name="password" maxlength="20" placeholder="비밀번호 입력">
        </div>
        <div class="col-md-10">   
              <input class="btn btn-primary col-md-12" type="submit" value="LOGIN" class="submitBtn">
        </div>    
      </form>
	</div>
	
	<a href="#" data-toggle="modal" data-target="#login-modal">Login</a>

<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    	  <div class="modal-dialog">
				<div class="loginmodal-container">
					<h1>Login to Your Account</h1><br>
				  <form action="login" method="post" onsubmit="return loginFrm()" name="loginForm">
					<input class="form-control" type="text" id="username" name="username" maxlength="20" placeholder="아이디 입력">
					<input class="form-control" type="password" id="password" name="password" maxlength="20" placeholder="비밀번호 입력">
					<input class="login loginmodal-submit" type="submit" value="LOGIN" class="submitBtn">
				  </form>
					
				  <div class="login-help">
					<a href="#">Register</a> - <a href="#">Forgot Password</a>
				  </div>
				</div>
			</div>
		  </div>
