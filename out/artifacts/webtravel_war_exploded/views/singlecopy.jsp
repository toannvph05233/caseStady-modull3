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
    <link rel="stylesheet" href="./templates/css/rating.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        div.stars {
            width: 270px;
            display: inline-block;
        }

        input.star { display: none; }

        label.star {
            float: right;
            padding: 10px;
            font-size: 22px;
            color: #444;
            transition: all .2s;
        }

        input.star:checked ~ label.star:before {
            content: '\f005';
            color: #FD4;
            transition: all .25s;
        }

        input.star-5:checked ~ label.star:before {
            color: #FE7;
            text-shadow: 0 0 20px #952;
        }

        input.star-1:checked ~ label.star:before { color: #F62; }

        label.star:hover { transform: rotate(-15deg) scale(1.3); }

        label.star:before {
            content: '\f006';
            font-family: FontAwesome;
        }
    </style>
</head>
<body>

<div id="colorlib-page">
    <a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
    <aside id="colorlib-aside" role="complementary" class="js-fullheight img"
           style="background-image: url(./templates/images/sidebar-bg.jpg);">
        <h6 id="colorlib-logo" class="mb-2" style="font-size:40px;"><a href="index.html">Vivu.COM</a></h6>
        <nav id="colorlib-main-menu" role="navigation">
            <ul>
                <li class="colorlib-active"><a href="${pageContext.request.contextPath}">Trang chủ</a></li>
                <li><a href="#">Hà Nội</a></li>
                <li><a href="#">Hồ Chí Minh</a></li>
                <li><a href=#">Đà Nẵng</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Liên Hệ</a></li>
                <br>
                <li><a href="#">Thông tin cá nhân</a></li>
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
        <section class="ftco-section ftco-no-pt ftco-no-pb">
            <div class="container px-0">
                <div class="row d-flex no-gutters">
                    <div class="col-lg-8 px-md-5 py-5">
                        <div class="row">
                            <div style="position: relative;top: -20px;">
                                <h1 class="mb-3">${room.getTitle()}</h1>

                                <div class="row" style="position: relative;left: 15px;top: 30px;">
                                    <h5 class="mb-3">Giá từ: ${room.getRoomPrice()} vnđ</h5>
                                    <span>
								<input type="button" value="Yêu thích" class="btn btn-danger"
                                       style="position: relative;;left:120px;">
                                        <a href="giohang?id=${room.getRoomId()}">
								<input type="button" value="Đặt phòng" class="btn btn-danger"
                                       style="position: relative;left:140px;"></span>
                                    </a>
                                </div>
                            </div>
                            <div div class="row" style="position: relative;top:95px;left:-370px">
                                <!-- <h6>Xếp hạng</h6> -->
                                <div name="rating" id="rating">
                                    <input type="radio" id="star5" name="rating" value="5" ${checked5}/>
                                    <label class="full" for="star5" title="Awesome - 5 stars"></label>

                                    <input type="radio" id="star4" name="rating" value="4" ${checked4} checked/>
                                    <label class="full" for="star4" title="Pretty good - 4 stars"></label>

                                    <input type="radio" id="star3" name="rating" value="3" ${checked3} />
                                    <label class="full" for="star3" title="Meh - 3 stars"></label>

                                    <input type="radio" id="star2" name="rating" value="2" ${checked2} />
                                    <label class="full" for="star2" title="Kinda bad - 2 stars"></label>

                                    <input type="radio" id="star1" name="rating" value="1" ${checked1} />
                                    <label class="full" for="star1" title="Sucks big time - 1 star"></label>
                                </div>
                            </div>

                            <div id="content" style="position: relative;top: 20px;">
                                ${room.getRoomContent()}
                            </div>
                            <div class="tag-widget post-tag-container mb-5 mt-5">
                                <div class="tagcloud">

                                    <c:forTokens items="${room.getTag()}" delims="," var="name">
                                        <a href="#" class="tag-cloud-link">${name}</a>
                                    </c:forTokens>

                                    <!-- <a href="#" class="tag-cloud-link">${room.getTag()}</a> -->
                                </div>
                            </div>

                            <div class="about-author d-flex p-4 bg-light">
                                <div class="bio mr-5">
                                    <img src="./templates/images/person_1.jpg" alt="Image placeholder"
                                         class="img-fluid mb-4">
                                </div>
                                <div class="desc">
                                    <h3>${room.getUserName()}</h3>
                                </div>
                            </div>


                            <div class="pt-5 mt-5">
                                <h3 class="mb-5 font-weight-bold">Nhận xét</h3>
                                <ul class="comment-list">
                                    <li class="comment">
                                        <div class="vcard bio">
                                            <img src="./templates/images/person_1.jpg" alt="Image placeholder">
                                        </div>
                                        <div class="comment-body">
                                            <h3>${room.getUserName()}</h3>
                                            <div class="meta">October 03, 2018 at 2:21pm</div>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem
                                                laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat
                                                saepe enim sapiente iste iure! Quam voluptas earum impedit
                                                necessitatibus, nihil?</p>
                                            <c:if test="${room.getUserName().equals(userName)}" >
                                            <p><a href="#" class="reply">Xóa</a></p>
                                            </c:if>
                                        </div>
                                    </li>

                                </ul>
                                <!-- END comment-list -->

                                <div class="comment-form-wrap pt-5">
                                    <h3 class="mb-5">Đăng nhận xét</h3>
                                    <form method="post" class="p-3 p-md-4 bg-light">
                                        <div class="form-group">
                                            <label for="rate">Đánh giá</label>
                                            <div class="star" id="rate" style="position: absolute;left: 120px;bottom: 457px;">
                                                    <input class="star star-5" id="star-5" type="radio" name="star"/>
                                                    <label class="star star-5" for="star-5"></label>
                                                    <input class="star star-4" id="star-4" type="radio" name="star"/>
                                                    <label class="star star-4" for="star-4"></label>
                                                    <input class="star star-3" id="star-3" type="radio" name="star"/>
                                                    <label class="star star-3" for="star-3"></label>
                                                    <input class="star star-2" id="star-2" type="radio" name="star"/>
                                                    <label class="star star-2" for="star-2"></label>
                                                    <input class="star star-1" id="star-1" type="radio" name="star"/>
                                                    <label class="star star-1" for="star-1"></label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="message">Nhận xét</label>
                                            <textarea name="" id="message" cols="30" rows="10"
                                                      class="form-control"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <input type="submit" value="Post Comment" class="btn py-3 px-4 btn-primary">
                                        </div>

                                    </form>
                                </div>
                            </div>
                        </div><!-- END-->
                    </div>
                    <div class="col-lg-4 sidebar ftco-animate bg-light pt-5">
                        <div style="position: relative;top: -30px;left:60px">
                            <a href="/giohang"><span>Giỏ hàng </span><i class="fa fa-opencart"></i></a>
                            <a style="position:relative;left: 20px;" href="/yeuthich"><span>Yêu thích </span><i
                                    class="fa fa-heart"></i></a>
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
                            <h3 class="sidebar-heading">Khu vực</h3>
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
                                <a class="blog-img mr-4"
                                   style="background-image: url(./templates/images/image_1.jpg);"></a>
                                <div class="text">
                                    <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control</a>
                                    </h3>
                                    <div class="meta">
                                        <div><a href="#"><span class="icon-calendar"></span> Sept. 12, 2019 </a></div>
                                        <div><a href="#"><span class="icon-person"></span> Dave Lewis</a></div>
                                        <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                                    </div>
                                </div>
                            </div>
                            <div class="block-21 mb-4 d-flex">
                                <a class="blog-img mr-4"
                                   style="background-image: url(./templates/images/image_2.jpg);"></a>
                                <div class="text">
                                    <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control</a>
                                    </h3>
                                    <div class="meta">
                                        <div><a href="#"><span class="icon-calendar"></span> Sept. 12, 2019</a></div>
                                        <div><a href="#"><span class="icon-person"></span> Dave Lewis</a></div>
                                        <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                                    </div>
                                </div>
                            </div>
                            <div class="block-21 mb-4 d-flex">
                                <a class="blog-img mr-4"
                                   style="background-image: url(./templates/images/image_3.jpg);"></a>
                                <div class="text">
                                    <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control</a>
                                    </h3>
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

                        <div class="sidebar-box subs-wrap img px-4 py-5"
                             style="background-image: url(./templates/images/bg_1.jpg);">
                            <div class="overlay"></div>
                            <h3 class="mb-4 sidebar-heading">Newsletter</h3>
                            <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia</p>
                            <form action="#" class="subscribe-form">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Email Address">
                                    <input type="submit" value="Subscribe" class="mt-2 btn btn-white submit">
                                </div>
                            </form>
                        </div>

                        <div class="sidebar-box ftco-animate">
                            <h3 class="sidebar-heading">Archives</h3>
                            <ul class="categories">
                                <li><a href="#">December 2018 <span>(10)</span></a></li>
                                <li><a href="#">September 2018 <span>(6)</span></a></li>
                                <li><a href="#">August 2018 <span>(8)</span></a></li>
                                <li><a href="#">July 2018 <span>(2)</span></a></li>
                                <li><a href="#">June 2018 <span>(7)</span></a></li>
                                <li><a href="#">May 2018 <span>(5)</span></a></li>
                            </ul>
                        </div>


                        <div class="sidebar-box ftco-animate">
                            <h3 class="sidebar-heading">Paragraph</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus itaque, autem
                                necessitatibus voluptate quod mollitia delectus aut.</p>
                        </div>
                    </div><!-- END COL -->
                </div>
            </div>
        </section>
    </div><!-- END COLORLIB-MAIN -->
</div><!-- END COLORLIB-PAGE -->

<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
    <svg class="circular" width="48px" height="48px">
        <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
        <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                stroke="#F96D00"/>
    </svg>
</div>


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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="./templates/js/google-map.js"></script>
<script src="./templates/js/main.js"></script>

</body>
</html>