<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>로그인</title>
    
    
    <!--  부트 스트랩 부분 -->
	<%@include file="../../include/boot-head.jspf" %>

	<style type="text/css">
	
		#logo {
			width: 100px;
			height: 60px;
		}
		
		.btn-user {
			margin-left : 900px;
			width: 300px;
		}
		
		.card {

			margin : auto;
			width: 500px;
		}
		
		.card-body {
			margin-top : 30px;
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
            <div id="content">
                <!-- Toolbar -->
				<%@include file="../../include/toolbar.jspf" %>
            	<div class="card">
					<article class="card-body">
						<h4 class="card-title text-center mb-4 mt-1">로그인</h4>
						<hr>
						<p class="text-success text-center">다양한 서비스를 이용하시려면 로그인 해주세요</p>
						<form name="login-form" method="post" action="/user/do-login">
						<div class="form-group">
						<div class="input-group">
							<div class="input-group-prepend">
							    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
							 </div>
							<input id="id" name="id" class="form-control"   placeholder="아이디를 입력해주세요" type="text">
						</div> <!-- input-group.// -->
						</div> <!-- form-group// -->
						<div class="form-group">
						<div class="input-group">
							<div class="input-group-prepend">
							    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
							 </div>
						    <input id="password" class="form-control" name="password" placeholder="비밀번호를 입력해주세요" type="password">
						</div> <!-- input-group.// -->
						</div> <!-- form-group// -->
						<div class="form-group">
						<button type="button" class="btn btn-primary btn-block" onclick='doLogin()'> 로그인  </button>
						<button type="button" class="btn btn-primary btn-block" onclick="location.href='/user/register'"> 회원가입</button>
						</div> <!-- form-group// -->
						<p class="text-center"><a href="#" class="btn">아이디 및 비밀번호를 잊어버리셨나요?</a></p>
						</form>
					</article>
				</div> <!-- card.// -->
       
            </div>
     
        </div> 
            
              <!-- End of Toolbar -->
    </div>
    <!-- End of Page Wrapper -->
	
	<!-- 부트스트랩 js 부분 -->
	<%@include file="../../include/boot-footer.jspf" %>
	
	
	<script>
		
			function doLogin() {
				
				var idInput =document.getElementById('id');
				var passwordInput =document.getElementById('password');
				var id =idInput.value;
				var password =passwordInput.value;
				

				$.ajax({
					url : "/user/do-login",
					type : "post",
					dataType : 'text',
					data : {
						id : id,
						password : password	
					},
					success : function(result) {
						console.log("결과  :" +result);
						if(result == 'good'){
							alert("로그인에 성공하였습니다.");
							location.href="/";
						}
						else if(result =="error") {
							alert("아이디 및 비밀번호가 맞지 않습니다.");
						}
					},
					
					error : function(xhr,status,error) {
						console.log(error);
						console.log(xhr);
						console.log(status);
					}
				});
			}
	
	
	
	
	

	</script>
	
</body>

</html>