<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>

$(document).ready(function() {
    
    var mainCategoryArray = new Array();
    var mainCategoryObject = new Object();
     
    mainCategoryObject = new Object();
    mainCategoryObject.main_category_id = "1";
    mainCategoryObject.main_category_name = "의류";
    mainCategoryArray.push(mainCategoryObject);
     
    mainCategoryObject = new Object();
    mainCategoryObject.main_category_id = "2";
    mainCategoryObject.main_category_name = "신발";
    mainCategoryArray.push(mainCategoryObject);
    
    mainCategoryObject = new Object();
    mainCategoryObject.main_category_id = "3";
    mainCategoryObject.main_category_name = "잡화";
    mainCategoryArray.push(mainCategoryObject);
     
    var subCategoryArray = new Array();
    var subCategoryObject = new Object();
     
    subCategoryObject = new Object();
    subCategoryObject.main_category_id = "1";
    subCategoryObject.sub_category_id = "1"
    subCategoryObject.sub_category_name = "맨투맨/후드" 
    subCategoryArray.push(subCategoryObject);
     
    subCategoryObject = new Object();
    subCategoryObject.main_category_id = "1";
    subCategoryObject.sub_category_id = "2"
    subCategoryObject.sub_category_name = "슬랙스" 
    subCategoryArray.push(subCategoryObject);
     
    subCategoryObject = new Object();
    subCategoryObject.main_category_id = "1";
    subCategoryObject.sub_category_id = "3"
    subCategoryObject.sub_category_name = "청바지/면바지" 
    subCategoryArray.push(subCategoryObject);
    
    subCategoryObject = new Object();
    subCategoryObject.main_category_id = "1";
    subCategoryObject.sub_category_id = "4"
    subCategoryObject.sub_category_name = "코트/점퍼" 
    subCategoryArray.push(subCategoryObject);
     
    subCategoryObject = new Object();
    subCategoryObject.main_category_id = "2";
    subCategoryObject.sub_category_id = "1"
    subCategoryObject.sub_category_name = "운동화" 
    subCategoryArray.push(subCategoryObject);
     
    subCategoryObject = new Object();
    subCategoryObject.main_category_id = "2";
    subCategoryObject.sub_category_id = "2"
    subCategoryObject.sub_category_name = "워커/정장화"
    subCategoryArray.push(subCategoryObject);
    
   	subCategoryObject = new Object();
   	subCategoryObject.main_category_id = "3";
   	subCategoryObject.sub_category_id = "1"
   	subCategoryObject.sub_category_name = "모자"
   	subCategoryArray.push(subCategoryObject);
   	
   	subCategoryObject = new Object();
   	subCategoryObject.main_category_id = "3";
   	subCategoryObject.sub_category_id = "2"
   	subCategoryObject.sub_category_name = "양말"
   	subCategoryArray.push(subCategoryObject);
   	
   	subCategoryObject = new Object();
   	subCategoryObject.main_category_id = "3";
   	subCategoryObject.sub_category_id = "3"
   	subCategoryObject.sub_category_name = "악세서리"
   	subCategoryArray.push(subCategoryObject);
    var mainCategorySelectBox = $("select[name='mainCategory']");
     
    for(var i=0;i<mainCategoryArray.length;i++){
        mainCategorySelectBox.append("<option value='"+mainCategoryArray[i].main_category_id+"'>"+mainCategoryArray[i].main_category_name+"</option>");
    }
     
    $(document).on("change","select[name='mainCategory']",function(){
         
        var subCategorySelectBox = $("select[name='subCategory']");
        subCategorySelectBox.children().remove(); 
         
        $("option:selected", this).each(function(){
            var selectValue = $(this).val(); 
            subCategorySelectBox.append("<option value=''>전체</option>");
            for(var i=0;i<subCategoryArray.length;i++){
                if(selectValue == subCategoryArray[i].main_category_id){
                     
                    subCategorySelectBox.append("<option value='"+subCategoryArray[i].sub_category_id+"'>"+subCategoryArray[i].sub_category_name+"</option>");
                 }
            }
        });
     });
});
</script>

<center><h3>"${word}" 검색결과</h3></center>

<form action="detailSearch" method="post">
<hr style="border: solid 1px #424242;">
	<table>
		<tr>
			<th>상세검색</th>
			<td></td>
		</tr>
		<tr>
			<th>검색어 : </th>
			<td><input type="text" name="searchKeyword" placeholder="Search"></td>
		</tr>
		<tr>
			<th>카테고리</th>
			<td>
				<select name="mainCategory">
					<option value="all">전체</option>
				</select>
			</td>
			<td>
				<select name="subCategory">
					<option value="all">전체</option>
				</select>
			</td>
		</tr>
		<tr>
			<td><input type="submit" value="검색"></td>
		</tr>
	</table>
</form>
<br>
<div class="items">
		<c:forEach items="${list}" var="list">
			<div class="itemInfo">
				<a href="detail?p_no=${list.p_no}"> 
				<img style="size: width:600px; height: 300px;" 
				src="/shop/resources/img/product/mainImg/${list.p_no}/${list.p_mainimg}.jpg"><br>
					${list.p_name}<br>
					<c:set var="data" value="${list.stock}" />
						<c:choose>
							<c:when test="${data <= 10 && data > 0}">
								가격 : ${list.p_price}원<br>
					 			품절임박! 남은수량 ${list.stock}개!<br>
							</c:when>
							<c:when test="${data == 0}">
								<div class="blinkcss">품절<br></div>
							</c:when>
							<c:otherwise>
								가격 : ${list.p_price}원<br>
							</c:otherwise>
						</c:choose>
				</a><br>
			</div>
		</c:forEach>

	</div>