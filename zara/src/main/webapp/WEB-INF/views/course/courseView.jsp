<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
    

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
		#img_preview {
			width: 200px;
			height: 200px;
		}
		#imgsize{
		margin: 30px;
		}
		</style>
		
	</head>
	
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	
<script type="text/javascript">
	window.onload = function(){
		var delete_btn = document.getElementById('delete_btn');
		//이벤트 연결
		delete_btn.onclick=function(){
			var choice = window.confirm('삭제하시겠습니까?');
			if(choice){
				location.replace('delete.do?cos_num=${course.cos_num}');
			}
		};
	};
</script>
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
					
					
	            	<div id="boardMain">
	            		<h2>글 상세 보기</h2>
	            		<br><br><br>
	            		<c:if test="${loginMember.mem_id eq course.mem_id}">
		            		<input type="button" value="수정" class ="btn btn-primary" onclick="location.href='update?cos_num=${course.cos_num}'" >
		            		<input type="button" value="삭제" class ="btn btn-primary" id="delete_btn" >
	            		</c:if>
	            		<!-- 글 정보 입력 -->
	            		<ul>
	            			<li>작성자 : ${course.mem_id}</li>
	            			<li>제목 : ${course.cos_title }</li>
	            			<li>작성일 : ${course.create_at}</li>
	            			
	            		</ul>
	            		<hr>
	            		<div>
								${course.cos_content}
	            			
	            		</div>
	            		<hr>
	            	
		            		
		            		<input type="button" value="목록" class ="btn btn-primary" onclick="location.href='/course/getList'">
	            		
	            	</div>
	           
	            </div>
	     
	        </div> 
	            
	              <!-- End of Toolbar -->
	    </div>

    <!-- End of Page Wrapper -->
    

	
	<!-- 부트스트랩 js 부분 -->
	<%@include file="../../include/boot-footer.jspf" %>


</html>