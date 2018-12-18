<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	function admProdDetail(p_no) {
		location.href="admProdDetail?p_no=" + p_no;
	}
	
	function clkDelete(p_no) {
		location.href="admProdDelete?p_no=" + p_no;
	}
	
	function clkMod(p_no) {
		location.href="prodMod?p_no=" + p_no;
	}
</script>
<div class="col-md-6" style="width:100%;">
				<div class="panel panel-primary">
					<table class="table table-hover" id="dev-table">
						<thead>
							<tr>
								<th>번호</th>
								<th>상품명</th>
								<th>가격</th>
								<th>대분류</th>
								<th>소분류</th>
								<th>판매수량</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${list}" var="list">
							<tr>
								<td>${list.p_no}</td>
								<td>${list.p_name}</td>
								<td>${list.p_price}</td>
								<td>${list.p_maintype}</td>
								<td>${list.p_detailtype}</td>
								<td>${list.p_salecnt}</td>
								<td style="display:flex;">
									<button type="button" onclick="clkMod(${list.p_no})" class="btn btn-info btn-sm blue">
                					<span class="glyphicon glyphicon-pencil"></span></button>
									<button type="button" onclick="clkDelete(${list.p_no})" class="btn btn-danger btn-sm btn3d">
									<span class="glyphicon glyphicon-remove"></span></button>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>