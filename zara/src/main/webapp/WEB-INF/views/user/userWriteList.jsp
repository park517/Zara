<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Zara</title>
    
    
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
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
		<%@include file="../../include/sidemenu.jspf" %>
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content" >
                <!-- Toolbar -->
				<%@include file="../../include/toolbar.jspf" %>
            	<div class="main">
					유저가 쓴글 페이지 입니다.
            	</div>
     
        	</div> 
            
              <!-- End of Toolbar -->
   	   </div>
    <!-- End of Page Wrapper -->
	</div>
	<!-- 부트스트랩 js 부분 -->
	<%@include file="../../include/boot-footer.jspf" %>

</body>

</html>