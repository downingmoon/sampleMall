<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="data" value="${list}" />
<c:choose>
	<c:when test="${list.size() == 0}">
		<center>주문된 상품이 없습니다.</center>
	</c:when>
	<c:otherwise>
		<div class="col-md-6" style="width: 100%;">
			<div class="panel panel-primary">
				<table class="table table-hover" id="dev-table">
					<thead>
						<tr>
							<th>배송번호</th>
							<th>상품번호</th>
							<th>고객번호</th>
							<th>받는사람</th>
							<th>받는곳 주소</th>
							<th>배송메시지</th>
							<th>주문번호</th>
							<th>배송현황</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="list">
							<tr>
								<td>${list.d_no}</td>
								<td>${list.d_p_no}</td>
								<td>
									<c:choose>
										<c:when test="${list.d_u_no == 999999999}">
											비회원
										</c:when>
										<c:otherwise>
											${list.d_u_no}
										</c:otherwise>
									</c:choose>
								</td>
								<td>${list.d_receive_name}</td>
								<td>${list.d_receive_address}</td>
								<c:choose>
									<c:when test="${fn:length(list.d_del_msg) > 5}">
										<td><c:out value="${fn:substring(list.d_del_msg,0,5)}"/>...</td>
									</c:when>
									<c:otherwise>
										<td>${list.d_del_msg}</td>
									</c:otherwise>
								</c:choose>	
								<td>${list.d_b_no}</td>
								<td>
									<c:choose>
										<c:when test="${list.d_status == '발송완료'}">
											<b style="color:blue">${list.d_status}</b>
										</c:when>
										<c:otherwise>
											<b>${list.d_status}</b>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</c:otherwise>
</c:choose>