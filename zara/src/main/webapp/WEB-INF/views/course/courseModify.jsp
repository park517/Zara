<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
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
		
		#boardMain{
			width: 80%;
			margin: 0 auto;
			padding-top: 5%;
			padding-bottom: 5%;
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
	</style>
</head>

<!-- ckeditor -->
<script src="https://cdn.ckeditor.com/ckeditor5/28.0.0/classic/ckeditor.js"></script>



<body id="page-top">
	<c:if test="${not empty loginMember}">

	    <!-- Page Wrapper -->
	    <div id="wrapper">
			<%@include file="../../include/sidemenu.jspf" %>
	        <!-- Content Wrapper -->
	        <div id="content-wrapper" class="d-flex flex-column">
	
	            <!-- Main Content -->
	            <div id="content">
	                <!-- Toolbar -->
					<%@include file="../../include/toolbar.jspf" %>
					
					
	            	<div id="boardMain">
	            		<h2>글 수정하기</h2>
	            		<br><br><br>
	            		<!-- 글 정보 입력 -->
	            		<form id="updateForm" name="updateForm" method="post" action="/course/update">
	            			<input type="hidden" name="cos_num" value="${courseVO.cos_num}">
	            			<ul>
	            				<li>
	            					<label for="cos_title">제목</label> 
	            					<input type="text" id="cos_title" name="cos_title" value="${courseVO.cos_title}">	            				
	            				</li>
	            				<li>
	            					<label for="cos_category">카테고리</label>
	            					<select name='cos_category'>
	            						<option value="${courseVO.cos_category}" selected>
											<c:if test="${courseVO.cos_category == 1}">
						                  		수도권
						                  	</c:if>
						                  	<c:if test="${courseVO.cos_category == 2}">
						                  		제주도
						                  	</c:if>
						                  	<c:if test="${courseVO.cos_category == 3}">
						                  		전국일주
						                  	</c:if>
										</option>
	            						 <option value="1">수도권</option>
										 <option value="2">제주</option>
										 <option value="3">전국일주</option>
	            					</select>
	            				</li>
	            				<li>
	            					<label for="cos_content">내용</label>
	            					<textarea rows="10" cols="50" id="cos_content" name="cos_content" >${courseVO.cos_content}</textarea>
	            				<script>
	            				ClassicEditor 
	            			    .create( document.querySelector('#cos_content')) 
	            			    .then( editor => { 
	            			        console.log( editor ); 
	            			    } ) 
	            			    .catch( error => { 
	            			        console.error( error ); 
	            			    } );
	            				</script>
	            				</li> 
	            			
	            			
	            			</ul>
	            			<div align="center">
	            				<input type="submit" value="수정" >
	            				<input type="button" value="목록" class ="btn btn-primary">
	            			</div>
	            		</form>
	            		
	            		
	            		
	            		     	</div>
	           
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

</body>

</html>