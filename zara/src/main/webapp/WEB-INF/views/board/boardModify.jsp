<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
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

<body class="d-flex flex-column h-100">
<section class="py-5" id="scroll- scroll-target">
	<c:if test="${not empty loginMember}">

	    <!-- Page Wrapper -->
	    <div id="wrapper">
	        <!-- Content Wrapper -->
	        <div id="content-wrapper" class="d-flex flex-column">
	
	            <!-- Main Content -->
	            <div id="content">
					
					
	            	<div id="boardMain">
	            		<h2>글 수정하기</h2>
	            		<br><br><br>
	            		<!-- 글 정보 입력 -->
	            		<form id="updateForm" name="updateForm" method="post" action="/board/update">
	            			<input type="hidden" name="bno" value="${boardVO.bno}">
	            			<ul>
	            				<li>
	            					<label for="title">제목</label> 
	            					<input type="text" id="title" name="title" value="${boardVO.title}">	            				
	            				</li>
	            				<li>
	            					<label for="category">카테고리</label>
	            					<select name='category'>
	            						<option value="${boardVO.category}" selected>${boardVO.category}</option>
	            						 <option value='와글와글'>와글와글</option>
										 <option value='질문 게시판'>질문 게시판</option>
										 <option value='함께 탈 사람 구해요'>함께 탈 사람 구해요</option>
	            					</select>
	            				</li>
	            				<li>
	            					<label for="content">내용</label>
	            					<textarea rows="10" cols="50" id="content" name="content" >${boardVO.content}</textarea>
	            				</li> 
	            			</ul>
	            			<div align="center">
	            				<input type="submit" value="수정">
	            				<input type="button" value="목록" class ="btn btn-primary" onclick="location.href='getCategoryList?category=와글와글'">
	            			</div>
	            		</form>
	            		
	            	</div>
	           
	            </div>
	     
	        </div> 
	            
	    </div>
    </c:if>
    <!-- End of Page Wrapper -->
    </section>
    <c:if test="${empty loginMember}">
		<%@include file="../../include/noLogin.jspf" %>
    </c:if>
	
	<!-- 부트스트랩 js 부분 -->
	<%@include file="../../include/boot-footer.jspf" %>

</body>

</html>