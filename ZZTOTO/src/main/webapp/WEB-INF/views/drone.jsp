<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport  initial-scale=0, user-scalable=yes">

<title>드론 방제 예약</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/drone.css">

<!-- Additional CSS Files -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fontawesome.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/templatemo-edu-meeting.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lightbox.css">

</head>

<body>

<!-- ***** Header Area Start ***** -->
	<header class="header-area header-sticky" style="background-color:white;">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav class="main-nav">
						<!-- ***** Logo Start ***** -->
						<a href="index.do" class="logo" style="font-family:locus_sangsang; margin-left:125px; margin-top:10px;"> 피톤치드 </a>
						<!-- ***** Logo End ***** -->
						<!-- ***** Menu Start ***** -->
						<ul class="nav" style="margin-right:50px;">
							<li><a href="#top" class="active">Home</a></li>
							<li><a href="deep.do">병충해 진단</a></li>
							<li><a href="notification.do">일정관리</a></li>
							<li><a href="drone.do">드론방역</a></li>
					 		<li><a href="farm_diary.do">영농일지</a></li>
							<!-- 로그인이 안되어있을때 -->
							<c:if test="${vo==null}">
								<li><a href="javascript:kakaoLogin();" style="margin-top:5px;"><img
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

</body>

</html>
