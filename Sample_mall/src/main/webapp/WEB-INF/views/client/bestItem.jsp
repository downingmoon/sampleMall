<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>

function doBlink() {
    var blink  = document.all.tags("BLINK");
    for(var i = 0; i < blink.length; i++) {
        blink[i].style.visibility = blink[i].style.visibility == "" ? "hidden" : "";
    }
}
function startBlink() {
    if(document.all) {
        setInterval("doBlink()",350);
    }
}
window.onload = startBlink;
</script>

<center><h3>TOP100</h3></center>


<div class="items">
		<c:forEach items="${list}" var="list">
			<div class="itemInfo">
				<a href="detail?p_no=${list.p_no}"> 
				<img style="size: width:600px; height: 300px;"src="/shop/resources/img/product/mainImg/${list.p_no}/${list.p_mainimg}.jpg"><br>
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