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

<!-- CDN for Datepicker -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
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

<!-- jquery datepicker -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!-- jquery datepicker 끝 -->

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
			<input type="hidden" name="year" value="${today_info.search_year}" />
			<input type="hidden" name="month"
				value="${today_info.search_month-1}" />
			<script>
				var message = "${message}";
				console.log(message);
				if(message!=""){
					alert(message);
					}
			</script>
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
					<button type="button"
						class="btn btn-primary pull-right board_move openMask_board_move pointer"
						data-bs-toggle="modal" data-bs-target="#addSchedule">일정
						추가</button>
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
										<c:if test="${date_status.index%7==0}">
											<tr>
										</c:if>
										<td class="today">
											<div class="date">
									</c:when>
									<c:when test="${date_status.index%7==6}">
										<td class="sat_day">
											<div class="sat">
									</c:when>
									<c:when test="${date_status.index%7==0}">
						</tr>
						<tr>
							<td class="sun_day">
								<div class="sun">
									</c:when>
									<c:otherwise>
										<td class="normal_day">
											<div class="date">
									</c:otherwise>
									</c:choose>
									${dateList.date}
								</div>
								<div>
									<c:forEach var="scheduleList"
										items="${dateList.schedule_data_arr}"
										varStatus="schedule_data_arr_status">
										<p class="date_subject">${scheduleList.schedule_title}</p>
									</c:forEach>
								</div>
							</td>
							</c:forEach>
					</tbody>

				</table>
		</form>
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
						<form name="schedule_add" action="schedule_add.do">
							<div class="contents">
								<ul>
									<li>
										<div class="text_subject">제목 :</div>
										<div class="text_desc">
											<input type="text" name="schedule_title" class="text_type1" />
										</div>
									</li>
									<li>
										<div class="text_subject">내용 :</div>
										<div class="text_area_desc">
											<textarea name="schedule_content" class="textarea_type1"
												rows="7"></textarea>
										</div>
									</li>
									<li>
										<div class="text_subject">날짜 :</div>
										<div class="text_desc">
											<input type="text" name="schedule_date" class="text_type1" id="testDatepicker" readonly="readonly" /> 
											<input type="hidden" name="member_id" value="${vo.member_id}" />
										</div>
									</li>
								</ul>
							</div>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button"
							class="btn btn-primary board_move_go pointer"
							data-bs-dismiss="modal" onclick="scheduleAdd();">일정 등록</button>
						<button type="button" class="btn btn-danger"
							data-bs-dismiss="modal">Close</button>
					</div>
				</div>
				</form>
			</div>
		</div>
		<div id="mask_board_move"></div>
		<div class="normal_move_board_modal">
			<script>
			$(function() {
			    $( "#testDatepicker" ).datepicker({
			    	
			        dateFormat: "yy-mm-dd",
			    	changeMonth: true, 
			        changeYear: true,
			        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
			        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
			        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12']
			    });
			});
			function scheduleAdd(){
				var schedule_add_form = document.schedule_add;
				if(schedule_add_form.schedule_date.value==""||schedule_add_form.schedule_date.value==null){
					alert("날짜를 입력해주세요.");
					schedule_add_form.schedule_date.focus();
					return false;
				}else if(schedule_add_form.schedule_title.value==""||schedule_add_form.schedule_title.value==null){
					alert("제목을 입력해주세요.");
					schedule_add_form.schedule_title.focus();
					return false;
				}
				schedule_add_form.submit();
			}
		</script>
		</div>
	</main>
	<!-- Footer Start -->
	<div class="footer">
		<!-- <footer class="py-5 bg-dark"> <!--왜 있는지 모를 class  -->
		<!-- <div class="container px-4 px-lg-5"> -->
		<p class="m-0 text-center text-white">Copyright &copy; Your
			Website 2021</p>
		<!-- </div> -->
		<!-- </footer> -->
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

</body>

</html>