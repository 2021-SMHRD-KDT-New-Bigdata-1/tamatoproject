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
<meta name="description" content="">
<meta name="author" content="TemplateMo">
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
<!--

TemplateMo 569 Edu Meeting

https://templatemo.com/tm-569-edu-meeting

-->
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
							<li><a href="#top" class="active">Home</a></li>
							<li><a href="deep.do">병충해 진단</a></li>
							<li><a href="notification.do">할 일</a></li>
							<li><a href="drone.do">드론 방역/방제</a></li>
							<li><a href="news.do">농업 정책</a></li>
							<c:if test="${vo==null}">
								<li><div class="kakaobtn" id="kakaologin">
										<input type="hidden" name="kakoemail" id="kakaoemail">
										<input type="hidden" name="kakoname" id="kakaoname">
									</div> <a href="javascript:kakaoLogin();"><img
										src="${pageContext.request.contextPath}/resources/images/kakaoLogin.png"
										style="height: 30px; width: 80px;"></a></li>
							</c:if>
							<!-- kakao정보를 넘기기위해 만든 form(숨김) -->
							<form action="/login.do" method="post" name="lfrm" hidden="">
								<input type="text" name="kakaoemail" id="kakaoemail" value="" />
							</form>
							<c:if test="${vo==null}">
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

	<!-- ***** Main Area Start ***** -->
	<main>
		<section class="py-5 text-center container">
			<div class="row py-lg-5">
				<div class="col-lg-6 col-md-8 mx-auto">
					<h1 class="fw-light">Album example</h1>

					<p>
						<a href="#" class="btn btn-primary my-2">Main call to action</a> <a
							href="#" class="btn btn-secondary my-2">Secondary action</a>
					</p>
				</div>
			</div>
		</section>

		<!-- Main Grid -->
		<div class="album py-5 bg-light">
			<div class="container">
				<div class="row row-cols-1 row-cols-sm-4 g-3">
					<div class="col col-6">
						<a href="deep.do">
							<div class="card shadow-sm">
								<svg class="bd-placeholder-img card-img-top" width="100%"
									height="0" xmlns="http://www.w3.org/2000/svg" role="img"
									aria-label="Placeholder: Thumbnail"
									preserveAspectRatio="xMidYMid slice" focusable="false">
                 
                  <title>Placeholder</title>
                 	<img id="icon"
										src="${pageContext.request.contextPath}/resources/images/camera2.png">
                 </svg>
								<div class="card-body">
									<h4 class="card-text">병충해 진단</h4>
								</div>
							</div>
						</a>
					</div>
					<div class="col col-6">
						<a href="notification.do">
							<div class="card shadow-sm">
								<svg class="bd-placeholder-img card-img-top" width="100%"
									height="0" xmlns="http://www.w3.org/2000/svg" role="img"
									aria-label="Placeholder: Thumbnail"
									preserveAspectRatio="xMidYMid slice" focusable="false">
                <title>Placeholder</title>
                <img id="icon"
										src="${pageContext.request.contextPath}/resources/images/farming.png">
                </svg>
								<div class="card-body">
									<h4 class="card-text">할 일</h4>
								</div>
							</div>
						</a>
					</div>
					<div class="col col-6">
						<a href="drone.do">
							<div class="card shadow-sm">
								<svg class="bd-placeholder-img card-img-top" width="100%"
									height="0" xmlns="http://www.w3.org/2000/svg" role="img"
									aria-label="Placeholder: Thumbnail"
									preserveAspectRatio="xMidYMid slice" focusable="false">
                <title>Placeholder</title>
                <img id="icon"
										src="${pageContext.request.contextPath}/resources/images/drone3.png">
                </svg>

								<div class="card-body">
									<h4 class="card-text">드론 방역/방제</h4>
								</div>
							</div>
						</a>
					</div>

					<div class="col col-6">
						<a href="news.do">
							<div class="card shadow-sm">
								<svg class="bd-placeholder-img card-img-top" width="100%"
									height="0" xmlns="http://www.w3.org/2000/svg" role="img"
									aria-label="Placeholder: Thumbnail"
									preserveAspectRatio="xMidYMid slice" focusable="false">
                <title>Placeholder</title>
                <img id="icon"
										src="${pageContext.request.contextPath}/resources/images/newspaper.png">
                </svg>
								<div class="card-body">
									<h4 class="card-text">농업 정책</h4>
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
		<!-- ***** Main Area End ***** -->
	</main>
	<!-- Footer start -->
	<div class="footer">
		<p>Copyright 2022 Edu Meeting Co., Ltd. All Rights Reserved.</p>
	</div>
	<!-- Footer End -->

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

	<!-- 카카오톡 로그인 기능 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
        window.Kakao.init("e9d0bcae2dc6950a5ef78930a776afb9");

        function kakaoLogin() {
            window.Kakao.Auth.login({
                scope: 'profile_nickname,account_email',
                success: function(authObj) {
                    window.Kakao.API.request({ 
                        url: '/v2/user/me',
                        success: res => {
                            const email = res.kakao_account;
                            const name = res.properties.nickname;
                            
                            $('#kakaoemail').val(email);
                            $('#kakaoname').val(name);
                            
                            $.ajax({
                    			url : "login.do",
                    			type : "post",
                    			data : {"member_id":email, "member_name":name},
                    			success : window.location.href="http://localhost:8085/myapp2/index.do",
                    			error : function(){ alert("error"); }
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


</body>

</html>