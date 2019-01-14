<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<div class="panel panel-default panel-table">
	<div class="panel-heading">
		<div class="row">
			<div class="col col-xs-6">
				<h3 class="panel-title">공지사항 / 이벤트</h3>
			</div>
			<div class="col col-xs-6 text-right">
				
			</div>
		</div>
	</div>
	<div class="panel-body">
		<table class="table table-striped table-bordered table-list">
			<thead>
				<tr>
					<th>분류</th>
					<th class="hidden-xs">글 번호</th>
					<th style="width:60%;">제목</th>
					<th>작성일자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${list}">
					<tr>
						<td>${list.b_type}</td>
						<td class="hidden-xs">${list.b_no}</td>
						<td><a href="boardDetail?b_no=${list.b_no}">${list.b_title}</a></td>
						<td>${list.b_regdate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
	<div class="panel-footer">
		<div class="row">
			<div class="col col-xs-8">
				<ul class="pagination hidden-xs pull-left">
					<li><a href="noticeAndEvents?page=1"><i class="glyphicon glyphicon-menu-left"></i></a></li>
					<c:forEach var="i" begin="1" end="${totalPage}">
						<li><a href="noticeAndEvents?page=${i}">${i}</a></li>
					</c:forEach>
					<li><a href="noticeAndEvents?page=${totalPage}"><i class="glyphicon glyphicon-menu-right"></i></a></li>	
				</ul>
				<sec:authorize access="hasRole('ROLE_ADM')">
					<button type="button" class="btn btn-sm btn-primary pull-right" onclick="location.href='boardWrite'">글쓰기</button>
				</sec:authorize>
			</div>
		</div>
	</div>
</div>