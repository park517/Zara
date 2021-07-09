<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        .address_form input {
        	margin-bottom: 10px;
        	margin-right: 10px;
        }
        
	</style>
</head>

<body id="page-top">

	<c:if test="${not empty loginMember}">
	    <!-- Page Wrapper -->
	    <div id="wrapper">
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
										<input id="mem_no" type="hidden" value="${loginMember.mem_no}" readonly="readonly" name="mem_no">
						
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
										<div class="address_form">
											<input name="mem_zip" type="text" id="sample4_postcode" placeholder="우편번호" value="${loginMember.mem_zip}">
											<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
											<input name="mem_road" type="text" id="sample4_roadAddress" placeholder="도로명주소" value="${loginMember.mem_road}">
											<span id="guide" style="color:#999;display:none"></span>
											<input name="mem_adrdetail" type="text" id="sample4_detailAddress" placeholder="상세주소" value="${loginMember.mem_adrdetail}">
										</div>
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
    </c:if>
    <!-- End of Page Wrapper -->
	
	<c:if test="${empty loginMember}">
		<%@include file="../../include/noLogin.jspf" %>
    </c:if>
	<!-- 부트스트랩 js 부분 -->
	<%@include file="../../include/boot-footer.jspf" %>
	
	
	<script>
		var current_passwordInput = document.getElementById('current_password');
		var change_passwordInput2 = document.getElementById('change_password');
		var update_form = document.update_form;
		var btn_update = document.getElementById('btn_update');
		
		
		
		
		
		btn_update.addEventListener('click',function() {
			
			if(document.update_form.id.value ==""){
				alert("아이디를 입력해주세요!");
			}
			else if(document.update_form.password.value =="") {
				alert("현재 비밀번호를 입력해주세요!");
			}
			else if(document.update_form.change_password.value =="") {
				alert("변경할 비밀번호를 입력해주세요!");
			}
			
			else if(document.update_form.name.value =="") {
				alert("이름을 입력해주세요!");
			}
			
			else if(document.update_form.tel.value =="") {
				alert("전화번호를 입력해주세요!");
			}
			
			else if(document.update_form.email.value =="") {
				alert("이메일 입력해주세요!");
			}
			
			else if(document.update_form.mem_adrdetail.value =="") {
				alert("상세주소를 입력해주세요!");
			}
			
			else if(document.update_form.gender.value =="") {
				alert("성별을 입력해주세요!");
			}
			
			else {
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
			}
	
		});
		
	</script>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function sample4_execDaumPostcode() {
			
		    new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample4_postcode').value = data.zonecode;
	                document.getElementById("sample4_roadAddress").value = roadAddr;

	                var guideTextBox = document.getElementById("guide");
	                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                if(data.autoRoadAddress) {
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    guideTextBox.innerHTML = '(도로명 주소 : ' + expRoadAddr + ')';
	                    guideTextBox.style.display = 'block';

	                } else if(data.autoJibunAddress) {
	                    var expJibunAddr = data.autoJibunAddress;
	                    guideTextBox.innerHTML = '(지번 주소 : ' + expJibunAddr + ')';
	                    guideTextBox.style.display = 'block';
	                } else {
	                    guideTextBox.innerHTML = '';
	                    guideTextBox.style.display = 'none';
	                }
	            }
		    }).open();
		}
	</script>
</body>



</html>