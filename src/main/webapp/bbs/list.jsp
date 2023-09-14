<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi_bbs.jsp" %> 
<jsp:useBean id="dao" class="com.bbs.BbsDAO" />

<%
//검색부분
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	
	if(col.equals("total")) word = "";
	
	
	//페이지 처리 
	int nowPage = 1; //현제 페이지 
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	int recordPerPage = 10; //한페이지당 보여줄 레코드 갯수 -> 디비에서 가져올 갯수
	
	int sno = (nowPage-1) * recordPerPage;  //디비에서 가져올 시작 레코드 순번
	
	Map map = new HashMap();
	map.put("col",col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", recordPerPage);

	List<BbsDTO> list = dao.list(map);
	
	int total = dao.total(col, word);
	
	String url = "list.jsp";
	
	String paging = Utility.paging(total, nowPage, recordPerPage, col, word, url);
%>  

<!DOCTYPE html>
<html lang="en">
	<script>
function read(bbsno){
	let url = "read.jsp";
	url += "?bbsno="+bbsno;
	url += "&nowPage=<%=nowPage%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	
	location.href=url;
}
</script>
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
              <li><a href="../index.jsp">Home</a></li>
              <li>Inner Page</li>
            </ol>
          </div>
        </div>
      </section>
      <!-- End Breadcrumbs -->

      <section class="inner-page">
        <div class='container mt-3'>
 <h2>게시판 목록</h2>
 <form action="list.jsp">
 <div class="row mb-3 mt-3"> 
   <div class="col">  
     <select class="form-select"  name="col">
      <option value="wname" 
      <% if(col.equals("wname")) out.print("selected");%>
      >성명</option>
      <option value="title" 
      <% if(col.equals("title")) out.print("selected");%>
      >제목</option>
      <option value="content"
      <% if(col.equals("content")) out.print("selected");%>
      >내용</option>
      <option value="title_content" 
      <% if(col.equals("title_content")) out.print("selected");%>
      >제목+내용</option>
      <option value="total"
      <% if(col.equals("total")) out.print("selected");%>
      >전체출력</option>
    </select>
   </div>
   <div class="col">
       <input type="search" class="form-control" name="word" required="required" value="<%=word%>">
   </div>
   <div class="col">
    <button type="submit" class="btn btn-primary">검색</button>
    <button type="button" class="btn btn-primary" onclick="location.href='createForm.jsp'">등록</button>
   </div>
  </div>
  </form>        
  <table class="table table-striped">
    <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>조회수</th>
        <th>등록날짜 </th>
        <th>grpno</th>
        <th>indent</th>
        <th>ansnum </th>
      </tr>
    </thead>
    <tbody>
    
<% if(list.size() == 0) { %>
      <tr><td colspan = '8'>등록된 글이 없습니다.</td></tr>   
<% }else{
	
   for(int i=0; i<list.size(); i++){
	  BbsDTO dto = list.get(i); 
%>  
      <tr>
        <td><%=dto.getBbsno() %></td>
        <td>
        <%
        	for(int r=0; r<dto.getIndent();r++){ 
        		out.print("&nbsp;&nbsp;");
        	}
            if(dto.getIndent()>0){
            	out.print("<img src='../images/re.jpg'>");
            }
        %>
        <a href="javascript:read('<%=dto.getBbsno() %>')"><%=dto.getTitle() %></a>
        <% if(Utility.compareDay(dto.getWdate())) {    	
        	out.print("<img src='../images/new.gif'>");
           } 
        %>
        </td>
        <td><%=dto.getWname() %></td>
        <td><%=dto.getViewcnt() %></td>
        <td><%=dto.getWdate() %></td>
       <td><%=dto.getGrpno() %></td>	
        <td><%=dto.getIndent() %></td>
        <td><%=dto.getAnsnum() %></td>
      </tr>
<%   }  //for end 
	} //if end
%>
   </tbody>  
  </table>
   <%=paging %>
</div>
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
