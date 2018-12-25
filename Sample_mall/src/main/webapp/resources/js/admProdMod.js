var sel_files = [];

$(document).ready(function() {
	$("#input_imgs").on("change", handleImgFileSelect);
});

function fileUploadAction() {
	console.log("fileUploadAction");
	$("#input_imgs").trigger('click');
}

function handleImgFileSelect(e) {
	sel_files = [];
	$(".imgs_wrap").empty();
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	var index = 0;
	filesArr.forEach(function(f) {
		if (!f.type.match("image.*")) {
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}

		sel_files.push(f);

		var reader = new FileReader();
		reader.onload = function(e) {
		var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("
						+ index
						+ ")\" id=\"img_id_"
						+ index
						+ "\"><img src=\""
						+ e.target.result
						+ "\" data-file='"
						+ f.name
						+ "' class='selProductFile' title='Click to remove'></a>";
					$(".imgs_wrap").append(html);
					index++;
				}
				reader.readAsDataURL(f);
			});
}

function deleteImageAction(index) {
	console.log("index : " + index);
	console.log("sel length : " + sel_files.length);

	sel_files.splice(index, 1);

	var img_id = "#img_id_" + index;
	$(img_id).remove();
}

function fileUploadAction() {
	console.log("fileUploadAction");
	$("#input_imgs").trigger('click');
}

function submitAction() {
	console.log("업로드 파일 갯수 : " + sel_files.length);
	var data = new FormData();

	for (var i = 0, len = sel_files.length; i < len; i++) {
		var name = "image_" + i;
		data.append(name, sel_files[i]);
	}
	data.append("image_count", sel_files.length);

	if (sel_files.length < 1) {
		alert("한개이상의 파일을 선택해주세요.");
		return;
	}

	var xhr = new XMLHttpRequest();
	xhr.open("POST", "./study01_af.php");
	xhr.onload = function(e) {
		if (this.status == 200) {
			console.log("Result : " + e.currentTarget.responseText);
		}
	}
	xhr.send(data);
}

$(function() {
    $("#imgInp").on('change', function(){
        readURL(this);
    });
});

function readURL(input) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
            $('#blah').attr('src', e.target.result);
        }

      reader.readAsDataURL(input.files[0]);
    }
}



$("#imgInput").change(function(){
    readURL(this);
});


$(document).ready(function(){

	$("#fileInput").on('change', function(){
		if(window.FileReader){
			var filename = $(this)[0].files[0].name;
		} else {
			var filename = $(this).val().split('/').pop().split('\\').pop();
		}
		$("#userfile").val(filename);
	});
});




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