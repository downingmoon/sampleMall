<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	pageContext.setAttribute("br", "<br>");
	pageContext.setAttribute("cn", "\n");
%>
<script src="${pageContext.request.contextPath}/resources/js/admProdInsert.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admProdInsert.css">

	


<form action="boardMod" method="post" onsubmit="return chkSubmit()" onreset="return chkReset()" name="frm">
<div class="container">
	<div class="row">
		<div class="col-xs-10 col-sm-10 col-md-12 col-lg-12 toppad">
			<div class="panel panel-info">
				<div class="panel-body">
					<div class="row">
						<div class=" col-md-12 col-lg-12 ">
							<table class="table table-user-information">
								<tbody>
									<tr>
										<td style="border-right: 1px solid #ddd">제목:</td>
										<td>${vo.b_title}</td>
									</tr>
									<tr>
										<td style="border-bottom: 1px solid #ddd">글 종류 : </td>
										<td style="border-bottom: 1px solid #ddd">${vo.b_type}</td>
									</tr>
								</tbody>
							</table>
							<div style="width:90%;float: right;">
								${fn:replace(vo.b_content, cn, br)}
							</div>
						</div>
					</div>
				</div>
				<div class="panel-footer">
					<button type="submit" class="btn btn-sm btn-primary">
						<i class="glyphicon glyphicon-check"></i></button> <span class="center">
					<button type="reset" class="btn btn-sm btn-danger">
						<i class="glyphicon glyphicon-remove"></i></button>
					</span>
				</div>
			</div>
		</div>
	</div>
</div>
</form>