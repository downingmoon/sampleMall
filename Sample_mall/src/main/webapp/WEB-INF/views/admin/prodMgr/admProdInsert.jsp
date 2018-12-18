<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="${pageContext.request.contextPath}/resources/js/admProdInsert.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admProdInsert.css">
	


<form action="prodInsert" method="post" onsubmit="return chkSubmit()" onreset="return chkReset()" name="frm" enctype="multipart/form-data">
<div class="container">
	<div class="row">
		<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 toppad">
			<div class="panel panel-info">
				<div class="panel-body">
					<div class="row">
						<div class=" col-md-9 col-lg-9 ">
							<table class="table table-user-information">
								<tbody>
									<tr>
										<td>상품번호:</td>
										<td><input class="form-control" type="text" name="p_no"></td>
									</tr>
									<tr>
										<td>상품명 : </td>
										<td><input class="form-control" type="text" name="p_name"></td>
									</tr>
									<tr>
										<td>상품가격 : </td>
										<td><input class="form-control" type="number" name="p_price"></td>
									</tr>
									<tr>
										<td>대분류 : </td>
										<td><select class="form-control" name="p_maintype">
											<option value="">---선택---</option>
										</select></td>
									</tr>
									<tr>
										<td>소분류 : </td>
										<td><select class="form-control" name="p_detailtype">
											<option value="">---선택---</option>
										</select></td>
									</tr>
									<tr>
										<td>상품정보 : </td>
										<td><textarea class="form-control" rows="20" name="p_info"></textarea></td>
									</tr>
								</tbody>
							</table>
							<div>
								<p><b>상품 이미지 등록</b></p>
								<div class="input_wrap">
									<a href="javascript:" onclick="fileUploadAction()" class="my_button">파일 업로드</a>
									<input type="file" id="input_imgs" name="p_prodImg" multiple/>
								</div>
							</div>
							<div>
								<div class="imgs_wrap">
									<img id="img"/>
								</div>
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