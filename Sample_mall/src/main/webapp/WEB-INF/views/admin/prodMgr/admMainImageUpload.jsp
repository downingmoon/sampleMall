<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath}/resources/js/admProdMod.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admProdInsert.css">

<form action="mainImageUpload" method="post" onsubmit="return chkSubmitImg()" name="frm" enctype="multipart/form-data">
<div class="container">
	<div class="row">
		<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 toppad">
			<div class="panel panel-info">
				<div class="panel-body">
					<div class="row">
						<div>
								<small>메인이미지는 1개씩만 등록 가능합니다.</small>
								<div class="input_wrap">
									<a href="javascript:" onclick="fileUploadAction()" class="my_button">파일 업로드</a>
									<input type="file" id="input_imgs" name="p_prodImg"/>
								</div>
							</div>
							<div>
								<div class="imgs_wrap">
									<img id="img"/>
								</div>
							</div>
					</div>
				</div>
				<div class="panel-footer">
					<button type="submit" class="btn btn-sm btn-primary">
						<i class="glyphicon glyphicon-check"></i></button>
				</div>
			</div>
		</div>
	</div>
</div>
</form>
