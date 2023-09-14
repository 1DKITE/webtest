<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi_bbs.jsp" %>
<jsp:useBean id="dao" class="com.bbs.BbsDAO" />
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	String nowPage = request.getParameter("nowPage");
	String col = request.getParameter("col");
	String word = request.getParameter("word");
	
	dao.upViewcnt(bbsno);//조회수 증가
    BbsDTO dto = dao.read(bbsno); //한건 데이터 조회
    
    String content = dto.getContent().replaceAll("\r\n", "<br>");
%>
<!DOCTYPE html>
<script>
function list(){
	let url = "list.jsp";
	url += "?nowPage=<%=nowPage%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	
	location.href= url;
}

function reply(){
	let url = "replyForm.jsp";
	url += "?nowPage=<%=nowPage%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&bbsno=<%=bbsno%>";
	
	location.href= url;
}

function update(){
	let url = "updateForm.jsp";
	url += "?nowPage=<%=nowPage%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&bbsno=<%=bbsno%>";
	
	location.href= url;
}

function del(){
	let url = "deleteForm.jsp";
	url += "?nowPage=<%=nowPage%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&bbsno=<%=bbsno%>";
	
	location.href= url;
}
</script>
<html lang="en">

  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>Board</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />

    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon" />
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

    <!-- Google Fonts -->
    <link
      href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
      rel="stylesheet"
    />

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/aos/aos.css" rel="stylesheet" />
    <link
      href="assets/vendor/bootstrap/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
      rel="stylesheet"
    />
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
    <link
      href="assets/vendor/glightbox/css/glightbox.min.css"
      rel="stylesheet"
    />
    <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet" />

    <!-- =======================================================
  * Template Name: Gp
  * Updated: Jul 27 2023 with Bootstrap v5.3.1
  * Template URL: https://bootstrapmade.com/gp-free-multipurpose-html-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  </head>

  <body>
    <!-- ======= Header ======= -->
    <header id="header" class="fixed-top header-inner-pages">
      <div
        class="container d-flex align-items-center justify-content-lg-between"
      >
        <h1 class="logo me-auto me-lg-0">
          <a href="index.html">DY<span>.</span></a>
        </h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html" class="logo me-auto me-lg-0"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

        <nav id="navbar" class="navbar order-last order-lg-0">
          <ul>
            <li>
              <a class="nav-link scrollto active" href="index.html">Home</a>
            </li>
            <li><a class="nav-link scrollto" href="vote.html">Vote</a></li>
            <li><a class="nav-link scrollto" href="board.html">board</a></li>
            <li><a class="nav-link scrollto" href="notice.html">Notice</a></li>
            <li>
              <a class="nav-link scrollto" href="game.html">WebGame</a>
            </li>
          </ul>
          <i class="bi bi-list mobile-nav-toggle"></i>
        </nav>
        <!-- .navbar -->
      </div>
    </header>
    <!-- End Header -->

    <main id="main">
      <!-- ======= Breadcrumbs ======= -->
      <section class="breadcrumbs">
        <div class="container">
          <div class="d-flex justify-content-between align-items-center">
            <h2>게시판</h2>
            <ol>
              <li><a href="index.html">Home</a></li>
              <li>Inner Page</li>
            </ol>
          </div>
        </div>
      </section>
      <!-- End Breadcrumbs -->

      <section class="inner-page">
       <body>

<div class="container mt-3 mb-3">
  <h3>조회</h3>
  <ul class="list-group">
    <li class="list-group-item">작성자 : <%=dto.getWname() %></li>
    <li class="list-group-item">제목 : <%=dto.getTitle() %></li>
    <li class="list-group-item" style="height:250px;overflow-y:scroll"><%=content %></li>
    <li class="list-group-item">조회수 : <%=dto.getViewcnt() %></li>
    <li class="list-group-item">등록일 : <%=dto.getWdate() %></li>
  </ul>
  <br>
  <button class="btn btn-outline-dark" onclick="location='createForm.jsp'">등록</button>
  <button class="btn btn-outline-dark" onclick="del()">삭제</button>
  <button class="btn btn-outline-dark" onclick="update()">수정</button>
  <button class="btn btn-outline-dark" onclick="reply()">답변</button>
  <button class="btn btn-outline-dark" onclick="list()">목록</button>
</div>

</body>
      </section>
    </main>
    <!-- End #main -->

    <!-- ======= Footer ======= -->
    <footer id="footer">
      <div class="footer-top">
        <div class="container">
          <div class="row">
            <div class="col-lg-3 col-md-6">
              <div class="footer-info">
                <h3>DY<span>.</span></h3>
                <p>
                  군산대학교 <br />
                  ....<br /><br />
                  <strong>Phone:</strong> +82 XXXX XXXX<br />
                  <strong>Email:</strong> hong@kunsan.ac.kr<br />
                </p>
                <div class="social-links mt-3">
                  <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                  <a href="#" class="facebook"
                    ><i class="bx bxl-facebook"></i
                  ></a>
                  <a href="#" class="instagram"
                    ><i class="bx bxl-instagram"></i
                  ></a>
                  <a href="#" class="google-plus"
                    ><i class="bx bxl-skype"></i
                  ></a>
                  <a href="#" class="linkedin"
                    ><i class="bx bxl-linkedin"></i
                  ></a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="container">
        <div class="copyright">
          &copy; Copyright <strong><span>DY</span></strong
          >. All Rights Reserved
        </div>
        <div class="credits">
          <!-- All the links in the footer should remain intact. -->
          <!-- You can delete the links only if you purchased the pro version. -->
          <!-- Licensing information: https://bootstrapmade.com/license/ -->
          <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/gp-free-multipurpose-html-bootstrap-template/ -->
          Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
        </div>
      </div>
    </footer>
    <!-- End Footer -->

    <div id="preloader"></div>
    <a
      href="#"
      class="back-to-top d-flex align-items-center justify-content-center"
      ><i class="bi bi-arrow-up-short"></i
    ></a>

    <!-- Vendor JS Files -->
    <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
    <script src="assets/vendor/aos/aos.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="assets/vendor/php-email-form/validate.js"></script>

    <!-- Template Main JS File -->
    <script src="assets/js/main.js"></script>
  </body>
</html>
