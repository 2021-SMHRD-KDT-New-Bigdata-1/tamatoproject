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
	
	
	<!-- Additional CSS Files -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fontawesome.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/templatemo-edu-meeting.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lightbox.css">
	
	
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/drone.css">



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
	
	
<div style="height:80%; align:center;" >
	<h3 style="text-align:center">방제예약신청</h3>
	<form action="droneInsert.do" method="post">
		<fieldset class="field" style="width: 100%; margin:2;">
			<legend style="text-align:center">
				<strong class="m_box" style="font-size:75%">개인정보</strong>
			</legend>
			<div class="double-input">
				<div class="form-input-container">
					<input type="hidden" name="member_id" value="${vo.member_id}" /> 
					<label for="proposer_Name" style="font-size:75%;">이름</label><br> 
					<input type="text" name="proposer_Name" id="proposer_Name" placeholder="이름을 입력해 주세요"
						minlength="3" required />
				</div>
				<div class="form-input-container">
					<label for="proposer_Email" style="font-size:75%;">이메일</label><br> 
					<input type="email" name="proposer_Email" id="proposer_Email" required
						placeholder="이메일을 입력해 주세요" required />
				</div>
			</div>
			<div class="double-input">
				<div class="form-input-container">
					<label for="proposer_Number" style="font-size:75%;">연락처</label><br> 
					<input type="tel" name="proposer_Number" id="proposer_Number"
						placeholder="전화번호를 입력해 주세요" required />
				</div>
				<div class="form-input-container">
					<label for="proposer_Address" style="font-size:75%;">주소</label><br> <input
						type="text" name="proposer_Address" id="proposer_Address"
						placeholder="주소를 입력해 주세요" required />
				</div>
			</div>
		</fieldset>
		<fieldset class="field" style="margin:2; width:100%;">
			<legend class="m_box" style="text-align:center">
				<strong style="font-size:75%;" >예약 정보</strong>
			</legend>
			<div class="double-input">
				<div class="form-input-container">
					<label for="land_Type" style="font-size:75%;">농지 유형</label><br> <select
						name="land_Type" id="land_Type">
						<option value="논">논</option>
						<option value="밭">밭</option>
						<option value="과수원">과수원</option>
					</select>
				</div>
				<div class="form-input-container">
					<label for="area" style="font-size:75%;">면적<a style="font-size: 30px">(단위 : 평)</a></label><br>
					<input type="text" name="area" id="area" placeholder="평수를 입력해주세요" />
				</div>
			</div>
			<div class="double-input">
				<div class="form-input-container date-select">
					<label for="pesticide" style="font-size:75%;">농약보유</label><br> <select
						name="pesticide" id="pesticide">
						<option value="미보유" disabled selected>미보유</option>
						<option value="0">미보유</option>
						<option value="1">보유</option>
					</select> </select>
				</div>
				<div>
					<div class="form-input-container">
						<label for="pest_Name" style="font-size:75%;">병명</label><br> <input type="text"
							name="pest_Name" id="pest_Name" placeholder="병명을 입력해주세요" />
					</div>

					<div class="form-input-container">
						<label for="crop_Name" style="font-size:75%;">작물명</label><br> <input type="text"
							name="crop_Name" id="crop_Name" placeholder="작물명을 입력해주세요" />
					</div>
				</div>
				<div class="form-input-container date-select">
					<label for="reservation_Date" style="font-size:75%;">예약 날짜</label><br> <input
						class="calender" name="reservation_Date" type="datetime-local">
				</div>
			</div>
		</fieldset>
		<button type="submit" style="font-size:30px">예약신청</button>
	</form>
</div>
	
	
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