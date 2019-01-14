<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<c:set var="data" value="${list.size()}"/>

<c:choose>
	<c:when test="${data == 0}">
		주문내역이 없습니다.
	</c:when>
	<c:otherwise>
		<div class="col-md-12">
			<div class="panel panel-default panel-table" style="width:100%;">
				<div class="panel-heading">
					<div class="row">
						<div class="col col-md-12">
							<h3 class="panel-title">주문조회</h3>
						</div>
					</div>
				</div>
				<div class="panel-body">
					<table class="table table-striped table-bordered table-list col-md-12">
						<thead>
							<tr>
								<th style="width:20%;">주문번호</th>
								<th>상품명</th>
								<th style="width:20%;">결제수단</th>
								<th>구매일자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${list}">
								<tr>
									<td>${list.b_no}</td>
									<td>
										<c:choose>
											<c:when test="${list.cnt == 1}">
												<a href="orderDetail?b_no=${list.b_no}&u_no=${u_no}">${list.b_p_name}</a>
											</c:when>
											<c:otherwise>
												<a href="orderDetail?b_no=${list.b_no}&u_no=${u_no}">${list.b_p_name} 외 ${list.cnt-1}개</a>
											</c:otherwise>
										</c:choose>
									</td>
									<td>${list.b_paytype}</td>
									<td>${list.b_regdate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</c:otherwise>
</c:choose>