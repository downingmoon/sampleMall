<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="col-md-12">
	<div class="card">
		<div class="card-body">
			<div class="row">
				<div class="col-md-12">
					<h4>${u_id}님 1:1 문의내역</h4>
					<hr>
				</div>
			</div>
			<div class="row">
				<div class="col-md-2">
					<div class="list-group">
						<a href="userInfo?id=${u_id}" class="list-group-item">회원정보</a>
						<a href="wishList?u_id=${u_id}" class="list-group-item">찜 목록</a>
						<a href="otoInquireList?u_id=${u_id}" class="list-group-item">1:1문의내역</a>
					</div>
				</div>
				<div class="col-md-10">
					<div class="panel panel-default panel-table">
								<div class="panel-body">
									<table class="table table-user-information">
								<tbody>
									<tr>
										<td colspan="2">제목: ${vo.i_title}</td>
									</tr>
									<tr>
										<td>작성일자 : ${vo.i_regdate}</td>
										<td>상태 : ${vo.i_status}</td>
									</tr>
									<tr>
										<td colspan="2">내용: ${vo.i_content}</td>
									</tr>
									<tr>
										<td colspan="2">답변 : ${vo.i_answer}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<input type="hidden" id="u_id" value="${u_id}">
				</div>
			</div>
		</div>
	</div>
</div>