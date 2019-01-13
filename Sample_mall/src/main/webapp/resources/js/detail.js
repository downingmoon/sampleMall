$(function() {
		$('.addToCart').on('click', function() {
			var u_id = $('#u_id').val();
			var p_no = $('#p_no').val();
			
			if(u_id == 'anonymousUser' || u_id == undefined) {
				alert("장바구니는 회원가입 후 이용해주세요.");
				location.href='join';
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
					url:'wishExistChkAjax',
					type:'post',
					data: {
						u_id:$('#u_id').val(),
						p_no:$('#p_no').val()
					},
					success : function(result) {
						if(result < 1) {
							$.ajax({
								url:'wishListInsertAjax',
								type:'POST',
								data: {
									u_id:$('#u_id').val(),
									p_no:$('#p_no').val()
								},
								success : function() {
									if(confirm('상품이 위시리스트에 추가되었습니다. 위시리스트로 이동하시겠습니까?') == true) {
										location.href='wishList?u_id='+ u_id;
									}
								},
								error : function() {
									alert('위시리스트에 추가하는도중 에러가 발생했습니다. ');
								}
							});
						} else {
							alert("이미 상품이 찜목록에 있습니다.")
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
		var wishIcon = document.getElementById('wish');
		var wishBtn = document.getElementById('wishBtn');
		wishBtn.onclick = function() {
			if($('#wish').attr('class') == 'glyphicon glyphicon-heart-empty') {
				wishIcon.classList.remove('glyphicon-heart-empty');
			  	wishIcon.classList.add('glyphicon-heart');
			} else {
				wishIcon.classList.remove('glyphicon-heart');
			  	wishIcon.classList.add('glyphicon-heart-empty');
			}
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
	
	function chkBeforePay(idx, u_id) {
		var frm = document.frm;
		var amount = $('#amount').val();
		if(idx == 1) {
			if(u_id == 'anonymousUser') {
				alert('비회원은 비회원구매 버튼을 눌러주세요.');
				return false;
			} else if(amount == 0) {
				frm.amount.focus();
				alert('수량은 1이상 선택해주세요.');
				return false;
			} else {
				frm.action = 'buyProd';
				frm.submit();
				return true;
			}
		} else if(idx == 2) {
			if(u_id != 'anonymousUser') {
				alert('비회원만 비회원구매를 할수있습니다.');
				return false;
			} else {
				frm.action = 'nonMemberPurchase';
				frm.submit();
				return true;
			}
			
		}
	}
	
	function nonMemberPurchase(p_no, p_name, p_price) {
		var amount = $('.amount').val();
		var form = document.createElement('form');
		form.action = 'nonMemberPurchase';
		form.method = 'post';
		var p_no = document.createElement('input');
		p_no.setAttribute('type', 'hidden');
		p_no.setAttribute('name', 'p_no');
		p_no.setAttribute('value', 'hidden');
		form.appendChild(p_no);
		form.appendChild(p_name);
		form.appendChild(p_price);
		form.appendChild(p_amount);
		form.submit();
		
	}
	