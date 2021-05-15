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
		
		.form-group label {
			font-size : 15px;
			margin-right: 20px;
			width: 100px;
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
						<form name="register-form" method="post" action="/user/do-register">
						<div class="form-group">
							<ul>
								<li>
									<label>아이디</label> 
									<input id="id" placeholder="내용을 입력해주세요" required="required" name="id">
									<button id="checkId" class="btn btn-primary" type="button">중복체크</button>
								</li>
								
								<li>
									<label>비밀번호</label>
									<input placeholder="내용을 입력해주세요" required="required" name="password">
								</li>
								
								<li>
									<label>이름</label>
									<input placeholder="내용을 입력해주세요" required="required" name="name">
								</li>
								
								<li>
									<label>전화번호</label>
									<input placeholder="내용을 입력해주세요" required="required" name="tel">
								</li>
								
								<li>
									<label>이메일</label>
									<input placeholder="내용을 입력해주세요" required="required" name="email">
								</li>
								
								<li>
									<label>주소</label>
									<input placeholder="내용을 입력해주세요" required="required" name="address">
								</li>
								
								<li>
									<label>성별</label>
									<input type="radio" placeholder="내용을 입력해주세요" required="required" name="gender">남
									<input id="woman" type="radio" placeholder="내용을 입력해주세요" required="required" name="gender">여
								</li>
							
							
							</ul>
						</div> <!-- form-group// -->
						<div class="form-group">
						<button type="submit" class="btn btn-primary btn-block">회원가입</button>
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
		var btn_check = document.getElementById('checkId');
		
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
	                    if(result == 'good'){
	                        alert("사용할 수 있는 아이디 입니다.");
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
            
	    });

	</script>
</body>



</html>