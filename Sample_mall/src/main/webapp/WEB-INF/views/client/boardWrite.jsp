<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="${pageContext.request.contextPath}/resources/js/admProdInsert.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admProdInsert.css">
	


<form action="boardWrite" method="post" onsubmit="return chkSubmit()" onreset="return chkReset()" name="frm">
<div class="container">
	<div class="row">
		<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12 toppad">
			<div class="panel panel-info">
				<div class="panel-body">
					<div class="row">
						<div class=" col-md-12 col-lg-12 ">
							<table class="table table-user-information">
								<tbody>
									<tr>
										<td>제목:</td>
										<td><input class="form-control" type="text" name="b_title"></td>
									</tr>
									<tr>
										<td>글 종류 : </td>
										<td><select class="form-control" name="b_type">
											<option value="공지사항">공지사항</option>
											<option value="이벤트">이벤트</option>
											<option value="기타">기타</option>
										</select></td>
									</tr>
									<tr>
										<td>내용: </td>
										<td><textarea class="form-control" rows="20" name="b_content"></textarea></td>
									</tr>
								</tbody>
							</table>
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