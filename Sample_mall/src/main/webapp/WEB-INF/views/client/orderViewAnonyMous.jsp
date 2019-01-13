<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form action="orderDetail" name="frm">
	<table class="table">
		<tbody>
			<tr>
				<td colspan="2"><small>비회원 주문조회</small></td>
			</tr>
			<tr>
				<td colspan="2"> 주문번호를 입력해주세요.</td>
			</tr>
			<tr>
				<td><input class="form-control" type="text" name="b_no" placeholder="주문번호는 '-'까지 포함해서 입력해주세요"></td>
				<td><button style="width:100%;"type="submit" class="btn btn-primary">검색</button></td>
			</tr>
		</tbody>
	</table>
</form>