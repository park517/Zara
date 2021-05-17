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


		#logo {
			width: 100px;
			height: 60px;
		}
		
		.btn-user {
			margin-left : 850px;
			width: 500px;
		}
		.card {
		
			width: 30%;
			margin: auto;
			height: 300px;
		}
		.input-group {
			margin-bottom: 50px;
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
            <div id="">
                <!-- Toolbar -->
				<%@include file="../../include/toolbar.jspf" %>
            	
         		 <div class="card">
					<article class="card-body">
					
						<p class="text-success text-center">개인정보에 진입하기 위해 비밀번호를 입력해주세요!</p>
						<div class="input-group">
							<div class="input-group-prepend">
							    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
							 </div>
						    <input id="password" class="form-control" name="password" placeholder="비밀번호를 입력해주세요" type="password">
						</div> <!-- input-group.// -->
						<button type="button" class="btn btn-primary btn-block" >확인</button>
		
					</article>
				</div> <!-- card.// -->
            </div>
        </div> 
            
              <!-- End of Toolbar -->
    </div>
    <!-- End of Page Wrapper -->
	
	<!-- 부트스트랩 js 부분 -->
	<%@include file="../../include/boot-footer.jspf" %>

</body>

</html>