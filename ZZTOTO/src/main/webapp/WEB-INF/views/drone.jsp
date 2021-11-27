<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport"  initial-scale=0, user-scalable=no" >
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/drone.css">
</head>

<body>
	<h1>방제예약신청</h1>
	<form>
		<fieldset>
			<legend>
				<strong>개인정보</strong>
			</legend>
			<div class="double-input">
				<div class="form-input-container">
					<label for="name">이름</label><br> <input type="text"
						name="name" id="name" placeholder="이름을 입력해 주세요" minlength="3"
						required />
				</div>
				<div class="form-input-container">
					<label for="email">이메일</label><br> <input type="email"
						name="email" id="email" required placeholder="이메일을 입력해 주세요"
						required />
				</div>
			</div>
			<div class="double-input">
				<div class="form-input-container">
					<label for="phone">연락처</label><br> <input type="tel"
						name="phone" id="phone" placeholder="전화번호를 입력해 주세요" required />
				</div>
				<div class="form-input-container">
					<label for="phone">주소</label><br> <input type="text"
						name="phone" id="phone" placeholder="주소를 입력해 주세요" required />
				</div>
			</div>
		</fieldset>
		<fieldset>
			<legend>
				<strong>예약 정보</strong>
			</legend>
			<div class="double-input">
				<div class="form-input-container">
					<label for="hotelcity">논지 유형</label><br> <select
						name="hotelcity" id="hotelcity">
						<option value="Wroclaw">Wroclaw</option>
						<option value="Warsaw">Warsaw</option>
						<option value="Plock">Plock</option>
						<option value="Krakow">Krakow</option>
					</select>
				</div>
				<div class="form-input-container">
					<label for="capacity">면적<a style = "font-size:30px">(단위 : 평)</a></label><br> 
						<input type="text" name="capacity" id="capacity" placeholder="평수를 입력해주세요"  />
				</div>
			</div>
			<div class="double-input">
				<div class="form-input-container date-select">
					<label for="startdate">농약보유</label><br> <select
						name="start-date-day" id="start-date-day">
						<option value="미보유" disabled selected>미보유</option>
						<option value="1">미보유</option>
						<option value="1">보유</option>
					</select> </select>
				</div>
				<div>
					<div class="form-input-container">
						<label for="capacity">병명</label><br> 
						<input type="text" name="capacity" id="capacity" placeholder="병명을 입력해주세요"  />
					</div>

					<div class="form-input-container">
						<label for="capacity">작물명</label><br> 
						<input type="text" name="capacity" id="capacity" placeholder="작물명을 입력해주세요"  />
					</div>
				</div>
				<div class="form-input-container date-select">
					<label for="enddate">예약 날짜</label><br> 
					<input class = "calender" type="datetime-local">
				</div>
			</div>
		</fieldset>
		<button type="submit">예약신청하기</button>
	</form>
</body>

</html>
