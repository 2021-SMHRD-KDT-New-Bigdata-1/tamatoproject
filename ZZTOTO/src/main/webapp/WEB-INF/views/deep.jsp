<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 분석할 사진을 업로드하여 분석 API를 활용하여 분석 결과를 출력하는 페이지 by 이길환 -->

<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="viewport" content="width=320" />
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">

<title>KingTomato</title>

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- 로딩 애니메이션 CSS by 이길환    -->
<style>
/* Center the loader */
#loader {
  position: fixed;
  left: 54%;
  top: 50%;
  z-index: 1;
  width: 120px;
  height: 120px;
  margin: -76px 0 0 -76px;
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #3498db;
  -webkit-animation: spin 2s linear infinite;
  animation: spin 2s linear infinite;
}

@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

/* Add animation to "page content" */
.animate-bottom {
  position: relative;
  -webkit-animation-name: animatebottom;
  -webkit-animation-duration: 1s;
  animation-name: animatebottom;
  animation-duration: 1s
}

@-webkit-keyframes animatebottom {
  from { bottom:-100px; opacity:0 } 
  to { bottom:0px; opacity:1 }
}

@keyframes animatebottom { 
  from{ bottom:-100px; opacity:0 } 
  to{ bottom:0; opacity:1 }
}

</style>


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
	var p_name = "";
	function myFunction() {
  	  $('#loader').attr('style', "display:fixed")
  	  //myVar = setTimeout(showPage, 10000);
  	}

  	function showPage() {
  	  document.getElementById("loader").style.display = "none";
  	}
  	
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
         
      }else{
         $('div.row.gx-4.gx-lg-5:not(.my-5)')[0].style.display='none'
             $('#check_btn').attr('style',"display:flex")  
         }
   }
   
   function SeeImg(){ // 분석한 사진 업로드 눌렀을 때 작동하는 함수
      // var img = $('#pic')[0].src;
       $('div.row.gx-4.gx-lg-5:not(.my-5)')[0].style.display='flex'
   }
   /* 업로드한 사진을 분석하여 분석한 병충해명을 받아오는 함수 by이길환 */
   $(function () {
        $('#anal_btn').on('click', function () {
        	myFunction()
            $.ajax({
                url: 'http://222.102.43.169:8000/api/pest_analysis',
                type: 'get',
                datatype: 'json',
                async: true,
                timeout: 20000,
                success: function (data) {
                	showPage()
                	var myVar;

                	
                    //alert("성공!")
                    
                    alert("분석이 완료되었습니다.") // 장고에서 받아온 데이터가 들어갔는지 확인
                    p_name = data;
                },
                error: function (request, status, error) {
                	showPage()
                	//alert("error code:" + request.status+ "\n" + "message:" + request.responseText+"\n"+"error:"+error)
                }
            })
        })
        
    })
    
    
    	/* 분석한 병충해 명을 p_name변수에 담아 병충해 명이 바뀔때 마다 병충해에 맞는 정보를 
    	   response받아주는 함수 by 이길환*/
    $(function () {
    	
        $('#check_btn').on('click', function () { // '분석한 사진 보기'버튼에 대한 제이쿼리함수 
            $.ajax({
                url: 'http://222.102.43.169:8000/api/pest_analysis/'+p_name,
                type: 'get',
                datatype: 'json',
                async: 'False',
                success: function (data) {
                    console.log(data[0])
                        $("#symtoms").html(data.pest_reason);
                        $("#solution").html(data.pest_solution);
                        $("#pestItem").html(data.pesticide);
                        $("#pestName").html(data.pest_name);
                        $('#pic').attr('src', '/myapp2/resources/images/pre.png');
                },
                error: function (err) {
					alert(err)
                }
            })
        })
    })
</script>
</head>

<body  style="margin:0;">
	<!-- ***** Header Area Start ***** -->
	<header class="header-area header-sticky">
	<div id="loader" style="display:none;"></div>
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav class="main-nav">
						<!-- ***** Logo Start ***** -->
						<a href="index.do" class="logo"> 피톤치드 </a>
						<!-- ***** Logo End ***** -->
						<!-- ***** Menu Start ***** -->
						<ul class="nav">
							<li><a href="#top" class="active">Home</a></li>
							<li><a href="deep.do">병충해 진단</a></li>
							<li><a href="notification.do">일정관리</a></li>
							<li><a href="drone.do">드론방역</a></li>
							<li><a href="farm_diary.do">영농일지</a></li>
							<!-- 로그인이 안되어있을때 -->
							<c:if test="${vo==null}">
								<li><a href="javascript:kakaoLogin();"><img
										src="${pageContext.request.contextPath}/resources/images/kakaoLogin.png"
										style="height: 30px; width: 80px;"></a></li>
							</c:if>
							<!-- 로그인이 되어있을때 -->
							<c:if test="${vo!=null}">
								<li><button type="button" class="btn btn-info btn-sm"
										onclick="logout()">로그아웃</button></li>
							</c:if>
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
                     
                     
                     <!-- 호출된 카메라로 찍은 사진을 가져오는 input값 by 이길환  -->
						<label id="lb" class="btn btn-primary btn-file"> 사진추가 <input
							type="file" style="display: none;" id="camera" name="camera"
							capture="camera" accept="image/*" />
						</label> <br /> <img id="pic" style="width: 256px; height: 256px" />

					</form>
					<div style="display: flex; margin-top: 8px">
						<br />
						<button id="anal_btn" type="submit" class="btn btn-success"
							onclick="ImgCheck()">분석하기</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button id="check_btn" type="submit" class="btn btn-danger"
							onclick="SeeImg()" style="display: none;">결과보기</button>
					</div>
				</div>
			</div>

			<!-- Content Row-->
			<div id=PestBug class="row gx-4 gx-lg-5" style="display: none">
				<div class="col-md-6 mb-5">
					<h2 class="card-title">병충해 명</h2>
					<div class="card h-100" style="height: 60% !important;">
						<div class="card-body">
							<p id="pestName" class="card-text">발생원인</p>
						</div>
					</div>
				</div>

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

	<!-- <footer class="py-5 bg-dark">
      <div class="container px-4 px-lg-5"> -->
   <div class="footer">
      <p class="m-0 text-center text-white">Copyright 2022 Kkumchi All Rights Reserved.</p>
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
            url: 'uploadAjaxAction.do',         // 서버로 요청을 보낼 url
             processData : false,            // 서버로 전송할 데이터를 queryString 형태로 변환할지 여부
             contentType : false,            // 서버로 전성되는 데이터의 content-type
             data : formData,               // 서버로 전송할 데이터
             type : 'POST',                  // 서버 요청 타입(GET, POST)
             dataType : 'json',               // 서버로부터 반환받을 데이터 타입
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
	<!-- Scripts -->
	<!-- CDN for Bootstrap -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
		integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
		integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
		crossorigin="anonymous"></script>

	<!-- Bootstrap core JavaScript -->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/js/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="resources/js/isotope.min.js"></script>
	<script src="resources/js/owl-carousel.js"></script>
	<script src="resources/js/lightbox.js"></script>
	<script src="resources/js/tabs.js"></script>
	<script src="resources/js/video.js"></script>
	<script src="resources/js/slick-slider.js"></script>
	<script src="resources/js/custom.js"></script>


	<script>
      //according to loftblog tut
      $('.nav li:first').addClass('active');

      var showSection = function showSection(section, isAnimate) {
        var
          direction = section.replace(/#/, ''),
          reqSection = $('.section').filter('[data-section="' + direction + '"]'),
          reqSectionPos = reqSection.offset().top - 0;

        if (isAnimate) {
          $('body, html').animate({
            scrollTop: reqSectionPos
          },
            800);
        } else {
          $('body, html').scrollTop(reqSectionPos);
        }
      };

      var checkSection = function checkSection() {
        $('.section').each(function () {
          var
            $this = $(this),
            topEdge = $this.offset().top - 80,
            bottomEdge = topEdge + $this.height(),
            wScroll = $(window).scrollTop();
          if (topEdge < wScroll && bottomEdge > wScroll) {
            var
              currentId = $this.data('section'),
              reqLink = $('a').filter('[href*=\\#' + currentId + ']');
            reqLink.closest('li').addClass('active').
              siblings().removeClass('active');
          }
        });
      };

      $('.main-menu, .responsive-menu').on('click', 'a', function (e) {
        e.preventDefault();
        showSection($(this).attr('href'), true);
      });

      $(window).scroll(function () {
        checkSection();
      });
    </script>
	<script>
	function logout() {
		location.href="logout.do";
	}
	</script>
	<!-- 카카오톡 로그인 기능 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
        window.Kakao.init("e9d0bcae2dc6950a5ef78930a776afb9");

        function kakaoLogin() {
            window.Kakao.Auth.login({
                scope: 'profile_nickname, account_email',
                success: function(authObj) {
                	console.log(authObj)	// 로그인 성공시 받아오는 데이터
                    window.Kakao.API.request({ 
                        url: '/v2/user/me',
                        success: res => {
                            const kakao_account = res.kakao_account;
                            /* console.log(kakao_account);
                            console.log(kakao_account.email) */
                            $.ajax({
                    			url : "login.do",
                    			type : "post",
                    			dataType: "json",
                    			data : {"member_id":kakao_account.email, "member_name":kakao_account.profile.nickname},
                    			success : function(){location.reload();},
                    			error : function(){ console.log("error") }
                    		});
                        }
                    });
                },
                fail: function(error) {
                    console.log(error);
                }
            });
        }
</script>


<script>

</script>

</body>

</html>