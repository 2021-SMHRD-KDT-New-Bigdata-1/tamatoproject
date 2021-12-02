<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="viewport" content="width=320"/>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<link
   href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
   rel="stylesheet">

<title>KingTomato</title>

<!-- Bootstrap core CSS -->
<link
   href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
   rel="stylesheet">


<!-- Additional CSS Files -->
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/fontawesome.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/templatemo-edu-meeting.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/owl.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/lightbox.css">

<!-- 카메라를 호출하는 api 연동 기능 by 이길환  -->
<script src="resources/vendor/jquery/jquery.min.js"></script>
<script>

	$(document).ready(function() {
		if (!('url' in window) && ('webkitURL' in window)) {
			window.URL = window.webkitURL;
		}
		$('#camera').change(function(e) {
			$('#pic').attr('src', URL.createObjectURL(e.target.files[0]));
		});
	});
	
	function ImgCheck(){
		var img = $('#pic')[0].src;
		if (img == ""){
			alert("분석할 사진을 업로드하세요.");
			
		}else {
            // 여기안에 병충해 설명과 병충해 해결방안<div>~</div>을 넣어야 하나..
            $('div.row.gx-4.gx-lg-5:not(.my-5)')[0].style.display='flex'
            
          
            
            
         }

	}
	

	
	$(function () {

        $('#anal_btn').on('click', function () {

            $.ajax({
                url: 'http://222.102.43.169:8000/api/pest_analysis',
                type: 'get',
                datatype: 'json',
                success: function (data) {
                    //alert("성공!")
                    //alert(data)
                    console.log(data.text)
                    $.each(data, function (index, item) { // 데이터 =item
                       // index가 끝날때까지 
                        $("#symtoms").html(item.pest_reason);
                        $("#solution").html(item.pest_solution);
                        $("#pestItem").html(item.pesticide);
                      
                    });
                },
                error: function (err) {

                }
            })
        })
    })
	


</script>
</head>

<body>
	<!-- ***** Header Area Start ***** -->
	<header class="header-area header-sticky">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav class="main-nav">
						<!-- ***** Logo Start ***** -->
						<a href="index.do" class="logo"> 피톤치드 </a>
						<!-- ***** Logo End ***** -->
						<!-- ***** Menu Start ***** -->
						<ul class="nav">
							<li class="scroll-to-section"><a href="#top" class="active">Home</a></li>
							<li><a href="deep.do">병충해 진단</a></li>
							<li class="scroll-to-section"><a href="#apply">알림</a></li>
							<li class="scroll-to-section"><a href="#apply">방역/방제</a></li>
							<li class="scroll-to-section"><a href="#courses">검색</a></li>
						</ul>
						<a class='menu-trigger'> <span>Menu</span>
						</a>
						<!-- ***** Menu End ***** -->
					</nav>
				</div>
			</div>
		</div>
	</header>
	<!-- ***** Header Area End ***** -->
	<!-- Page Content-->
	<main>
		<div class="container px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 align-items-center my-5">
				<div class="col-lg-12">
					<form action="/saveImage" enctype="multipart/form-data"
						method="post">


					<!-- 찍은 사진 가져오는 원본 코드 -->						
					<!-- <input type="file" id="camera" name="camera" capture="camera" 
							accept="image/*" />  -->
							
							
							<!-- 호출된 카메라로 찍은 사진을 가져오는 input값 by 이길환  -->
							  <label id="lb" class="btn btn-primary btn-file">
						      	사진추가 <input type="file" style="display: none;" id="camera" name="camera" capture="camera" accept="image/*" 
						      			onclick="ChangeImg()"/>
						      </label>
						<br /> <img id="pic" style="width: 256px; height:256px" />

							
							
					</form>
						<br /> <button id="anal_btn" type="submit" class="btn btn-info btn-sm"
							onclick="ImgCheck()">분석하기</button>
				</div>
			</div>
			<!-- Content Row-->
			<div class="row gx-4 gx-lg-5" style="display:none">
				<div class="col-md-6 mb-5">
					<h2 class="card-title">병충해 설명</h2>
					<div class="card h-100">
						<div class="card-body">
							<p id="symtoms" class="card-text">발생원인</p>
						</div>
					</div>
				</div>
				<div class="col-md-6 mb-5">
					<h2 class="card-title">병충해 해결방안</h2>
					<div class="card h-100">
						<div class="card-body">
							<p id="solution" class="card-text">해결방법</p>
						</div>
					</div>
				</div>
					<h2 class="card-title">사용해야할 농약</h2>
					<div class="card h-100">
						<div class="card-body">
							<p id="pestItem" class="card-text">해결방법</p>
						</div>
					</div>
			</div>
		</div>
	</main>
	<!-- Footer-->
	<!-- 왜 있는지 모를 클래스 푸터 -->
	<!-- <footer class="py-5 bg-dark">
		<div class="container px-4 px-lg-5"> -->
			<div class="footer">
				<p class="m-0 text-center text-white">Copyright &copy; Your
					Website 2021</p>
			</div>		
		<!-- </div>
	</footer> -->
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<script>
		/* Image Upload */
		$("input[type='file']").on("change", function(e) {
			let formData = new FormData();
			let fileInput = $('input[name="camera"]');
			let fileList = fileInput[0].files;
			let fileObj = fileList[0];

			if(!fileCheck(fileObj.name)){
				return false;
			}
			
			formData.append("uploadFile", fileObj);

			$.ajax({
				url: 'uploadAjaxAction.do',			// 서버로 요청을 보낼 url
		    	processData : false,				// 서버로 전송할 데이터를 queryString 형태로 변환할지 여부
		    	contentType : false,				// 서버로 전성되는 데이터의 content-type
		    	data : formData,					// 서버로 전송할 데이터
		    	type : 'POST',						// 서버 요청 타입(GET, POST)
		    	dataType : 'json',					// 서버로부터 반환받을 데이터 타입
		    	success : function(result) {
		    			console.log(result);
		    	},
		    	error : fucntion(result) {
		    			alert("이미지 파일이 아닙니다.");
		    	}
			});	
		});

		/* var, method related with attachFile */
		let regex = new RegExp("(.*?)\.(jpg|png)$");

		function fileCheck(fileName) {
			if (!regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}
	</script>

</body>

</html>