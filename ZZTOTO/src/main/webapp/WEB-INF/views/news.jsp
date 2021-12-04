<%@page import="com.mycompany.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%
  // 회원인증여부 체크하는 부분
     Member vo= (Member)session.getAttribute("vo");
  %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>영농일지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link
   href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
   rel="stylesheet">
   <link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/fontawesome.css">
   <link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/templatemo-edu-meeting.css">
   <link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/owl.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/lightbox.css">
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
    $(document).ready(function() {
        loadList();
    });

    function loadList(){
        $.ajax({
       url : "Farm_diaryList.do", // 파이썬 Flask Server : http://127.0.0.1:500
       type : "get",
       dataType : "json", // 서버로부터 받는 데이터 타입
        success : jsonHtml, // callback 함수
        error : function(c,e,a) {alert("로그인 후 이용해주세요");console.log(e)}
        });
    }                     //                      0      1   2... index
    function jsonHtml(data) {   // data => object(객체) : [{json}, {  }, {  })]]
        view = "<table class='table table-hover'>";
        view += "<tr>";
        view += "<td>번호</td>";
        view += "<td>제목</td>";
        view += "<td>날짜</td>";
        if(${vo!=null}){
           view += "<td>수정</td>";
           view += "<td>삭제</td>";
        }
        view += "</tr>";
        $.each(data, function(index, obj) {   // 람다식(익명함수) -> Node.js + Android
            view += "<tr>";
            view += "<td id='diary_num"+index+"'>" + obj.diary_num; + "</td>";
            view += "<td id='t"+index+"'><a href = 'javascript:ctFn("+index+")'>"+ obj.diary_subject + "</td>";
            view += "<td id='w"+index+"'>"+ obj.reg_date + "</td>";
            
            if(${vo!=null}){
               if('${vo.member_id}'==obj.member_id){
                  view+="<td id='u"+index+"'>";
                  view+="<button class='btn btn-info btn-sm' onclick='updateTW("+index+")'>수정</button>&nbsp;";
                  view+="</td>";
                  view+="<td>";
                  view+="<button class='btn btn-warning btn-sm' onclick ='delGo("+obj.diary_num+")'>삭제</button>";
                  view+="</td>";
               }else{
                  view+="<td id='u"+index+"'>";
                  view+="<button disabled class='btn btn-info btn-sm' onclick='updateTW("+index+")'>수정</button>&nbsp;";
                  view+="</td>";
                  view+="<td>";
                  view+="<button disabled class='btn btn-warning btn-sm' onclick ='delGo("+obj.diary_num+")'>삭제</button>";
                  view+="</td>";
               }
            }
            
            view += "</tr>";
            view += "<tr id ='ct"+index+"' style='display:none'>";
            view += "<td colspan = '5'>";
            view += "<table class='table'>";
            view += "<tr>";
            view += "<td>내용</td>";
            view += "<td><textarea rows='5' id='diary_content"+index+"' class='form-control'>"+obj.diary_content+"</textarea></td>";
            view += "</tr>";
            view += "<tr>";
            view += "<td>특이사항</td>";
            view += "<td><textarea rows='1' id='issue"+index+"' class='form-control'>"+obj.issue+"</textarea></td>";
            view += "</tr>";
            view += "<tr>";
            view+="<td colspan='5'>";
            if(${vo!=null}){
               if('${vo.member_id}'==obj.member_id){
                  view+="<button class='btn btn-info btn-sm' onclick = 'updateFn("+index+")'>수정</button>&nbsp;";
               }else{
                  view+="<button disabled class='btn btn-info btn-sm' onclick = 'updateFn("+index+")'>수정</button>&nbsp;";
               }
            }
            view+="<button class='btn btn-success btn-sm' onclick = 'closeFn("+index+")'>닫기</button>";
            view+="</td>"; 
            view += "</tr>";
            view += "</table>";
            view += "</td>";
        view += "</tr>";
        });
        
        if(${!empty vo}){
            view += "<tr>";
            view += "<td colspan='6'><button class='btn btn-primary btn-sm' onclick='goWrite()' >글쓰기</button></td>";
            view += "</tr>";
         }
        view += "</table>";
        $(".panel-body").html(view);
    }

    function updateTW(index){
        var diary_subject=$("#t"+index).text();
         var newdiary_subject="<input id='diary_subject"+index+"' type='text' class='form-control' value='"+diary_subject+"'>";
         $("#t"+index).html(newdiary_subject);  
         
         
         var newButton="<button class='btn btn-primary btn-sm' onclick='updateGo("+index+")'>수정하기</button>"
         $("#u"+index).html(newButton)
    }
    function delGo(diary_num){
       $.ajax({
          url : "diaryDeleteAjax.do",
          type : "get",
          data : {"diary_num":diary_num},
          success : loadList,
          error : function(){alert("error")}
          
       })
    }

    function updateGo(index){
        // diary_num, title, writer
        var diary_num=$("#diary_num"+index).text();
        var diary_subject=$("#diary_subject"+index).val();
        $.ajax({
           url : "diaryUpdateAjax.do",
           type : "post",
           data : {"diary_num" : diary_num, "diary_subject" : diary_subject},
           success : loadList,
           error : function(){ alert("errorupdate0"); }           
        });
     }
    
    function updateFn(index){
        var diary_num = $("#diary_num"+index).text();
        var diary_content=$("#diary_content"+index).val();
        var issue=$("#issue"+index).val();
        $.ajax({
        url : "diaryUpdateAjax1.do",
        type : "post",
        data : {"diary_num":diary_num, "diary_content" : diary_content, "issue" : issue },
        success : loadList,
        error : function() {alert("errorupdate1");}
        });
    }
    
    function closeFn(index){
    $("#ct"+index).css("display","none");
    }
    function ctFn(index){
        if($("#ct"+index).css("display")=="none"){
            $("#ct"+index).css("display","table-row")  
        }else{
        $("#ct"+index).css("display","none")         
        }
    }
    function goWrite(){
        if($(".writeForm").css("display")=="block"){
//            $(".writeForm").css("display","none");
            $(".writeForm").slideUp(800);
        }else{
         //   $(".writeForm").css("display","block");
            $(".writeForm").slideDown(800);
        }
    }
        function insertFn(){
           
           var diary_subject=$("#diary_subject").val();
           if(diary_subject==""){
            alert("제목을 입력하세요");
            $("#diary_subject").focus();
              return false;
           }
           
           var diary_content=$("#diary_content").val();
           if(diary_content==""){
            alert("내용을 입력하세요");
            $("#diary_content").focus();
              return false;
           }
           
            var frmData = $("#frm").serialize(); // serialize() title = xxx & contetns = xxx & writer = xxx
            //alert(frmData)
            $.ajax({
                url : "diaryInsertAjax.do",
                type : "post",
                data : frmData,
                success : loadList,
                error : function(c,e,a){ alert("error0"); console.log(c);console.log(a);}           
                });
                
                $("#reset").trigger("click")
                $(".writeForm").css("display","none");
            }
   function logout() {
      location.href="boardLogout.do"
   }
   

        
</script>
</head>
<body>
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
							<li class="scroll-to-section"><a href="#top" class="active">Home</a></li>
							<li><a href="deep.do">병충해 진단</a></li>
							<li class="scroll-to-section"><a href="#apply">알림</a></li>
							<li class="scroll-to-section"><a href="#apply">방역/방제</a></li>
							<li class="scroll-to-section"><a href="#courses">검색</a></li>
						</ul>
						<a class='menu-trigger'> <span>Menu</span>
						</a>
						<!-- ***** Menu End ***** -->
					</nav>
				</div>
			</div>
		</div>
	</header>
   <div class="container" id="coco" style = "margin-top : 22%;">
      <h2>영농일지</h2>
      <div class="panel panel-default">         
  
         <div class="panel-body"></div>
         <div class="writeForm" style="display: none;">
            <form id="frm" class="form-horizontal" >
            <input type="hidden" name="member_id" id="member_id" value="${vo.member_id}">
               <div class="form-group">
                  <label class="control-label col-sm-2" for="diary_subject">제목:</label>
                  <div class="col-sm-10">
                     <input type="text" class="form-control" id="diary_subject" name="diary_subject"
                        placeholder="제목을 적어주세요.">
                  </div>
               </div>
               <div class="form-group">
                  <label class="control-label col-sm-2" for="diary_content">내용:</label>
                  <div class="col-sm-10">
                     <textarea rows="10" class="form-control" id="diary_content"
                        name="diary_content" placeholder="작업 내용을 적어주세요."></textarea>
                  </div>
               </div>
               <div class="form-group">
                  <label class="control-label col-sm-2" for="writer">특이사항:</label>
                  <div class="col-sm-10">
                     <input type="text" class="form-control" id="issue" name="issue"
                        placeholder="작업 중 발생한 특이사항을 적어주세요.">
                  </div>
               </div>
               <div class="form-group">
                  <div class="col-sm-offset-2 col-sm-10">
                     <button type="button" class="btn btn-success btn-sm" onclick="insertFn()">등록</button>
                     <button type="reset" class="btn btn-info btn-sm" id = "reset">취소</button>
                  </div>
               </div>
            </form>

         </div>
      </div>
   </div>
   <!-- Footer-->
	<!-- 왜 있는지 모를 클래스 푸터 -->
	<!-- <footer class="py-5 bg-dark">
		<div class="container px-4 px-lg-5"> -->
			<div class="footer">
				<p class="m-0 text-center text-white">Copyright &copy; Your
					Website 2021</p>
			</div>		
		<!-- </div>
	</footer> -->

</body>
</html>