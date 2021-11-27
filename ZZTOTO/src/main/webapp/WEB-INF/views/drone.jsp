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
	<h1>���������û</h1>
	<form>
		<fieldset>
			<legend>
				<strong>��������</strong>
			</legend>
			<div class="double-input">
				<div class="form-input-container">
					<label for="name">�̸�</label><br> <input type="text"
						name="name" id="name" placeholder="�̸��� �Է��� �ּ���" minlength="3"
						required />
				</div>
				<div class="form-input-container">
					<label for="email">�̸���</label><br> <input type="email"
						name="email" id="email" required placeholder="�̸����� �Է��� �ּ���"
						required />
				</div>
			</div>
			<div class="double-input">
				<div class="form-input-container">
					<label for="phone">����ó</label><br> <input type="tel"
						name="phone" id="phone" placeholder="��ȭ��ȣ�� �Է��� �ּ���" required />
				</div>
				<div class="form-input-container">
					<label for="phone">�ּ�</label><br> <input type="text"
						name="phone" id="phone" placeholder="�ּҸ� �Է��� �ּ���" required />
				</div>
			</div>
		</fieldset>
		<fieldset>
			<legend>
				<strong>���� ����</strong>
			</legend>
			<div class="double-input">
				<div class="form-input-container">
					<label for="hotelcity">���� ����</label><br> <select
						name="hotelcity" id="hotelcity">
						<option value="Wroclaw">Wroclaw</option>
						<option value="Warsaw">Warsaw</option>
						<option value="Plock">Plock</option>
						<option value="Krakow">Krakow</option>
					</select>
				</div>
				<div class="form-input-container">
					<label for="capacity">����<a style = "font-size:30px">(���� : ��)</a></label><br> 
						<input type="text" name="capacity" id="capacity" placeholder="����� �Է����ּ���"  />
				</div>
			</div>
			<div class="double-input">
				<div class="form-input-container date-select">
					<label for="startdate">��ຸ��</label><br> <select
						name="start-date-day" id="start-date-day">
						<option value="�̺���" disabled selected>�̺���</option>
						<option value="1">�̺���</option>
						<option value="1">����</option>
					</select> </select>
				</div>
				<div>
					<div class="form-input-container">
						<label for="capacity">����</label><br> 
						<input type="text" name="capacity" id="capacity" placeholder="������ �Է����ּ���"  />
					</div>

					<div class="form-input-container">
						<label for="capacity">�۹���</label><br> 
						<input type="text" name="capacity" id="capacity" placeholder="�۹����� �Է����ּ���"  />
					</div>
				</div>
				<div class="form-input-container date-select">
					<label for="enddate">���� ��¥</label><br> 
					<input class = "calender" type="datetime-local">
				</div>
			</div>
		</fieldset>
		<button type="submit">�����û�ϱ�</button>
	</form>
</body>

</html>
