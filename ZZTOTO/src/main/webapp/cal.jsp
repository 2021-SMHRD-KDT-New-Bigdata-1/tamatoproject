<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <!-- 날짜 선택 자바스크립트 by 이길환 -->
    <style>
        body,td {font-size:12px}
        </style>
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
</head>
	
	<!--  -->
    <body onLoad="SetToToday('FirstSelect');">

        <B>오늘 연도와 날짜가 자동으로 선택 됩니다</B>
        
        <!----- 3. 원하는 위치에 아래와 같이 코드를 붙여 넣으세요 ------->
        
        <FORM name="Form1">
        <SELECT name="FirstSelectYear" onchange="ChangeOptionDays('FirstSelect')">
                <SCRIPT language="JavaScript">
                        document.write(WriteYearOptions(50));
                </SCRIPT>
        </SELECT>
        
        <SELECT name="FirstSelectMonth" onchange="ChangeOptionDays('FirstSelect')">
        <!------ 필요하면 아래 월 표시를 한글로 바꾸어 주세요 ------->
                <OPTION>Jan
                <OPTION>Feb
                <OPTION>Mar
                <OPTION>Apr
                <OPTION>May
                <OPTION>Jun
                <OPTION>Jul
                <OPTION>Aug
                <OPTION>Sep
                <OPTION>Oct
                <OPTION>Nov
                <OPTION>Dec
        </SELECT>
        <SELECT name="FirstSelectDay">
                <OPTION>1
                <OPTION>2
                <OPTION>3
                <OPTION>4
                <OPTION>5
                <OPTION>6
                <OPTION>7
                <OPTION>8
                <OPTION>9
                <OPTION>10
                <OPTION>11
                <OPTION>12
                <OPTION>13
                <OPTION>14
                <OPTION>15
                <OPTION>16
                <OPTION>17
                <OPTION>18
                <OPTION>19
                <OPTION>20
                <OPTION>21
                <OPTION>22
                <OPTION>23
                <OPTION>24
                <OPTION>25
                <OPTION>26
                <OPTION>27
                <OPTION>28
                <OPTION>29
                <OPTION>30
                <OPTION>31
        </SELECT>
        </FORM>
        
        
    </body>
        </HTML>