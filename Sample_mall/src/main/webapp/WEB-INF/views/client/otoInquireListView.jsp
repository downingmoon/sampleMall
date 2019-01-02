<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

.wishTr:hover .wishTr, .wishTr:hover .wishTd {
		text-decoration: underline;
	}
	
</style>

<script>
	function goOtoDetail(i_no, i_u_no) {
		location.href="otoDetail?i_no="+i_no+"&i_u_no="+i_u_no;
	}
</script>

<div class="col-md-12" >
		    <div class="card">
		        <div class="card-body">
		            <div class="row">
		                <div class="col-md-12">
		                    <h4>${u_id}님 위시리스트</h4>
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
		                   <form action="buyProductsInCart" name="frm" method="post">
	<div class="panel panel-default panel-table">
		<c:set value="${list.size()}" var="data" />
		<c:choose>
			<c:when test="${data == 0}">
			문의내역이 없습니다.
		</c:when>
			<c:otherwise>
				<div class="panel-body">
					<table class="table table-bordered table-list">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>답변 상태</th>
								<th>문의일자</th>
								<th></th>
							</tr>
						<thead>
						<tbody>
							<c:forEach var="list" items="${list}">
								<tr class="wishTr" onclick="goOtoDetail(${list.i_no}, ${list.i_u_no})" style="cursor:pointer;">
									<td style="text-align:center;">${list.i_no}</td>
									<td class="wishTd">${list.i_title}</td>
									<td class="wishTd">${list.i_status}</td>
									<td class="wishTd">${list.i_regdate}</td>
									<td><button type="button" class="btn btn-danger" onclick="wishDel(${list.i_no})">삭제</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<input type="hidden" id="u_id" value="${u_id}">
</form>
		                   
		                </div>
		            </div>
		            
		        </div>
		    </div>
		</div>