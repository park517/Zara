<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Zara</title>
    <!--  부트 스트랩 부분 -->
    <link href="/resources/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <link href="/resources/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">
	<style type="text/css">
		#logo {
			width: 100px;
			height: 60px;
		}
	
	</style>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- 좌측 메뉴바 -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- 로고 부분 -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                
                    <img id="logo" alt="로고" src="/resources/logo.png">
               
       
            </a>




            <!-- Nav Item - Dashboard -->
            
            <li class="nav-item active">
                <a class="nav-link" href="index.html">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Za(자전거)ra(라이딩)</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">
            <!-- Heading -->
            <div class="sidebar-heading">
                메뉴
            </div>

            <!-- 안내 메뉴부분 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>안내</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">안내</h6>
                        <a class="collapse-item" href="buttons.html">공지사항</a>
                        <a class="collapse-item" href="cards.html">사이트소개</a>
                        <a class="collapse-item" href="buttons.html">행사안내</a>
                    </div>
                </div>
            </li>

            <!-- 자전거 메뉴 부분 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>자전거</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">자전거</h6>
                        <a class="collapse-item" href="utilities-color.html">자전거 정보</a>
                        <a class="collapse-item" href="utilities-border.html">자전거 중고장터</a>
                        <a class="collapse-item" href="utilities-animation.html">자전거 판매</a>
                    </div>
                </div>
            </li>

            <!-- 회원 메뉴 부분 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>회원</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">회원기능</h6>
                        <a class="collapse-item" href="login.html">로그인</a>
                        <a class="collapse-item" href="register.html">회원가입</a>
                        <a class="collapse-item" href="404.html">정보수정</a>
                        <a class="collapse-item" href="blank.html">내 정보 보기</a>
                    </div>
                </div>
            </li>
            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                </nav>
            </div>
     
        </div> 
            
                <!-- End of Topbar -->
    </div>
    <!-- End of Page Wrapper -->



    <!-- Bootstrap core JavaScript-->
    <script src="/resources/bootstrap/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/bootstrap/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/resources/bootstrap/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/resources/bootstrap/js/demo/chart-area-demo.js"></script>
    <script src="/resources/bootstrap/js/demo/chart-pie-demo.js"></script>

</body>

</html>