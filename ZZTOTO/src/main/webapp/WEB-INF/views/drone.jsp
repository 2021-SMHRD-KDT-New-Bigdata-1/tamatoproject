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
<<<<<<< HEAD
=======
<SCRIPT LANGUAGE="JavaScript">
        Now = new Date();
        NowDay = Now.getDate();
        NowMonth = Now.getMonth();
        NowYear = Now.getYear();
        if (NowYear < 2000) NowYear += 1900;
        function DaysInMonth(WhichMonth, WhichYear) {
            var DaysInMonth = 31;
            if (WhichMonth == "Apr" || WhichMonth == "Jun" || WhichMonth == "Sep" || WhichMonth == "Nov") DaysInMonth = 30;
            if (WhichMonth == "Feb" && (WhichYear / 4) != Math.floor(WhichYear / 4)) DaysInMonth = 28;
            if (WhichMonth == "Feb" && (WhichYear / 4) == Math.floor(WhichYear / 4)) DaysInMonth = 29;
            return DaysInMonth;
        }

        function ChangeOptionDays(Which) {
            DaysObject = eval("document.Form1." + Which + "Day");
            MonthObject = eval("document.Form1." + Which + "Month");
            YearObject = eval("document.Form1." + Which + "Year");

            Month = MonthObject[MonthObject.selectedIndex].text;
            Year = YearObject[YearObject.selectedIndex].text;

            DaysForThisSelection = DaysInMonth(Month, Year);
            CurrentDaysInSelection = DaysObject.length;
            if (CurrentDaysInSelection > DaysForThisSelection) {
                for (i = 0; i < (CurrentDaysInSelection - DaysForThisSelection); i++) {
                    DaysObject.options[DaysObject.options.length - 1] = null
                }
            }
            if (DaysForThisSelection > CurrentDaysInSelection) {
                for (i = 0; i < (DaysForThisSelection - CurrentDaysInSelection); i++) {
                    NewOption = new Option(DaysObject.options.length + 1);
                    DaysObject.add(NewOption);
                }
            }
            if (DaysObject.selectedIndex < 0) DaysObject.selectedIndex == 0;
        }

        function SetToToday(Which) {
            DaysObject = eval("document.Form1." + Which + "Day");
            MonthObject = eval("document.Form1." + Which + "Month");
            YearObject = eval("document.Form1." + Which + "Year");

            YearObject[0].selected = true;
            MonthObject[NowMonth].selected = true;

            ChangeOptionDays(Which);

            DaysObject[NowDay - 1].selected = true;
        }

        function WriteYearOptions(YearsAhead) {
            line = "";
            for (i = 0; i < YearsAhead; i++) {
                line += "<OPTION>";
                line += NowYear + i;
            }
            return line;
        }
        // -->
    </script>
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-New-Bigdata-1/tomatoproject.git
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
