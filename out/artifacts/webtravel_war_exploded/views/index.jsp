<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
  <head>
    <title>ionize - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Abril+Fatface&display=swap" rel="stylesheet">

	  <link rel="stylesheet" href="./templates/css/open-iconic-bootstrap.min.css">
	  <link rel="stylesheet" href="./templates/css/animate.css">

	  <link rel="stylesheet" href="./templates/css/owl.carousel.min.css">
	  <link rel="stylesheet" href="./templates/css/owl.theme.default.min.css">
	  <link rel="stylesheet" href="./templates/css/magnific-popup.css">

	  <link rel="stylesheet" href="./templates/css/aos.css">

	  <link rel="stylesheet" href="./templates/css/ionicons.min.css">

	  <link rel="stylesheet" href="./templates/css/bootstrap-datepicker.css">
	  <link rel="stylesheet" href="./templates/css/jquery.timepicker.css">


	  <link rel="stylesheet" href="./templates/css/flaticon.css">
	  <link rel="stylesheet" href="./templates/css/icomoon.css">
	  <link rel="stylesheet" href="./templates/css/style.css">
  </head>
  <body>

	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<aside id="colorlib-aside" role="complementary" class="js-fullheight img" style="background-image: url(./templates/images/sidebar-bg.jpg);">
			<h6 id="colorlib-logo" class="mb-2" style="font-size:40px;"><a href="index.html">Vivu.COM</a></h6>
			<nav id="colorlib-main-menu" role="navigation">
				<ul>
					<li class="colorlib-active"><a href="${pageContext.request.contextPath}">Trang chủ</a></li>
					<li><a href="lifestyle.html">Hà Nội</a></li>
					<li><a href="lifestyle.html">Hồ Chí Minh</a></li>
					<li><a href="lifestyle.html">Đà Nẵng</a></li>
					<li><a href="about.html">About</a></li>
					<li><a href="contact.html">Liên Hệ</a></li><br>
					<li><a href="contact.html">Thông tin cá nhân</a></li>
				</ul>
			</nav>

			<div class="colorlib-footer" style="position: apsolute;top: 550px;">
				<div class="mb-4">
					<form action="#" class="colorlib-subscribe-form">
            <div class="form-group d-flex">
            	<div class="icon"><span class="icon-search"></span></div>
              <input type="text" class="form-control" placeholder="Nhập địa điểm">
            </div>
          </form>
				</div>
				
			</div>
		</aside> <!-- END COLORLIB-ASIDE -->
		<div id="colorlib-main">
			<section class="ftco-section ftco-no-pt ftco-no-pb bg-light">
	    	<div class="container px-0">
	    		<div class="row no-gutters">
					<c:forEach items="${rooms}" var="room" varStatus="loop">
					<c:if test="${loop.index == 0}">
	    			<div class="col-md-4 d-flex">
							<div class="blog-entry ftco-animate active">
								<div class="carousel-blog owl-carousel">
		              <div class="item">
		              	<a href="${pageContext.request.contextPath}/post?roomid=${room.getRoomId()}" class="img" style="background-image: url(./templates/images/${room.getRoomId()}-1.jpg);"></a>
		              </div>
		              <div class="item">
		              	<a href="${pageContext.request.contextPath}/post?roomid=${room.getRoomId()}" class="img" style="background-image: url(./templates/images/${room.getRoomId()}-2.jpg);"></a>
		              </div>
		            </div>
					<div class="text p-4">
		              <h3 class="mb-2"><a href="${pageContext.request.contextPath}/post?roomid=${room.getRoomId()}">${room.getTitle()}</a></h3>
		              <div class="meta-wrap">
										<p class="meta">
		              		<span><i class="icon-calendar mr-2"></i>${room.getCreateDate()}</span>
		              		<span><a href="${pageContext.request.contextPath}/post?roomid=${room.getRoomId()}"><i class="icon-folder-o mr-2"></i>${room.getArea()}</a></span>
		              	</p>
	              	</div>
		              <p class="mb-4">${room.getRoomIntroduce()}</p>
		              <p><a href="${pageContext.request.contextPath}/post?id=${room.getRoomId()}" class="btn-custom">Xem thêm <span class="ion-ios-arrow-forward"></span></a></p>
		            </div>
							</div>
						</div>
					</c:if>
					<c:if test="${loop.index % 5 == 1}"><div class="col-md-8 d-flex">
						<div class="row">
							<div class="col-md-12">
								<div class="blog-entry ftco-animate d-md-flex align-items-center">
									<a href="${pageContext.request.contextPath}/post?roomid=${room.getRoomId()}" class="img img-2" style="background-image: url(./templates/images/${room.getRoomId()}-1.jpg);"></a>
									<div class="text text-2 p-4">
										<h3 class="mb-2"><a href="${pageContext.request.contextPath}/post?roomid=${room.getRoomId()}">${room.getTitle()}</a></h3>
										<div class="meta-wrap">
											<p class="meta">
												<span><i class="icon-calendar mr-2"></i>${room.getCreateDate()}</span>
												<span><a href="${pageContext.request.contextPath}/post?roomid=${room.getRoomId()}"><i class="icon-folder-o mr-2"></i>${room.getArea()}</a></span>
											</p>
										</div>
										<p class="mb-4">${room.getRoomIntroduce()}</p>
										<p><a href="${pageContext.request.contextPath}/post?roomid=${room.getRoomId()}" class="btn-custom">Xem thêm <span class="ion-ios-arrow-forward"></span></a></p>
									</div>
								</div>
							</div></c:if>
					<c:if test="${loop.index % 5 == 2}"><div class="col-md-12">
						<div class="blog-entry ftco-animate d-md-flex align-items-center">
							<a href="${pageContext.request.contextPath}/post?roomid=${room.getRoomId()}" class="img img-2 order-md-last" style="background-image: url(./templates/images/${room.getRoomId()}-1.jpg);"></a>
							<div class="text text-2 p-4 text-md-right">
								<h3 class="mb-2"><a href="${pageContext.request.contextPath}/post?roomid=${room.getRoomId()}">${room.getTitle()}</a></h3>
								<div class="meta-wrap">
									<p class="meta">
										<span><i class="icon-calendar mr-2"></i>${room.getCreateDate()}</span>
										<span><a href="${pageContext.request.contextPath}/post?roomid=${room.getRoomId()}"><i class="icon-folder-o mr-2"></i>${room.getArea()}</a></span>
									</p>
								</div>
								<p class="mb-4">${room.getRoomIntroduce()}</p>
								<p><a href="${pageContext.request.contextPath}/post?roomid=${room.getRoomId()}" class="btn-custom">Xem thêm <span class="ion-ios-arrow-forward"></span></a></p>
							</div>
						</div>
					</div>
						</div>
						</div></c:if>
					<c:if test="${loop.index % 5 == 3 || loop.index % 5 == 4}"><div class="col-md-4 d-flex">
						<div class="blog-entry ftco-animate">
							<a href="${pageContext.request.contextPath}/post?roomid=${room.getRoomId()}" class="img" style="background-image: url(./templates/images/${room.getRoomId()}-1.jpg);"></a>
							<div class="text p-4">
								<h3 class="mb-2"><a href="${pageContext.request.contextPath}/post?roomid=${room.getRoomId()}">${room.getTitle()}</a></h3>
								<div class="meta-wrap">
									<p class="meta">
										<span><i class="icon-calendar mr-2"></i>${room.getCreateDate()}</span>
										<span><a href="${pageContext.request.contextPath}/post?roomid=${room.getRoomId()}"><i class="icon-folder-o mr-2"></i>${room.getArea()}</a></span>
									</p>
								</div>
								<p class="mb-4">${room.getRoomIntroduce()}</p>
								<p><a href="${pageContext.request.contextPath}/post?roomid=${room.getRoomId()}" class="btn-custom">Xem thêm <span class="ion-ios-arrow-forward"></span></a></p>
							</div>
						</div>
					</div></c:if>
					<c:if test="${loop.index % 5 == 0 && loop.index != 0}"><div class="col-md-4 d-flex">
						<div class="blog-entry ftco-animate">
							<a href="${pageContext.request.contextPath}/post?roomid=${room.getRoomId()}" class="img" style="background-image: url(./templates/images/${room.getRoomId()}-1.jpg);"></a>
							<div class="text p-4">
								<h3 class="mb-2"><a href="${pageContext.request.contextPath}/post?roomid=${room.getRoomId()}">${room.getTitle()}</a></h3>
								<div class="meta-wrap">
									<p class="meta">
										<span><i class="icon-calendar mr-2"></i>${room.getCreateDate()}</span>
										<span><a href="${pageContext.request.contextPath}/post?roomid=${room.getRoomId()}"><i class="icon-folder-o mr-2"></i>${room.getArea()}</a></span>
										<span><i class="icon-comment2 mr-2"></i>5 Comment</span>
									</p>
								</div>
								<p class="mb-4">${room.getRoomIntroduce()}</p>
								<p><a href="${pageContext.request.contextPath}/post?roomid=${room.getRoomId()}" class="btn-custom">Xem thêm <span class="ion-ios-arrow-forward"></span></a></p>
							</div>
						</div>
					</div></c:if>
					</c:forEach>
	    		</div>
	    	</div>
	    </section>
		</div><!-- END COLORLIB-MAIN -->
	</div><!-- END COLORLIB-PAGE -->

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


	<script src="./templates/js/jquery.min.js"></script>
	<script src="./templates/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="./templates/js/popper.min.js"></script>
	<script src="./templates/js/bootstrap.min.js"></script>
	<script src="./templates/js/jquery.easing.1.3.js"></script>
	<script src="./templates/js/jquery.waypoints.min.js"></script>
	<script src="./templates/js/jquery.stellar.min.js"></script>
	<script src="./templates/js/owl.carousel.min.js"></script>
	<script src="./templates/js/jquery.magnific-popup.min.js"></script>
	<script src="./templates/js/aos.js"></script>
	<script src="./templates/js/jquery.animateNumber.min.js"></script>
	<script src="./templates/js/scrollax.min.js"></script>
	<script src="./templates/js/google-map.js"></script>
	<script src="./templates/js/main.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
    
  </body>
</html>