<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<form action="otoInquireReg" method="post" onsubmit="return chkSubmit()" onreset="return chkReset()" name="frm">
<div class="container">
	<div class="row">
		<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12 toppad">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="row">
						<div class="col col-md-12">
							<h3 class="panel-title">1:1 문의하기</h3>
						</div>
					</div>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class=" col-md-12 col-lg-12 ">
							<table class="table table-user-information">
								<tbody>
									<tr>
										<td>제목:</td>
										<td><input class="form-control" type="text" name="i_title"></td>
									</tr>
									<tr>
										<td>내용: </td>
										<td><textarea class="form-control" rows="20" name="i_content"></textarea></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="panel-footer">
					<button type="submit" class="btn btn-sm btn-primary">등록</button>
					<button type="reset" class="btn btn-sm btn-danger">내용 초기화</button>
				</div>
			</div>
		</div>
	</div>
</div>
<input type="hidden" name="u_id" value="${u_id}">
</form>