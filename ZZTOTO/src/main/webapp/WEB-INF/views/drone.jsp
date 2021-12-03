<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport  initial-scale=0, user-scalable=no" >
<title>��� ���� ����</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/drone.css">

</head>

<body>
	<h1>���������û</h1>
	<form action="droneInsert.do" method="post">
		<fieldset class="field" style =  "width: 100%; margin: 0 auto;">
			<legend>
				<strong>��������</strong>
			</legend>
			<div class="double-input">
				<div class="form-input-container">
					<label for="proposer_Name">�̸�</label><br> <input type="text"
						name="proposer_Name" id="proposer_Name" placeholder="�̸��� �Է��� �ּ���" minlength="3"
						required />
				</div>
				<div class="form-input-container">
					<label for="proposer_Email">�̸���</label><br> <input type="email"
						name="proposer_Email" id="proposer_Email" required placeholder="�̸����� �Է��� �ּ���"
						required />
				</div>
			</div>
			<div class="double-input">
				<div class="form-input-container">
					<label for="proposer_Number">����ó</label><br> <input type="tel"
						name="proposer_Number" id="proposer_Number" placeholder="��ȭ��ȣ�� �Է��� �ּ���" required />
				</div>
				<div class="form-input-container">
					<label for="proposer_Address">�ּ�</label><br> <input type="text"
						name="proposer_Address" id="proposer_Address" placeholder="�ּҸ� �Է��� �ּ���" required />
				</div>
			</div>
		</fieldset>
		<fieldset class="field" style =  "width: 100%; margin: 0 auto;">
			<legend>
				<strong>���� ����</strong>
			</legend>
			<div class="double-input">
				<div class="form-input-container">
					<label for="land_Type">���� ����</label><br> <select
						name="land_Type" id="land_Type">
						<option value="Wroclaw">Wroclaw</option>
						<option value="Warsaw">Warsaw</option>
						<option value="Plock">Plock</option>
						<option value="Krakow">Krakow</option>
					</select>
				</div>
				<div class="form-input-container">
					<label for="area">����<a style = "font-size:30px">(���� : ��)</a></label><br> 
						<input type="text" name="area" id="area" placeholder="����� �Է����ּ���"  />
				</div>
			</div>
			<div class="double-input">
				<div class="form-input-container date-select">
					<label for="pesticide">��ຸ��</label><br> <select
						name="pesticide" id="pesticide">
						<option value="�̺���" disabled selected>�̺���</option>
						<option value="0">�̺���</option>
						<option value="1">����</option>
					</select> </select>
				</div>
				<div>
					<div class="form-input-container">
						<label for="pest_Name">����</label><br> 
						<input type="text" name="pest_Name" id="pest_Name" placeholder="������ �Է����ּ���"  />
					</div>

					<div class="form-input-container">
						<label for="crop_Name">�۹���</label><br> 
						<input type="text" name="crop_Name" id="crop_Name" placeholder="�۹����� �Է����ּ���"  />
					</div>
				</div>
				<div class="form-input-container date-select">
					<label for="reservation_Date">���� ��¥</label><br> 
					<input class = "calender" name = "reservation_Date" type="datetime-local">
				</div>
			</div>
		</fieldset>
		<button type="submit">�����û�ϱ�</button>
	</form>

</body>

</html>
