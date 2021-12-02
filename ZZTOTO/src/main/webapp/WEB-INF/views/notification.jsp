<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="content-type" content="text/html; charset=utf-8">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">



<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
	
<!-- Additional CSS Files -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/calendar.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fontawesome.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/templatemo-edu-meeting.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lightbox.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- CDN for Datepicker -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css" />
	
<title>KingTomato</title>

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
								<li><a href="javascript:kakaoLogin();"><img
										src="${pageContext.request.contextPath}/resources/images/kakaoLogin.png"
										style="height: 30px; width: 80px;"></a></li>
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
		<form name="calendarFrm" id="calendarFrm" action="" method="GET">

			<div class="calendar">

				<!--날짜 네비게이션  -->
				<div class="navigation">
					<a class="before_after_year"
						href="./notification.do?year=${today_info.search_year-1}&month=${today_info.search_month-1}">
						&lt;&lt; <!-- 이전해 -->
					</a> <a class="before_after_month"
						href="./notification.do?year=${today_info.before_year}&month=${today_info.before_month}">
						&lt; <!-- 이전달 -->
					</a> <span class="this_month"> &nbsp;${today_info.search_year}.
						<c:if test="${today_info.search_month<10}">0</c:if>${today_info.search_month}
					</span> <a class="before_after_month"
						href="./notification.do?year=${today_info.after_year}&month=${today_info.after_month}">
						<!-- 다음달 --> &gt;
					</a> <a class="before_after_year"
						href="./notification.do?year=${today_info.search_year+1}&month=${today_info.search_month-1}">
						<!-- 다음해 --> &gt;&gt;
					</a>
					<button type="button" class="btn btn-primary pull-right"
						data-bs-toggle="modal" data-bs-target="#addSchedule">일정
						추가</button>
				</div>

				<!-- The Modal -->
				<div class="modal" id="addSchedule">
					<div class="modal-dialog">
						<div class="modal-content">

							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">일정 관리</h4>
								<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
							</div>

							<!-- Modal body -->
							<div class="modal-body">
								<table class="table table-hover">
									<tbody>
										<tr>
											<td>제목</td>
											<td><input type="text" style="width: 100%"></td>
										</tr>
										<tr>
											<td>날짜</td>
											<td>
												<div class="input-group date" id="datetimepicker1"
													data-target-input="nearest">
													<input type="text"
														class="form-control datetimepicker-input"
														data-target="#datetimepicker1" value="${today_date}">
													<div class="input-group-append"
														data-target="#datetimepicker1"
														data-toggle="datetimepicker">
														<div class="input-group-text" style="height: 100%">
															<i class="fa fa-calendar"></i>
														</div>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td>내용</td>
											<td><textarea style="width: 100%"></textarea></td>
										</tr>
									</tbody>
								</table>
							</div>

							<!-- Modal footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-primary"
									data-bs-dismiss="modal">일정 등록</button>
								<button type="button" class="btn btn-danger"
									data-bs-dismiss="modal">Close</button>
							</div>

						</div>
					</div>
				</div>
				<!-- <div class="today_button_div"> -->
				<!-- <input type="button" class="today_button" onclick="javascript:location.href='/calendar.do'" value="go today"/> -->
				<!-- </div> -->
				<table class="calendar_body">

					<thead>
						<tr bgcolor="#CECECE">
							<td class="day sun">일</td>
							<td class="day">월</td>
							<td class="day">화</td>
							<td class="day">수</td>
							<td class="day">목</td>
							<td class="day">금</td>
							<td class="day sat">토</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<c:forEach var="dateList" items="${dateList}"
								varStatus="date_status">
								<c:choose>
									<c:when test="${dateList.value=='today'}">
										<td class="today">
											<div class="date">${dateList.date}</div>
											<div></div>
										</td>
									</c:when>
									<c:when test="${date_status.index%7==6}">
										<td class="sat_day">
											<div class="sat">${dateList.date}</div>
											<div></div>
										</td>
									</c:when>
									<c:when test="${date_status.index%7==0}">
						</tr>
						<tr>
							<td class="sun_day">
								<div class="sun">${dateList.date}</div>
								<div></div>
							</td>
							</c:when>
							<c:otherwise>
								<td class="normal_day">
									<div class="date">${dateList.date}</div>
									<div></div>
								</td>
							</c:otherwise>
							</c:choose>
							</c:forEach>
					</tbody>
				</table>
			</div>
		</form>
	</main>
	<!-- Footer Start -->
	<div class='footer'>
		<footer class="py-5 bg-dark">
			<div class="container px-4 px-lg-5">
				<p class="m-0 text-center text-white">Copyright &copy; Your
					Website 2021</p>
			</div>
		</footer>	
	</div>
	<!-- Footer End -->

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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

      $('.main-menu, .responsive-menu, .scroll-to-section').on('click', 'a', function (e) {
        e.preventDefault();
        showSection($(this).attr('href'), true);
      });

      $(window).scroll(function () {
        checkSection();
      });
    </script>

	<script type="text/javascript"> 
		$(function () { $('#datetimepicker1').datetimepicker({ format: 'L'}); 
		}); 
	</script>

</body>

</html>