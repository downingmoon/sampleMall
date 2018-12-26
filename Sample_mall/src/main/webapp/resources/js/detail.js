$(function() {
		$('.addToCart').on('click', function() {
			var u_id = $('#u_id').val();
			if(u_id == 'anonymousUser' || u_id == undefined) {
				alert("비회원입니다.");
			} else {
			$.ajax({
				url:'addToCartAjax',
				type:'post',
				data: {
					amount:$('#amount').val(),
					u_id:$('#u_id').val(),
					p_no:$('#p_no').val()
				},
				success :function() {
					if(confirm('장바구니에 상품이 담겼습니다. 쇼핑을 계속하시겠습니까? 취소를 누르면 장바구니로 이동합니다.') != true) {
						location.href='goCart?u_id='+ u_id;
					}
				},
				error : function() {
					alert('장바구니에 담는도중 에러가 발생했습니다.');
				}
			});
			}
		});
	});
	
	$(function() {
		$('.addToWishList').on('click', function() {
			var u_id = $('#u_id').val();
			if(u_id == 'anonymousUser' || u_id == undefined) {
				alert("회원만 위시리스트 추가가 가능합니다.");
			} else {
			
			$.ajax({
				url:'wishListInsertAjax',
				type:'post',
				data: {
					u_id:$('#u_id').val(),
					p_no:$('#p_no').val()
				},
				seccess : function() {
					if(confirm('상품이 위시리스트에 추가되었습니다. 위시리스트로 이동하시겠습니까?') == true) {
						location.href='goWishList?u_id='+ u_id;
					}
				},
				error : function() {
					alert('위시리스트에 추가하는도중 에러가 발생했습니다. ');
				}
			});
			}
		});
	});
	
	$(function() {
		document.getElementById('wish').onclick = function() {
			  alert('위시리스트 아이콘 바꾸시오');
		}
	});
		
	$(function(){
		$('.btn-minus').on('click', function() {
			var value = $('.amount').val();
			if(value == 1) {
				alert('수량은 1 이상만 입력가능합니다.');
			} else {
				value--;
				$('.amount').val(value);
			}
		});
	});
	
	$(function(){
		$('.btn-plus').on('click', function() {
			var value = $('.amount').val();
			if(value == 99) {
				alert('수량은 99까지만 입력가능합니다.');
			} else {
				value++;
				$('.amount').val(value);
			}
		});
	});
	
	$(function(){
			$('.amount').on('change', function() {
			var amount = $('.amount').val(); 
			if(!$.isNumeric(amount)) {
				alert('숫자만 입력해주세요.');
				$('.amount').val(1);
			}
		});
	});
	