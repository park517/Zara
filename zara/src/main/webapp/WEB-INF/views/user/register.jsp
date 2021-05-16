<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>회원가입</title>
    
    <!--  부트 스트랩 부분 -->
	<%@include file="../../include/boot-head.jspf" %>

	<style type="text/css">
	
		#logo {
			width: 100px;
			height: 60px;
		}
		
		.btn-user {
			margin-left : 830px;
			width: 500px;
		}
		.card {

			margin : auto;
			width: 600px;
		}
		
		.card-body {
			margin-top : 30px;
		}
		
		.form-group label {
			font-size : 15px;
			margin-right: 20px;
			width: 110px;
			margin-bottom: 25px;
			
		}				
		.form-group li {
			list-style: none;
		}
		
		.form-group input {
			font-size: 15px;
		}
		
		#checkId {
			margin-left : 10px;
			height: 35px;
			width: 90px;
			font-size: 15px;
			text-align: center;
		}
		
		#woman {
            margin-left: 10px;
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
						<h4 class="card-title text-center mb-4 mt-1">회원가입</h4>
						<hr>
						<p class="text-success text-center">다양한 서비스를 이용하시려면 회원가입 해주세요</p>
						<form id="register_form" name="register_form" method="post" action="/user/register">
						<div class="form-group">
							<ul>
								<li>
									<label>아이디</label> 
									<input id="id" placeholder="아이디를 입력해주세요" required="required" name="id">
									<button id="checkId" class="btn btn-primary" type="button">중복체크</button>
								</li>
								
								<li>
									<label>비밀번호</label>
									<input type="password" id="password" placeholder="비밀번호를 입력해주세요" required="required" name="password">
								</li>
								
								<li>
									<label>비밀번호 재입력</label>
									<input type="password" id="password2" placeholder="비밀번호를 입력해주세요" required="required" name="password">
								</li>
								
								<li>
									<label>이름</label>
									<input placeholder="이름을 입력해주세요" required="required" name="name">
								</li>
								
								<li>
									<label>전화번호</label>
									<input placeholder="전화번호를 입력해주세요" required="required" name="tel">
								</li>
								
								<li>
									<label>이메일</label>
									<input placeholder="이메일을 입력해주세요" required="required" name="email">
								</li>
								
								<li>
									<label>주소</label>
									<input placeholder="주소를 입력해주세요" required="required" name="address">
								</li>
								
								<li>
									<label>성별</label>
									<input type="radio" placeholder="성별을 입력해주세요" required="required" name="gender" value="남">남
									<input id="woman" type="radio" placeholder="내용을 입력해주세요" required="required" name="gender" value="여">여
								</li>
							
							
							</ul>
						</div> <!-- form-group// -->
						<div class="form-group">
						<button id="btn_register" type="button" class="btn btn-primary btn-block">회원가입</button>
						</div> <!-- form-group// -->
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
		var passwordInput = document.getElementById('password');
		var passwordInput2 = document.getElementById('password2');
		var register_form = document.register_form;
		var btn_check = document.getElementById('checkId');
		var check_id_flag = 0;
		var btn_register = document.getElementById('btn_register');
		
		btn_register.addEventListener('click',function() {
			
			var password = passwordInput.value;
			var password2 = passwordInput2.value;
	
			if(password !== password2) {
				alert("비밀번호가 일치하지 않습니다.");
				passwordInput.value = "";
				passwordInput2.value = "";
				passwordInput.focus();
			}
			
			else {
				
				if(check_id_flag == 0 )
					alert("중복체크 해주세욧!");
				else
					register_form.submit();
			}
			

				
		});
		
		
		btn_check.addEventListener('click', function(){
			
				
         
	            var idInput =document.getElementById('id');
	            var id =idInput.value;				
	
	            $.ajax({
	                url : "/user/checkId",
	                type : "post",
	                dataType : 'text',
	                data : {
	                    id : id
	                },
	                success : function(result) {
	                
	                    console.log("결과  :" +result);
	                    if(result == '0'){
	                        alert("사용할 수 있는 아이디 입니다.");
	                        check_id_flag =1;
	                    }
	                    else if(result =="1") {
	                    check_id_flag =1;
	                        alert("중복된 아이디 입니다..");
	                    }
	                },
	                error : function(xhr,status,error) {
	                    console.log(error);
	                    console.log(xhr);
	                    console.log(status);
	                }
	            });
            
	    });
	
		
// 		function checkPassword() {
// 			var password = passwordInput.value;
// 			var password2 = passwordInput2.value;

// 			if(password !== password2) {
// 				alert("비밀번호가 일치하지 않습니다.");
// 				passwordInput.value = "";
// 				passwordInput2.value = "";
// 				passwordInput.focus();
// 			}
				
			
// 		}
		
	</script>
</body>



</html>