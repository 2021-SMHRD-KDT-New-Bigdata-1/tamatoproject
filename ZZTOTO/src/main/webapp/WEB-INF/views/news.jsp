<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="TemplateMo">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">

<title>KingTomato</title>

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">


<!-- Additional CSS Files -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fontawesome.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/templatemo-edu-meeting.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/lightbox.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/news.css">
</head>

<body>
	<!-- ***** Header Area Start ***** -->
	<header class="header-area header-sticky">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav class="main-nav">
						<!-- ***** Logo Start ***** -->
						<a href="index.html" class="logo"> 피톤치드 </a>
						<!-- ***** Logo End ***** -->
						<!-- ***** Menu Start ***** -->
						<ul class="nav">
							<li class="scroll-to-section"><a href="#top" class="active">Home</a></li>
							<li><a href="deep.do">병충해 진단</a></li>
							<li class="scroll-to-section"><a href="notification.do">알림</a></li>
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
	<!-- ***** Header Area End ***** -->

	<!-- Page Content-->
	<div class="container px-4 px-lg-5">
		<!-- Content Row-->
		<div class="row gx-4 gx-lg-5">
			<div class="col-md-6 mb-5">
				<h2>농업 정책</h2>
				<div class="card h-100">
					<div class="card-body">
						<p class="card-text">
							<a
								href="https://easylaw.go.kr/CSP/CnpClsMain.laf?popMenu=ov&csmSeq=1328&ccfNo=3&cciNo=1&cnpClsNo=1&search_put=">귀농인
								조세지원</a>
						</p>
						<p class="card-text">
							<a
								href="https://easylaw.go.kr/CSP/CnpClsMain.laf?popMenu=ov&csmSeq=1328&ccfNo=3&cciNo=2&cnpClsNo=1&search_put=">농업창업자금
								지원</a>
						</p>
						<p class="card-text">
							<a
								href="https://easylaw.go.kr/CSP/CnpClsMain.laf?popMenu=ov&csmSeq=1328&ccfNo=3&cciNo=2&cnpClsNo=2&search_put=">농업기계
								자금지원</a>
						</p>
						<p class="card-text">
							<a
								href="https://easylaw.go.kr/CSP/CnpClsMain.laf?popMenu=ov&csmSeq=1328&ccfNo=3&cciNo=3&cnpClsNo=1&search_put=">주택구입
								지원 및 임대</a>
						</p>
						<p class="card-text">
							<a
								href="https://easylaw.go.kr/CSP/CnpClsMain.laf?popMenu=ov&csmSeq=1328&ccfNo=3&cciNo=3&cnpClsNo=2&search_put=">주택신축
								지원</a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-6 mb-5">
				<h2>농업 뉴스</h2>
				<div class="card h-100">
					<div class="card-body">
						<div id="carouselExampleDark" class="carousel carousel-dark slide"
							data-bs-ride="carousel">
							<div class="carousel-indicators">
								<button type="button" data-bs-target="#carouselExampleDark"
									data-bs-slide-to="0" class="active" aria-current="true"
									aria-label="Slide 1"></button>
								<button type="button" data-bs-target="#carouselExampleDark"
									data-bs-slide-to="1" aria-label="Slide 2"></button>
								<button type="button" data-bs-target="#carouselExampleDark"
									data-bs-slide-to="2" aria-label="Slide 3"></button>
							</div>
							<div class="carousel-inner">
								<div class="carousel-item active" data-bs-interval="10000">
									<a href="https://www.fnnews.com/news/202111291118546612"><img
										src="resources/img/news1.png" class="d-block w-100" alt="..."></a>
									<div class="carousel-caption d-none d-md-block">
										<h5>First slide label</h5>
										<p>Some representative placeholder content for the first
											slide.</p>
									</div>
								</div>
								<div class="carousel-item" data-bs-interval="2000">
									<a href="https://www.fnnews.com/news/202111291118546612"><img
										src="resources/img/news1.png" class="d-block w-100" alt="..."></a>
									<div class="carousel-caption d-none d-md-block">
										<h5>Second slide label</h5>
										<p>Some representative placeholder content for the second
											slide.</p>
									</div>
								</div>
								<div class="carousel-item">
									<a href="https://www.fnnews.com/news/202111291118546612"><img
										src="resources/img/news1.png" class="d-block w-100" alt="..."></a>
									<div class="carousel-caption d-none d-md-block">
										<h5>Third slide label</h5>
										<p>Some representative placeholder content for the third
											slide.</p>
									</div>
								</div>
							</div>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#carouselExampleDark" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#carouselExampleDark" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6 mb-5">
				<h2 class="card-title">농업 관련 도서</h2>
				<div class="card h-100">
					<div class="card-body">
						<div id="carouselExampleDark" class="carousel carousel-dark slide"
							data-bs-ride="carousel">
							<div class="carousel-indicators">
								<button type="button" data-bs-target="#carouselExampleDark"
									data-bs-slide-to="0" class="active" aria-current="true"
									aria-label="Slide 1"></button>
								<button type="button" data-bs-target="#carouselExampleDark"
									data-bs-slide-to="1" aria-label="Slide 2"></button>
								<button type="button" data-bs-target="#carouselExampleDark"
									data-bs-slide-to="2" aria-label="Slide 3"></button>
								<button type="button" data-bs-target="#carouselExampleDark"
									data-bs-slide-to="3" aria-label="Slide 4"></button>
								<button type="button" data-bs-target="#carouselExampleDark"
									data-bs-slide-to="4" aria-label="Slide 5"></button>
							</div>
							<div class="carousel-inner">
								<div class="carousel-item active" data-bs-interval="10000">
									<a
										href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&linkClass=261703&barcode=9788975279577#N"><img
										src="resources/img/1.jpg" class="d-block w-100" alt="..."></a>
									<div class="carousel-caption d-none d-md-block">
										<h5>First slide label</h5>
										<p>Some representative placeholder content for the first
											slide.</p>
									</div>
								</div>
								<div class="carousel-item" data-bs-interval="2000">
									<a
										href="http://book.interpark.com/product/BookDisplay.do?_method=detail&sc.saNo=001&sc.prdNo=314865371&product2020=true"><img
										src="resources/img/2.jpg" class="d-block w-100" alt="..."></a>
									<div class="carousel-caption d-none d-md-block">
										<h5>Second slide label</h5>
										<p>Some representative placeholder content for the second
											slide.</p>
									</div>
								</div>
								<div class="carousel-item">
									<a
										href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&linkClass=261703&barcode=9788959728107 "><img
										src="resources/img/3.jpg" class="d-block w-100" alt="..."></a>
									<div class="carousel-caption d-none d-md-block">
										<h5>Third slide label</h5>
										<p>Some representative placeholder content for the third
											slide.</p>
									</div>
								</div>
								<div class="carousel-item">
									<a
										href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791156109419&orderClick=JAj "><img
										src="resources/img/4.jpg" class="d-block w-100" alt="..."></a>
									<div class="carousel-caption d-none d-md-block">
										<h5>Third slide label</h5>
										<p>Some representative placeholder content for the third
											slide.</p>
									</div>
								</div>
								<div class="carousel-item">
									<a
										href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791187568209&orderClick=JAj "><img
										src="resources/img/5.jpg" class="d-block w-100" alt="..."></a>
									<div class="carousel-caption d-none d-md-block">
										<h5>Third slide label</h5>
										<p>Some representative placeholder content for the third
											slide.</p>
									</div>
								</div>
							</div>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#carouselExampleDark" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#carouselExampleDark" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container px-4 px-lg-51">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2021</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>

</html>