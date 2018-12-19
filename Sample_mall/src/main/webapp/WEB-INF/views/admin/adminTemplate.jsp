<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SampleMall 관리자페이지</title>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-default navbar-static-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="adminPage">
				SampleMall 관리자페이지
			</a>
		</div>
	</div>
</nav>
<div class="container-fluid main-container">
	<div class="row">
		<div class="col-md-2 col-lg-2 sidebar">
			<ul class="nav nav-pills nav-stacked">
				<li><a href="adminPage">홈</a></li>
				<li><a href="prodMgr">상품관리</a></li>
				<li><a href="saleMgr">주문관리</a></li>
				<li><a href="custMgr">고객관리</a></li>
				<li><a href="/shop">쇼핑몰 가기</a></li>
			</ul>
		</div>
		<div class="col-md-10 col-lg-10 content">
            <div class="panel panel-default">
                <div class="panel-heading">
                    ${subTitle}
                </div>
                <div class="panel-body">
                	<jsp:include page="${target}.jsp"/>
                </div>
            </div>
		</div>
		<footer class="pull-left footer">
			<p class="col-md-12">
				<hr class="divider">
				Copyright &COPY; 2018MDW All Rights Reserved
			</p>
		</footer>
		</div>
	</div>
</body>
</html>