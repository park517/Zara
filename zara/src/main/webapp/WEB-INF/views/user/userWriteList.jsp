<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


    <!--  부트 스트랩 부분 -->
	<%@include file="../../include/boot-head.jspf" %>
	<style type="text/css">
	
	
		.main {
			
			width: 90%;
        	 margin: 0 auto;
        	 padding-top: 5%;
         	padding-bottom: 5%;
		}
		#logo {
			width: 100px;
			height: 60px;
		}
		
		.btn-user {
			margin-left : 850px;
			width: 500px;
		}
		
		.notice_table {
			margin-top : 50px;
			text-align: center;
			width: 50%;
		}
		.hello_table{
			margin : 100px auto;
			
		}
		#hello_box{
			margin : 0 auto;
		}
		
	</style>


<body class="d-flex flex-column h-100">
<section class="py-5 scroll-target">
    <!-- Page Wrapper -->
    <div id="wrapper">
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content" >
            	<div class="main">
					유저가 쓴글 페이지 입니다.
            	</div>
     
        	</div> 
            
              <!-- End of Toolbar -->
   	   </div>
    <!-- End of Page Wrapper -->
	</div>
	</section>
	<!-- 부트스트랩 js 부분 -->
	<%@include file="../../include/boot-footer.jspf" %>

</body>

</html>