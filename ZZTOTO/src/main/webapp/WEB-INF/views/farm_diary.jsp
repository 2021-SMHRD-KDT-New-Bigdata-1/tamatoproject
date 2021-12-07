<%@page import="com.mycompany.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
Member vo = (Member) session.getAttribute("vo");
%>
<!DOCTYPE html>
<html>
<head>
<title>영농일지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fontawesome.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/news.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/templatemo-edu-meeting.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lightbox.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
	integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
	crossorigin="anonymous"></script>

<script type="text/javascript">
    $(document).ready(function() {
        loadList();
    });

    function loadList(){
        $.ajax({
       url : "Farm_diaryList.do",
       type : "get",
       dataType : "json",
        success : jsonHtml,
        error : function(c,e,a) {alert("error1");console.log(e)}
        });
    }
    function jsonHtml(data) {
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
        
        var myIndex = 1;
        $.each(data, function(index, obj) {
             if('${vo.member_id}'==obj.member_id){
               view += "<tr>";
               view += "<td id='diary_num"+index+"'style='display:none'>" + obj.diary_num; + "</td>";
               view += "<td>" + myIndex + "</td>"; 
               view += "<td id='t"+index+"'><a href = 'javascript:ctFn("+index+")'>"+ obj.diary_subject + "</td>";
                myIndex++;
            view += "<td id='w"+index+"'>"+ obj.reg_date + "</td>";}

            if(${vo!=null}){
               if('${vo.member_id}'==obj.member_id){
                  view+="<td id='u"+index+"'>";
                  view+="<button class='btn btn-info btn-sm' onclick='updateTW("+index+")'>수정</button>&nbsp;";
                  view+="</td>";
                  view+="<td>";
                  view+="<button class='btn btn-warning btn-sm' onclick ='delGo("+obj.diary_num+")'>삭제</button>";
                  view+="</td>";
               }else{
                  if('${vo.member_id}'==obj.member_id){
                  view+="<td id='u"+index+"'>";
                  view+="<button disabled class='btn btn-info btn-sm' onclick='updateTW("+index+")'>수정</button>&nbsp;";
                  view+="</td>";
                  view+="<td>";
                  view+="<button disabled class='btn btn-warning btn-sm' onclick ='delGo("+obj.diary_num+")'>삭제</button>";
                  view+="</td>";
                  }
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
            view += "<td colspan='5'><button class='btn btn-primary btn-sm' onclick='goWrite()' >글쓰기</button></td>";
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
            $(".writeForm").slideUp(800);
        }else{
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
           
            var frmData = $("#frm").serialize();
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
							<li><a href="notification.do">일정관리</a></li>
							<li><a href="drone.do">드론방역</a></li>
							<li><a href="farm_diary.do">영농일지</a></li>
							<!-- 로그인이 안되어있을때 -->
							<c:if test="${vo==null}">
								<li><a href="javascript:kakaoLogin();"><img
										src="${pageContext.request.contextPath}/resources/images/kaka oLogin.png"
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
	<main style="margin-top: 5%">
		<div class="container" id="coco">
			<h2>영농일지</h2>
			<div class="panel panel-default">
				<c:if test="${vo==null}">
					<div class="panel-heading">
						<form id="wform" class="form-inline" action="Farmlogin.do"
							method="post">

							<div class="form-group">
								<label for="member_id">아이디:</label> <input type="text"
									class="form-control" id="member_id" name="member_id">
							</div>

							<div class="form-group">
								<label for="userPwd">비밀번호:</label> <input type="password"
									class="form-control">
							</div>

							<button type="submit" class="btn btn-info btn-sm"
								onclick="formCheck()">로그인</button>
						</form>
					</div>
				</c:if>
				<div class="panel-body"></div>
				<div class="writeForm" style="display: none;">
					<form id="frm" class="form-horizontal">
						<input type="hidden" name="member_id" id="member_id"
							value="${vo.member_id}">
						<div class="form-group">
							<label class="control-label col-sm-2" for="diary_subject">제목:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="diary_subject"
									name="diary_subject" placeholder="제목을 적어주세요.">
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
								<button type="button" class="btn btn-success btn-sm"
									onclick="insertFn()">등록</button>
								<button type="reset" class="btn btn-info btn-sm" id="reset">취소</button>
							</div>
						</div>
					</form>

				</div>
			</div>
		</div>
	</main>
	<div class="footer">
		<p class="m-0 text-center text-white">Copyright 2022 Kkumchi All
			Rights Reserved.</p>
	</div>
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

      $('.main-menu, .responsive-menu').on('click', 'a', function (e) {
        e.preventDefault();
        showSection($(this).attr('href'), true);
      });

      $(window).scroll(function () {
        checkSection();
      });
    </script>
	<script>
	function logout() {
		location.href="logout.do";
	}
	</script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
        window.Kakao.init("e9d0bcae2dc6950a5ef78930a776afb9");

        function kakaoLogin() {
            window.Kakao.Auth.login({
                scope: 'profile_nickname, account_email',
                success: function(authObj) {
                	console.log(authObj
                    window.Kakao.API.request({ 
                        url: '/v2/user/me',
                        success: res => {
                            const kakao_account = res.kakao_account;
                            $.ajax({
                    			url : "login.do",
                    			type : "post",
                    			dataType: "json",
                    			data : {"member_id":kakao_account.email, "member_name":kakao_account.profile.nickname},
                    			success : function(){location.reload();},
                    			error : function(){ console.log("error") }
                    		});
                        }
                    });
                },
                fail: function(error) {
                    console.log(error);
                }
            });
        }
</script>
</body>
</html>