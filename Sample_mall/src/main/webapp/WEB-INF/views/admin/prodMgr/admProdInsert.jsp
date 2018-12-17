<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
    
    var p_maintypeArray = new Array();
    var p_maintypeObject = new Object();
     
    p_maintypeObject = new Object();
    p_maintypeObject.main_category_id = "clothes";
    p_maintypeObject.main_category_name = "의류";
    p_maintypeArray.push(p_maintypeObject);
     
    p_maintypeObject = new Object();
    p_maintypeObject.main_category_id = "shoes";
    p_maintypeObject.main_category_name = "신발";
    p_maintypeArray.push(p_maintypeObject);
    
    p_maintypeObject = new Object();
    p_maintypeObject.main_category_id = "others";
    p_maintypeObject.main_category_name = "잡화";
    p_maintypeArray.push(p_maintypeObject);
     
    var p_detailtypeArray = new Array();
    var p_detailtypeObject = new Object();
     
    p_detailtypeObject = new Object();
    p_detailtypeObject.main_category_id = "clothes";
    p_detailtypeObject.sub_category_id = "mtm"
    p_detailtypeObject.sub_category_name = "맨투맨/후드" 
    p_detailtypeArray.push(p_detailtypeObject);
     
    p_detailtypeObject = new Object();
    p_detailtypeObject.main_category_id = "clothes";
    p_detailtypeObject.sub_category_id = "slacks"
    p_detailtypeObject.sub_category_name = "슬랙스" 
    p_detailtypeArray.push(p_detailtypeObject);
     
    p_detailtypeObject = new Object();
    p_detailtypeObject.main_category_id = "clothes";
    p_detailtypeObject.sub_category_id = "jeans"
    p_detailtypeObject.sub_category_name = "청바지/면바지" 
    p_detailtypeArray.push(p_detailtypeObject);
    
    p_detailtypeObject = new Object();
    p_detailtypeObject.main_category_id = "clothes";
    p_detailtypeObject.sub_category_id = "coat"
    p_detailtypeObject.sub_category_name = "코트/점퍼" 
    p_detailtypeArray.push(p_detailtypeObject);
     
    p_detailtypeObject = new Object();
    p_detailtypeObject.main_category_id = "shoes";
    p_detailtypeObject.sub_category_id = "workingshoes"
    p_detailtypeObject.sub_category_name = "운동화" 
    p_detailtypeArray.push(p_detailtypeObject);
     
    p_detailtypeObject = new Object();
    p_detailtypeObject.main_category_id = "shoes";
    p_detailtypeObject.sub_category_id = "walker"
    p_detailtypeObject.sub_category_name = "워커/정장화"
    p_detailtypeArray.push(p_detailtypeObject);
    
   	p_detailtypeObject = new Object();
   	p_detailtypeObject.main_category_id = "others";
   	p_detailtypeObject.sub_category_id = "cap"
   	p_detailtypeObject.sub_category_name = "모자"
   	p_detailtypeArray.push(p_detailtypeObject);
   	
   	p_detailtypeObject = new Object();
   	p_detailtypeObject.main_category_id = "others";
   	p_detailtypeObject.sub_category_id = "socks"
   	p_detailtypeObject.sub_category_name = "양말"
   	p_detailtypeArray.push(p_detailtypeObject);
   	
   	p_detailtypeObject = new Object();
   	p_detailtypeObject.main_category_id = "others";
   	p_detailtypeObject.sub_category_id = "acc"
   	p_detailtypeObject.sub_category_name = "악세서리"
   	p_detailtypeArray.push(p_detailtypeObject);
    var p_maintypeSelectBox = $("select[name='p_maintype']");
     
    for(var i=0;i<p_maintypeArray.length;i++){
        p_maintypeSelectBox.append("<option value='"+p_maintypeArray[i].main_category_id+"'>"+p_maintypeArray[i].main_category_name+"</option>");
    }
     
    $(document).on("change","select[name='p_maintype']",function(){
         
        var p_detailtypeSelectBox = $("select[name='p_detailtype']");
        p_detailtypeSelectBox.children().remove(); 
         
        $("option:selected", this).each(function(){
            var selectValue = $(this).val(); 
            p_detailtypeSelectBox.append("<option value=''>전체</option>");
            for(var i=0;i<p_detailtypeArray.length;i++){
                if(selectValue == p_detailtypeArray[i].main_category_id){
                    p_detailtypeSelectBox.append("<option value='"+p_detailtypeArray[i].sub_category_id+"'>"+p_detailtypeArray[i].sub_category_name+"</option>");
                 }
            }
        });
     });
});


	function chkSubmit() {
		var frm = document.frm;
		if(frm.p_no.value == "") {
			alert("상품번호가 입력되지 않았습니다.");
			frm.p_no.focus();
			return false;
		} else if(frm.p_name.value == "") {
			alert("상품명이 입력되지 않았습니다.");
			frm.p_name.focus();
			return false;
		} else if(frm.p_price.value == "") {
			alert("상품가격이 입력되지 않았습니다.");
			frm.p_price.focus();
			return false;
		} else if(frm.p_maintype.value == "") {
			alert("상품 대분류가 선택되지 않았습니다.");
			frm.p_maintype.focus();
			return false;
		} else if(frm.p_detailtype.value == "") {
			alert("상품 소분류가 선택되지 않았습니다.");
			frm.p_detailtype.focus();
			return false;
		} else if(frm.p_info.value == "") {
			alert("상품정보가 입력되지 않았습니다.");
			frm.p_info.focus();
			return false;
		}
		alert("상품정보가 수정되었습니다.");
		return true;
	}
	
	function chkReset() {
		if(confirm("작성한 내용이 모두 삭제됩니다. 정말로 초기화 하시겠습니까?") == true) {
			return true;
		}
		return false;
	}
</script>
<!-- 
<div class="prodMod">
		<div class="detailInfo">
			<form action="goCart" method="post">
			<p style="font-size: 2em;">상품명 : ${detail.p_name}</p>
			<p style="font-size : 1em;">가격 : ${detail.p_price}</p>
			<button type="submit">수정</button>
			<input type="hidden" name="p_no" value="${detail.p_no}">
			</form>
		</div>
			
</div>
<p>상품상세설명 : ${detail.p_info}</p>
 -->
 <form action="prodMod" method="post" onsubmit="return chkSubmit()" onreset="return chkReset()" name="frm">
<div class="container">
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad">
			<div class="panel panel-info">
				<div class="panel-body">
					<div class="row">
						<div class=" col-md-9 col-lg-9 ">
							<table class="table table-user-information">
								<tbody>
									<tr>
										<td>상품번호:</td>
										<td><input type="text" name="p_no"></td>
									</tr>
									<tr>
										<td>상품명 : </td>
										<td><input type="text" name="p_name"></td>
									</tr>
									<tr>
										<td>상품가격 : </td>
										<td><input type="number" name="p_price"></td>
									</tr>
									<tr>
										<td>대분류 : </td>
										<td><select name="p_maintype">
											<option value="">---선택---</option>
										</select></td>
									</tr>
									<tr>
										<td>소분류 : </td>
										<td><select name="p_detailtype">
											<option value="">---선택---</option>
										</select></td>
									</tr>
									<tr>
										<td>상품정보 : </td>
										<td><textarea class="form-control" rows="20" name="p_info"></textarea></td>
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
