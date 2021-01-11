<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<%String category = request.getParameter("category"); 
	  String mean = request.getParameter("mean");
	%>
	
  <script src="./js/jquery-latest.js"></script>
  <script src="https://d3js.org/d3.v3.min.js"></script>
  <script src="http://labratrevenge.com/d3-tip/javascripts/d3.tip.v0.6.3.js"></script>
    <title>º∫»Ò∑’ ∞®Ω√ Ω√Ω∫≈€</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="fonts/icomoon/style.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="css/aos.css">
    <!-- MAIN CSS -->
    <link rel="stylesheet" type="text/css" href="./css/graphstyle.css">
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

   <div class="site-wrap" id="home-section">
     <header class="site-navbar js-sticky-header site-navbar-target" role="banner">
        <div class="container">
          <div class="row align-items-center position-relative">
               <div class="site-logo">
			<a href="index.html" class="text-black">
			<img style = "width:95px; height:95px;" src="./images/logo.png">
			<span class="text-primary">H.TEAM</span>
			</a>
		
		</div>
            <div class="col-12">
              <nav class="site-navigation text-right ml-auto " role="navigation">
                <ul class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block">
                  <li><a href="main.html" class="nav-link">HOME</a></li>
				  <li><a href="download.jsp" class="nav-link">DOWNLOAD</a></li>
                </ul>
              </nav>
            </div>
            <div class="toggle-button d-inline-block d-lg-none"><a href="#" class="site-menu-toggle py-5 js-menu-toggle text-black"><span class="icon-menu h3"></span></a></div>
          </div>
        </div>
      </header>
      </div>
      
      <div class="alert alert-primary" role="alert">
      		<font size="5em" color="black"><%=category %>¿« ø¿ø∞µµ</font>
      	</div>	 
	  
	  
	  <div>
      <%int mean_int = Integer.parseInt(mean);
      int mean_ten = mean_int/10;
      int mean_one =mean_int%10;
      %>
      
      <%for (int i=0; i<10; i++)  { %>
      <%if(mean_ten==i) {%>
       <img src = "./images/<%=i%>.jpg">
      
      <%} %>
       <%} %>
      
      <%for (int i=0; i<10; i++)  { %>
      <%if(mean_one==i) {%>
        <img src = "./images/<%=i %>.jpg">
      
      <%} %>
       <%} %>
      
      <img src ="./images/persent.png">
      
      </div>
      
      
     
      
      <br><br>
      
   
      <div>
			  <script src="./js/draw.js" charset="utf-8"></script>
      </div>
    </body>