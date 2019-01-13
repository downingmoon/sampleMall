<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	function goOtoDetail(i_no) {
		location.href='goOtoDetail?i_no='+i_no
	}
	
	function deleteOto(i_no) {
		$.ajax({
			url : 'deleteOto',
			type: 'post',
			data : {
				i_no : i_no
			},
			success : function() {
				alert(i_no+'번글이 삭제되었습니다.');
				location.reload();
			},
			error : function() {
				alert('삭제도중 에러가 발생했습니다.');
			}
		});
	}
</script>

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
							<th>글 번호</th>
							<th>고객이름</th>
							<th>제목</th>
							<th>문의일자</th>
							<th>상태</th>
							<!-- <th></th> -->
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="list">
							<tr onclick="goOtoDetail(${list.i_no})" style="cursor:pointer;">
								<td>${list.i_no}</td>
								<td>${list.i_u_name}</td>
								<td>${list.i_title}</td>
								<td>${list.i_regdate}</td>
								<td>
									<c:choose>
										<c:when test="${list.i_status == '접수완료'}">
											<b>${list.i_status}</b>
										</c:when>
										<c:otherwise>
											<b style="color: blue">${list.i_status}</b>
										</c:otherwise>
									</c:choose>
								</td>
								<!-- <td>
									<button type="button" onclick="deleteOto(${list.i_no})"
										class="btn btn-info btn-sm blue">
										문의 삭제
									</button>
								</td>
								 -->
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</c:otherwise>
</c:choose>