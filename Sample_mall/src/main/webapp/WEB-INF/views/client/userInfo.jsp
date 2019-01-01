<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-md-12" >
		    <div class="card">
		        <div class="card-body">
		            <div class="row">
		                <div class="col-md-12">
		                    <h4>${vo.u_name}님 회원정보</h4>
		                    <hr>
		                </div>
		            </div>
		            <div class="row">
		            		<div class="col-md-2">
		            			<div class="list-group">
									<a href="userInfo?id=${u_id}" class="list-group-item">회원정보</a>
									<a href="wishList?u_id=${u_id}" class="list-group-item">찜 목록</a>
									<a href="otoInquireList?u_id=${u_id}" class="list-group-item">1:1문의 내역</a>
								</div>
		            		</div>
		                <div class="col-md-10">
		                    <form action="mypage" method="post">
                              <div class="form-group row">
                                <label for="username" class="col-4 col-form-label">이름</label> 
                                <div class="col-8">
                                  <input id="username" name="u_name" value="${vo.u_name}" class="form-control here" required="required" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="name" class="col-4 col-form-label">비밀번호 변경</label> 
                                <div class="col-8">
                                  <input id="name" name="u_pw" class="form-control here" type="password">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="lastname" class="col-4 col-form-label">비밀번호 변경(확인)</label> 
                                <div class="col-8">
                                  <input id="lastname" name="pwChk" class="form-control here" type="password">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="text" class="col-4 col-form-label">연락처</label> 
                                <div class="col-8">
                                  <input id="text" name="u_phone" value="${vo.u_phone}"class="form-control here" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="email" class="col-4 col-form-label">주소
                                <button type="button"id="postcodify_search_button" class="btn btn-primary btn-sm">검색</button>
                                </label> 
                                <div class="col-8">
                                  <input id="email" name="u_mainaddress" value="${vo.u_mainaddress}" class="form-control here postcodify_address" type="text">
                                  <input id="email" name="u_subaddress" value="${vo.u_subaddress}" class="form-control here postcodify_details" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="website" class="col-4 col-form-label">등급</label> 
                                <div class="col-8">
                                  <input id="website" name="u_grade" value="${vo.u_grade}" class="form-control here" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="publicinfo" class="col-4 col-form-label">생년월일</label> 
                                <div class="col-8">
                                  <input id="publicinfo" name="u_birth" value="${vo.u_birth}" class="form-control"></input>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="newpass" class="col-4 col-form-label">가용포인트</label> 
                                <div class="col-8">
                                  <input id="newpass" name="u_point" value="${vo.u_point}" class="form-control here" type="text" disabled="disabled">
                                </div>
                              </div> 
                              <div class="form-group row">
                                <div class="offset-4 col-8">
                                <input type="hidden" name="u_no" value="${vo.u_no}">
                                  <center><button name="submit" type="submit" class="btn btn-primary">정보 수정</button></center>
                                </div>
                              </div>
                            </form>
		                </div>
		            </div>
		            
		        </div>
		    </div>
		</div>