<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<form action="otoAnswerUpdate" method="post" onsubmit="return chkSubmit()" name="frm">
<div class="container">
	<div class="row">
		<div class="col-md-10 col-lg-10">
			<div class="panel panel-info">
				<div class="panel-body">
					<div class="row">
						<div class="col-md-10 col-lg-10 ">
							<table class="table table-user-information">
								<tbody>
									<tr>
										<td>제목: ${vo.i_title}</td>
										<td>작성일자 : ${vo.i_regdate}</td>
									</tr>
									<tr>
										<td style="border-bottom: 1px solid #ddd">작성자 : ${vo.i_u_name}</td>
										<td style="border-bottom: 1px solid #ddd"></td>
									</tr>
									<tr>
										<td>
											<div>
												${fn:replace(vo.i_content, cn, br)}
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div>
												<textarea name="i_answer"class="form-control" style="resize:none;" rows="10"></textarea>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="panel-footer">
					<button type="submit" class="btn btn-sm btn-primary">
						답변완료</button>
				</div>
			</div>
		</div>
	</div>
</div>
<input type="hidden" name="i_no" value="${vo.i_no}">
</form>