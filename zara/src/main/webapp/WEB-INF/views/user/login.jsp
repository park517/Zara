<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">


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

			margin : auto;
			width: 500px;
		}
		
		.card-body {
			margin-top : 30px;
		}
		i { 
			height: 100%;
			font-size: 30px;
		}
		
		
		
		
	</style>

<body id="page-top" class="d-flex flex-column h-100">

    <!-- Page Wrapper -->
    <div id="wrapper">
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
            	<div class="card">
					<article class="card-body">
						<h4 class="card-title text-center mb-4 mt-1">로그인</h4>
						<hr>
						<p class="text-success text-center">다양한 서비스를 이용하시려면 로그인 해주세요</p>
						<form name="login-form" method="post" action="/login">
							<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
								    <span class="input-group-text"><i class="fa fa-user"></i></span>
								 </div>
								<input id="username" name="username" class="form-control"   placeholder="아이디를 입력해주세요" type="text">
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
							<button type="button" class="btn btn-primary btn-block" onclick='doLogin()'>로그인</button>
							<button type="button" class="btn btn-primary btn-block" onclick="location.href='/user/register'"> 회원가입</button>
							</div> <!-- form-group// -->
							<p class="text-center"><a href="/user/find" class="btn">아이디 및 비밀번호를 잊어버리셨나요?</a></p>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />	
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
				
				var idInput =document.getElementById('username');
				var passwordInput =document.getElementById('password');
				var id =idInput.value;
				var password =passwordInput.value;
			    var csrfHeaderName ="${_csrf.headerName}"; 
		       	var csrfTokenValue="${_csrf.token}";

				$.ajax({
					url : "/login",
        			beforeSend: function(xhr) {
                        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
                  	},
					type : "post",
					dataType : 'text',
					data : {
						username : id,
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