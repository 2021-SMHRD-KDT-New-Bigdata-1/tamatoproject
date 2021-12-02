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

<!-- ī�޶� ȣ���ϴ� api ���� ��� by �̱�ȯ  -->
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
			alert("�м��� ������ ���ε��ϼ���.");
			
		}else {
            // ����ȿ� ������ ����� ������ �ذ���<div>~</div>�� �־�� �ϳ�..
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
                    //alert("����!")
                    //alert(data)
                    console.log(data.text)
                    $.each(data, function (index, item) { // ������ =item
                       // index�� ���������� 
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
						<a href="index.do" class="logo"> ����ġ�� </a>
						<!-- ***** Logo End ***** -->
						<!-- ***** Menu Start ***** -->
						<ul class="nav">
							<li class="scroll-to-section"><a href="#top" class="active">Home</a></li>
							<li><a href="deep.do">������ ����</a></li>
							<li class="scroll-to-section"><a href="#apply">�˸�</a></li>
							<li class="scroll-to-section"><a href="#apply">�濪/����</a></li>
							<li class="scroll-to-section"><a href="#courses">�˻�</a></li>
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


					<!-- ���� ���� �������� ���� �ڵ� -->						
					<!-- <input type="file" id="camera" name="camera" capture="camera" 
							accept="image/*" />  -->
							
							
							<!-- ȣ��� ī�޶�� ���� ������ �������� input�� by �̱�ȯ  -->
							  <label id="lb" class="btn btn-primary btn-file">
						      	�����߰� <input type="file" style="display: none;" id="camera" name="camera" capture="camera" accept="image/*" 
						      			onclick="ChangeImg()"/>
						      </label>
						<br /> <img id="pic" style="width: 256px; height:256px" />

							
							
					</form>
						<br /> <button id="anal_btn" type="submit" class="btn btn-info btn-sm"
							onclick="ImgCheck()">�м��ϱ�</button>
				</div>
			</div>
			<!-- Content Row-->
			<div class="row gx-4 gx-lg-5" style="display:none">
				<div class="col-md-6 mb-5">
					<h2 class="card-title">������ ����</h2>
					<div class="card h-100">
						<div class="card-body">
							<p id="symtoms" class="card-text">�߻�����</p>
						</div>
					</div>
				</div>
				<div class="col-md-6 mb-5">
					<h2 class="card-title">������ �ذ���</h2>
					<div class="card h-100">
						<div class="card-body">
							<p id="solution" class="card-text">�ذ���</p>
						</div>
					</div>
				</div>
					<h2 class="card-title">����ؾ��� ���</h2>
					<div class="card h-100">
						<div class="card-body">
							<p id="pestItem" class="card-text">�ذ���</p>
						</div>
					</div>
			</div>
		</div>
	</main>
	<!-- Footer-->
	<!-- �� �ִ��� �� Ŭ���� Ǫ�� -->
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
				url: 'uploadAjaxAction.do',			// ������ ��û�� ���� url
		    	processData : false,				// ������ ������ �����͸� queryString ���·� ��ȯ���� ����
		    	contentType : false,				// ������ �����Ǵ� �������� content-type
		    	data : formData,					// ������ ������ ������
		    	type : 'POST',						// ���� ��û Ÿ��(GET, POST)
		    	dataType : 'json',					// �����κ��� ��ȯ���� ������ Ÿ��
		    	success : function(result) {
		    			console.log(result);
		    	},
		    	error : fucntion(result) {
		    			alert("�̹��� ������ �ƴմϴ�.");
		    	}
			});	
		});

		/* var, method related with attachFile */
		let regex = new RegExp("(.*?)\.(jpg|png)$");

		function fileCheck(fileName) {
			if (!regex.test(fileName)) {
				alert("�ش� ������ ������ ���ε��� �� �����ϴ�.");
				return false;
			}
			return true;
		}
	</script>

</body>

</html>