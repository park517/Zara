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
		.ck-editor__editable_inline {
			min-width:600px;
	   		min-height: 250px;
		}
	</style>
</head>

<!-- include libraries(jQuery, bootstrap) -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

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
	            					<textarea rows="10" cols="50" id="cos_content" name="cos_content" class="summernote">${courseVO.cos_content}</textarea>
			            			<script>
									$('.summernote').summernote({
										height : 500, // 에디터 높이 
										focus : true,
										//콜백 함수
										callbacks : {
											onImageUpload : function(files, editor, welEditable) {
												// 파일 업로드(다중업로드를 위해 반복문 사용)
												for (var i = files.length - 1; i >= 0; i--) {
													uploadSummernoteImageFile(files[i], this);
												}
											}
										}
									});
								/**
								 * 이미지 파일 업로드
								 */
								function uploadSummernoteImageFile(file, editor) {
									data = new FormData();
									data.append("file", file);
									$.ajax({
										data : data,
										type : "POST",
										url : "uploadSummernoteImageFile",
										contentType : false,
										enctype : 'multipart/form-data',
										processData : false,
										success : function(data) {
											$(editor).summernote('editor.insertImage', data.url);
										}
									});
								}
							</script>
	            				</li> 
	            			
	            			
	            			</ul>
	            			<div align="center">
	            				<input type="submit" value="수정" >
	            				<input type="button" value="목록" class ="btn btn-primary" onclick="location.href='/course/getList'">
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
	

</body>

</html>