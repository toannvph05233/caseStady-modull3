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
<%--	  <style>--%>
<%--		  <jsp:include page="/templates/css/style.css" />--%>
<%--	  </style>--%>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
					<li><a href="travel.html">Travel</a></li>
					<li><a href="about.html">About</a></li>
					<li><a href="contact.html">Liên Hệ</a></li><br>
					<li><a href="contact.html">Thông tin cá nhân</a></li>
				</ul>
			</nav>

			<div class="colorlib-footer" style="position: relative;top: 550px;">
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
		aaa
		<div id="colorlib-main">
			<section class="ftco-section ftco-no-pt ftco-no-pb">
	    	<div class="container px-0">
	    		<div class="row d-flex no-gutters">
	    			<div class="col-lg-8 px-md-5 py-5">
	    				<div class="row">          
		              <div class="comment-form-wrap pt-5" style="position: relative;top: -60px;">
		                <h3 class="mb-5">Đăng Bài</h3>
<%--						  <span class="text-danger">${message}</span>--%>
		                <form method="post" class="p-3 p-md-4 bg-light shadow rounded">
		                  <div class="form-group">
		                    <label for="title">Tiêu đề</label>
		                    <input type="text" name="title" id="title" class="form-control">
						  </div>

						  <div class="form-row">
						  	<div class="form-group col-md-6">
						  		<label for="inputPrice">Giá</label>
							  	<input type="number" class="form-control" id="inputPrice" name="price" min="1" max="50000000">
						  </div>
						  <div class="form-group col-md-6">
						  	<label for="inputRegion">Vị trí </label>
							  	<select id="inputRegion" class="form-control" name="region">
        							<option selected value="Hà Nội">Hà Nội </option>
        							<option value="Hồ Chí Minh">Hồ Chí Minh<option>
        							<option value="Đà Nẵng">Đà Nẵng <option>
        							<option value="Ninh Bình">Ninh Bình <option>
      							</select>
							</div>
						  </div>
						  <div class="form-row">
								  <label for="taginput">Tag Cloud </label>
								  <div class="form-group col-md-6"><textarea id="taginput" name="taginput" class="form-control-plaintext" style="position: relative;top: -5px;left: 5px;"></textarea>
									<!-- <input type="text" id="taginput" class="form-control-plaintext" style="position: relative;top: -5px;left: 5px;"> -->
								</div>
							</div>
						  	<div class="sidebar-box ftco-animate">
	              <ul class="tagcloud">
	                <a href="#" class="tag-cloud-link" id="taglink1" name="bể bơi" onclick="clickTag(this.name)">bể bơi</a>
	                <a href="#" class="tag-cloud-link" id="taglink2" name="wifi" onclick="clickTag(this.name)">wifi</a>
	                <a href="#" class="tag-cloud-link" id="taglink3" name="bồn tắm" onclick="clickTag(this.name)">bồn tắm</a>
	                <a href="#" class="tag-cloud-link" id="taglink4" name="view biển" onclick="clickTag(this.name)">view biển</a>
	                <a href="#" class="tag-cloud-link" id="taglink5" name="HomeStay" onclick="clickTag(this.name)">HomeStay</a>
	                <a href="#" class="tag-cloud-link" id="taglink6" name="10 người" onclick="clickTag(this.name)">10 người</a>
	                <a href="#" class="tag-cloud-link" id="taglink7" name="xe đạp" onclick="clickTag(this.name)">xe đạp</a>
					<a href="#" class="tag-cloud-link" id="taglink8" name="phục vụ" onclick="clickTag(this.name)">phục vụ</a>
				  </ul>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
							<label for="addimg">Thêm ảnh</label>
							<input type="file" class="form-control-file" id="addimg" onchange="addImg(this.value)">
					</div>
				  </div>

							<div class="form-group">
								<label for="content">Giới thiệu</label>
								<textarea name="introduce" id="introduce" cols="30" rows="2" class="form-control rounded"></textarea>
							</div>
							<div class="form-group">
		                    <label for="content">Nội dung</label>
		                    <textarea name="content" id="content" cols="30" rows="10" class="form-control rounded"></textarea>
		                  </div>
		                  <div class="form-group">
		                    <input type="submit" value="Đăng bài" class="btn py-2 px-4 btn-primary" style="position:relative;left: 350px;">
		                  </div>
		                </form>
		              </div>
		            <!-- </div> -->
			    		</div>
			    	</div>
	    			<div class="col-lg-4 sidebar ftco-animate bg-light pt-5">
					<div style="position: relative;top: -30px;left:60px">
						<a href="/giohang"><span>Giỏ hàng </span><i class="fa fa-opencart"></i></a>
						<a style="position:relative;left: 20px;" href="/yeuthich"><span>Yêu thích </span><i class="fa fa-heart"></i></a>
				</div>
	            <div class="sidebar-box pt-md-4">
	              <form action="#" class="search-form">
	                <div class="form-group">
	                  <span class="icon icon-search"></span>
	                  <input type="text" class="form-control" placeholder="Tìm kiếm">
	                </div>
	              </form>
	            </div>
	            <div class="sidebar-box ftco-animate">
	            	<h3 class="sidebar-heading">Categories</h3>
	              <ul class="categories">
	                <li><a href="#">Hà Nội<span>(6)</span></a></li>
	                <li><a href="#">Hồ Chí Minh<span>(8)</span></a></li>
	                <li><a href="#">Huế <span>(2)</span></a></li>
	                <li><a href="#">Đà Nẵng <span>(2)</span></a></li>
	                <li><a href="#">Ninh Bình <span>(7)</span></a></li>
	              </ul>
	            </div>

	            <div class="sidebar-box ftco-animate">
	              <h3 class="sidebar-heading">Popular Articles</h3>
	              <div class="block-21 mb-4 d-flex">
	                <a class="blog-img mr-4" style="background-image: url(./templates/images/image_1.jpg);"></a>
	                <div class="text">
	                  <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control</a></h3>
	                  <div class="meta">
	                    <div><a href="#"><span class="icon-calendar"></span> Sept. 12, 2019	</a></div>
	                    <div><a href="#"><span class="icon-person"></span> Dave Lewis</a></div>
	                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
	                  </div>
	                </div>
	              </div>
	              <div class="block-21 mb-4 d-flex">
	                <a class="blog-img mr-4" style="background-image: url(./templates/images/image_2.jpg);"></a>
	                <div class="text">
	                  <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control</a></h3>
	                  <div class="meta">
	                    <div><a href="#"><span class="icon-calendar"></span> Sept. 12, 2019</a></div>
	                    <div><a href="#"><span class="icon-person"></span> Dave Lewis</a></div>
	                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
	                  </div>
	                </div>
	              </div>
	              <div class="block-21 mb-4 d-flex">
	                <a class="blog-img mr-4" style="background-image: url(./templates/images/image_3.jpg);"></a>
	                <div class="text">
	                  <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control</a></h3>
	                  <div class="meta">
	                    <div><a href="#"><span class="icon-calendar"></span> Sept. 12, 2019</a></div>
	                    <div><a href="#"><span class="icon-person"></span> Dave Lewis</a></div>
	                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
	                  </div>
	                </div>
	              </div>
	            </div>

	            <div class="sidebar-box ftco-animate">
	              <h3 class="sidebar-heading">Tag Cloud</h3>
	              <ul class="tagcloud">
	                <a href="#" class="tag-cloud-link">bể bơi</a>
	                <a href="#" class="tag-cloud-link">wifi</a>
	                <a href="#" class="tag-cloud-link">bồn tắm</a>
	                <a href="#" class="tag-cloud-link">view biển</a>
	                <a href="#" class="tag-cloud-link">HomeStay</a>
	                <a href="#" class="tag-cloud-link">10 người</a>
	                <a href="#" class="tag-cloud-link">xe đạp</a>
	                <a href="#" class="tag-cloud-link">phục vụ</a>
	              </ul>
	            </div>

	          </div><!-- END COL -->
	    		</div>
	    	</div>
	    </section>
		</div><!-- END COLORLIB-MAIN -->
	</div><!-- END COLORLIB-PAGE -->

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

  <script>
	  function clickTag(name){
document.getElementById("taginput").value+=name+", ";
	  }
	  function addImg(val){
		let str="<img src='"+"./templates/images/"+val.split(/(\\|\/)/g).pop()+"' alt='' class='img-fluid'>";
		  document.getElementById("content").value+=str;
	  }
  </script>
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