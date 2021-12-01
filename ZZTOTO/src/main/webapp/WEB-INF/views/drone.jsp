<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport  initial-scale=0, user-scalable=no" >
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/drone.css">
</head>

<body>
	<h1>방제예약신청</h1>
	<form action="droneInsert.do" method="post">
		<fieldset>
			<legend>
				<strong>개인정보</strong>
			</legend>
			<div class="double-input">
				<div class="form-input-container">
					<label for="proposer_Name">이름</label><br> <input type="text"
						name="proposer_Name" id="proposer_Name" placeholder="이름을 입력해 주세요" minlength="3"
						required />
				</div>
				<div class="form-input-container">
					<label for="proposer_Email">이메일</label><br> <input type="email"
						name="proposer_Email" id="proposer_Email" required placeholder="이메일을 입력해 주세요"
						required />
				</div>
			</div>
			<div class="double-input">
				<div class="form-input-container">
					<label for="proposer_Number">연락처</label><br> <input type="tel"
						name="proposer_Number" id="proposer_Number" placeholder="전화번호를 입력해 주세요" required />
				</div>
				<div class="form-input-container">
					<label for="proposer_Address">주소</label><br> <input type="text"
						name="proposer_Address" id="proposer_Address" placeholder="주소를 입력해 주세요" required />
				</div>
			</div>
		</fieldset>
		<fieldset>
			<legend>
				<strong>예약 정보</strong>
			</legend>
			<div class="double-input">
				<div class="form-input-container">
					<label for="land_Type">논지 유형</label><br> <select
						name="land_Type" id="land_Type">
						<option value="Wroclaw">Wroclaw</option>
						<option value="Warsaw">Warsaw</option>
						<option value="Plock">Plock</option>
						<option value="Krakow">Krakow</option>
					</select>
				</div>
				<div class="form-input-container">
					<label for="area">면적<a style = "font-size:30px">(단위 : 평)</a></label><br> 
						<input type="text" name="area" id="area" placeholder="평수를 입력해주세요"  />
				</div>
			</div>
			<div class="double-input">
				<div class="form-input-container date-select">
					<label for="pesticide">농약보유</label><br> <select
						name="pesticide" id="pesticide">
						<option value="미보유" disabled selected>미보유</option>
						<option value="0">미보유</option>
						<option value="1">보유</option>
					</select> </select>
				</div>
				<div>
					<div class="form-input-container">
						<label for="pest_Name">병명</label><br> 
						<input type="text" name="pest_Name" id="pest_Name" placeholder="병명을 입력해주세요"  />
					</div>

					<div class="form-input-container">
						<label for="crop_Name">작물명</label><br> 
						<input type="text" name="crop_Name" id="crop_Name" placeholder="작물명을 입력해주세요"  />
					</div>
				</div>
				<div class="form-input-container date-select">
					<label for="reservation_Date">예약 날짜</label><br> 
					<input class = "calender" name = "reservation_Date" type="datetime-local">
				</div>
			</div>
		</fieldset>
		<button type="submit">예약신청하기</button>
	</form>
</body>

</html>
