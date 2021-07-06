<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
			width: 30%;
			margin: auto;
			height: 300px;
		}
		.input-group {
			margin-bottom: 50px;
		}
		
	</style>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
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
						<button id="btn_check" type="button" class="btn btn-primary btn-block">확인</button>
		
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
		var url = new URL(window.location.href);
		var params = url.searchParams;
		var job = params.get('job');
	
		var passwordInput = document.getElementById('password');
		var btn_check = document.getElementById('btn_check');
		
		
		btn_check.addEventListener('click', function(){
			
			
	        var password =  passwordInput.value;
				

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
                        
                        if(job == 'update') {
                     		location.href = "/user/update"
          			    }
                        
                        else if(job == 'delete') {
                        	location.href = "/user/delete"
                        }
                    }
                    else if(result =="error") {
                        alert("비밀번호가 일치하지 않습니다.");
                        passwordInput.value = "";
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