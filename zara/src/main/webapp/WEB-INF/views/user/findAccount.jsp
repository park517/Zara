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
			margin-left : 830px;
			width: 500px;
		}
		.main {
			display: flex;
			height: 800px;
			width:70%;
			flex-direction: column;
			margin: auto;
		}
		.find_form {
			display: flex;
			flex-direction: row;
			height: 400px;
			justify-content: space-between;
		}
		.find_form form {
			padding :15px;
			background-color: gray;
			color: white;
		}
		.find_form label {
			width: 100px;
		}
		.find_form li {
			list-style: none;
		}
		
	</style>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
                <!-- Toolbar -->
				<%@include file="../../include/toolbar.jspf" %>
            	
       			<div class="main">
       			
       				<h1>ID/PW 찾기</h1>
       				
       				<div class="find_form">
       				
       					<form action="" method="Post">
       						<ul>
       							<li>
       								<h3>ID 찾기</h3>
       							</li>
       							<li>
       								<label>이름</label>
       								<input id="id_name" required="required" name="name" placeholder="이름을 입력해주세요.">
       							</li>
       							<li>
       								<label>전화번호</label>
       								<input id="id_tel"  required="required" name="tel" type="tel" placeholder="전화번호를 입력해주세요.">
       							</li>
       							<li>	
       								<button id="findId" type="button" class="btn btn-info">찾기</button>
       							</li>
       						</ul>
       					</form>
       					
       					<form action="/user/findPassword" method="Post">
       						<ul>
       							<li>
       								<h3>비밀번호 찾기</h3>
       							</li>
       							<li>
       								<label>아이디</label>
       								<input id="pass_id" required="required" name="id" placeholder="아이디를 입력해주세요.">
       							</li>
       							
       							<li>
       								<label>이름</label>
       								<input id="pass_name" required="required" name="name" type="text" placeholder="이름를 입력해주세요.">
       							</li>
       							
       							<li>	
       								<label>전화번호</label>
       								<input id="pass_tel"  required="required" name="tel" type="tel" placeholder="전화번호를 입력해주세요.">
       							</li>
       							
       							<li>	
       								<button id="findPassword" type="button" class="btn btn-info">찾기</button>
       							</li>
       						</ul>
       					</form>
       				</div>
       			</div>
            </div> 
     
        </div> 
            
              <!-- End of Toolbar -->
    </div>
    <!-- End of Page Wrapper -->
	
	<!-- 부트스트랩 js 부분 -->
	<%@include file="../../include/boot-footer.jspf" %>
	
	<script>
	var btn_findId = document.getElementById('findId');
	var btn_findPassword = document.getElementById('findPassword');

	btn_findId.addEventListener('click',function() {
		
        $.ajax({
            url : "/user/findId",
            type : "post",
            dataType : 'text',
            data : {
                name : $('#id_name').val() ,
               	tel : $('#id_tel').val()
            },
            success : function(result) {
            
    			console.log(result);
            	
            	if(result =="") {
    				alert("정보를 다시 입력해주세요!");
    				location.reload();
    			}
    			
 				else {
                    alert("아이디는 : "+result+" 입니다");
                    location.reload();
    			} 
    			


            },
            error : function(xhr,status,error) {
                console.log(error);
                console.log(xhr);
                console.log(status);
            }
        });	
	});
	
	
	btn_findPassword.addEventListener('click',function() {
		
        $.ajax({
            url : "/user/findPassword",
            type : "post",
            dataType : 'text',
            data : {
            	id : $('#pass_id').val(),
                name : $('#pass_name').val() ,
               	tel : $('#pass_tel').val()
            },
            success : function(result) {
            	
    			if(result =="") {
    				alert("정보를 다시 입력해주세요!");
    				location.reload();
    			}
    			
    			else {
                    alert("비밀번호는 : "+result+" 입니다");
                    location.reload();
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