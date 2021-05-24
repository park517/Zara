<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
	            		<h2>글쓰기</h2>
	            		<br><br><br>
	            		<!-- 글쓰기 폼 작성 -->
	            		<form id="write_form" value="write_form" method="post" action="/board/write" >
	            		<div class="form-group">
	            		<input type="hidden" value="${loginMember.mem_id}" name="mem_id">
	            		<ul>
	            			<li>
	            				<label for="title">제목</label>
	            				<input type="text" id="title" name="title" required="required" >
	            			</li>
	            			
	            			<li>
	            				<label for="title">카테고리</label>
	            				<select name='category'>
								    <option value='' selected>-- 선택 --</option>
								    <option value='와글와글'>와글와글</option>
								    <option value='질문 게시판'>질문 게시판</option>
								    <option value='함께 탈 사람 구해요'>함께 탈 사람 구해요</option>
								</select>
	            			</li>
	            			<li>
	            				<label for="content">내용</label>
	            				<textarea rows="10" cols="50" id="content" name="content"></textarea>
	            			</li>
	            			<!-- <li>
	            				<label for="upload">이미지 첨부</label>
	            				<input type="file" name="upload" id="upload" accept="image/gif, image/png, image/jpeg">
	            			</li> -->
	            		</ul>
	            		<div align="center">
	            			<input type="submit" class ="btn btn-primary" value="작성하기">
	            			<input type="button" class ="btn btn-primary" value="목록" onclick="location.href='/board/getlist'">
	            		</div>
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