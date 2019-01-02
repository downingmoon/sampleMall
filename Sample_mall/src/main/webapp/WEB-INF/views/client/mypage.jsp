<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>

<div class="col-md-12" >
		    <div class="card">
		        <div class="card-body">
		            <div class="row">
		                <div class="col-md-12">
		                    <h4>${u_id}님 마이페이지</h4>
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
		                   <ul class="">
								<li> $vo.u_name 이름 님 환영합니다. </li>
								<li>가용 포인트 : $vo.point 점</li>
								<li>등급 : $vo.u_grade 일반</li>
							</ul>
		                </div>
		            </div>
		            
		        </div>
		    </div>
		</div>