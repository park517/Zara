<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <!--  부트 스트랩 부분 -->
	<%@include file="../../include/boot-head.jspf" %>
	<style type="text/css">
	
	
		.main {
			margin-left : 50px;
			width: 100%;
			height: 80%;
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
		#banner {
			margin-top : 40px;
			margin-bottom : 40px;
		}
		thead {
			background-color: #212529; 
			color: white;
		}
		#btn_write_notice {
			background-color: gray;
		}
		
	</style>

<body class="d-flex flex-column h-100">

    <!-- Page Wrapper -->
    <div id="wrapper">
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
            	
        		<div class="main">
					<h2>Zara 공지사항 작성하기 </h2>
					<div class="notice_wrap">
						<ul>
							<li>
								<label><strong>공지제목</strong></label>
								<input type="text">
							</li>
							<li>
							</li>
						
						</ul>
					
					</div>
        		</div>
           
            </div>
     
        </div> 
            
              <!-- End of Toolbar -->
    </div>
    <!-- End of Page Wrapper -->
	
	<!-- 부트스트랩 js 부분 -->
	<%@include file="../../include/boot-footer.jspf" %>

</body>

</html>