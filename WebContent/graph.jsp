<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  <script src="./js/jquery-latest.js"></script>
  <style>
  select { width: 150px; /* ���ϴ� �ʺ��� */ 
 		 padding: .8em .5em; /* �������� ���� ���� */
  	 	 font-family: inherit; /* ��Ʈ ��� */ 
  		 border: 1px solid #999; border-radius: 0px; /* iOS �ձٸ𼭸� ���� */ 
    	  }

	/* �ε���Ÿ�� */
 #progressCircleDialog  {
	border: 16px solid #f3f3f3;
	border-top: 16px solid #3498db;
	border-radius: 50%;
	width: 120px;
	height: 120px;
	animation: spin 2s linear infinite;
	position: fixed;
	top: 50%;
	margin-left: 960px;  
  }
  
  @keyframes spin {
	0% {
		 transform: translate(-50%, -50%) rotate(0deg);
	   }
  100% {
		 transform: translate(-50%, -50%) rotate(360deg);
	   }
	}
</style>
  
    <title>����� ���� �ý���</title>
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
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
	  <div>
      <!-- dialog �±׸� border-radius �Ӽ��� �̿��ؼ� �������� ����� gif �̹����� �����ϰ� �������� ����� -->
      <dialog id="progressCircleDialog">
     	  <div class="loader"></div> 
      </dialog>
   </div>

   <div class="site-wrap" id="home-section">
     <header class="site-navbar js-sticky-header site-navbar-target" role="banner">
        <div class="container">
          <div class="row align-items-center position-relative">
            <div class="col-12">
              <nav class="site-navigation text-right ml-auto " role="navigation">
                <ul class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block">
                  <li><a href="main.html" class="nav-link">Home</a></li>
                  <li><a href="#services-section" class="nav-link">Services</a></li>
                  <li><a href="#about-section" class="nav-link">About Us</a></li>
                </ul>
              </nav>
            </div>
            <div class="toggle-button d-inline-block d-lg-none"><a href="#" class="site-menu-toggle py-5 js-menu-toggle text-black"><span class="icon-menu h3"></span></a></div>
          </div>
        </div>
      </header>
    </body>