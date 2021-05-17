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
						<h4 class="card-title text-center mb-4 mt-1">정보 수정하기</h4>
						<hr>
						<p class="text-success text-center"> 수정하실 정보를 입력해주세요!</p>
						<form id="update_form" name="update_form" method="post" action="/user/update">
						<div class="form-group">
							<ul>
								<li>
									<label>아이디</label> 
									<input id="id" value="${loginMember.mem_id}" readonly="readonly" name="id">
					
								</li>
								
								<li>
									<label>현재 비밀번호</label>
									<input type="password" id="current_password" placeholder="현재 비밀번호를 입력해주세요" required="required" name="password">
								</li>
								
								<li>
									<label>변경할 비밀번호 </label>
									<input type="password" id="change_password" placeholder="변경할 비밀번호를 입력해주세요" required="required" name="change_password">
								</li>
								
								<li>
									<label>이름</label>
									<input value="${loginMember.mem_name}" required="required" name="name">
								</li>
								
								<li>
									<label>전화번호</label>
									<input value="${loginMember.mem_tel}" required="required" name="tel">
								</li>
								
								<li>
									<label>이메일</label>
									<input value="${loginMember.mem_email}" required="required" name="email">
								</li>
								
								<li>
									<label>주소</label>
									<input value="${loginMember.mem_address}" required="required" name="address">
								</li>
								
								<li>
									<label>성별</label>
									<input type="radio" placeholder="성별을 입력해주세요" required="required" name="gender" value="남">남
									<input id="woman" type="radio" placeholder="내용을 입력해주세요" required="required" name="gender" value="여">여
								</li>
							
							
							</ul>
						</div> <!-- form-group// -->
						<div class="form-group">
						<button id="btn_update" type="button" class="btn btn-primary btn-block">정보 수정하기</button>
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
		var current_passwordInput = document.getElementById('current_password');
		var change_passwordInput2 = document.getElementById('change_password');
		var update_form = document.update_form;
		var btn_update = document.getElementById('btn_update');
		
		
		btn_update.addEventListener('click',function() {
	        var password =  current_passwordInput.value;
	        
            $.ajax({
                url : "/user/checkPassword",
                type : "post",
                dataType : 'text',
                data : {
                    password : password
                },
                success : function(result) {
                
                    console.log("결과  :" +result);
                    if(result == 'good'){
                        alert("비밀번호가 일치 합니다.");
                        update_form.submit();
                    }
                    else if(result =="error") {
                        alert("비밀번호가 일치하지 않습니다.");
                        passwordInput.value = "";
                        passwordInput.focus();
                        
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