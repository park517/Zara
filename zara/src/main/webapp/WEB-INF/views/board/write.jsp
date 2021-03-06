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
		
		.imgs_wrap {
	        overflow: scroll;
	        width: 500px;
	        border: 1px solid gray;
	        padding: 10px;
	        height: 170px;
	        box-sizing: content-box;
	        margin-bottom: 20px;
	    }
	
	    .imgs_wrap .img_item {
	        width: 150px;
	        padding: 5px;
	
	        border: 1px solid black;
	        margin-right: 10px;
	    }
	
	    .imgs_wrap img {
	        width : 150px;
	        height: 150px;
	        margin-right: 15px;
	    }
	    .imgs_list {
	        width: 500px;
	        list-style: none;
	        padding: 0px;
	    }
	    .img_li {
	        float: left;
	
	    }
		
	</style>
	
	<!-- include libraries(jQuery, bootstrap) -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>



<body class="d-flex flex-column h-100">
<section class="py-5 scroll-target">
	<c:if test="${not empty loginMember}">

	    <!-- Page Wrapper -->
	    <div id="wrapper">
	        <!-- Content Wrapper -->
	        <div id="content-wrapper" class="d-flex flex-column">
	
	            <!-- Main Content -->
	            <div id="content">
					
	            	<div id="boardMain">
						
	            		<br><br><br>
	            		<!-- 글쓰기 폼 작성 -->
	            		<form id="write_form" value="write_form" method="post" action="/board/write" enctype="multipart/form-data">
	            		<div class="form-group">
	            		<input type="hidden" value="${loginMember.mem_no}" name="mem_no">
	            		<ul>
	            			<li>
	            				<label for="cos_title">제목</label>
	            				<input type="text" id="title" name="title" required="required" >
	            			</li>
	            			
	            			<li>
	            				<label for="category">카테고리</label>
	            				<select name='category'>
								    <option value='' selected>-- 선택 --</option>
								    <option value='와글와글'>와글와글</option>
								    <option value='질문 게시판'>질문 게시판</option>
								    <option value='함께 탈 사람 구해요'>함께 탈 사람 구해요</option>
								</select>
	            			</li>
	            			
	            			<li>
	            				<label for="content">내용</label> 
	            				<textarea id="content" name="content" class="summernote"></textarea>
	            				
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
										url : "/course/uploadSummernoteImageFile",
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
	            			<input type="submit" class ="btn btn-primary" value="작성하기">
	            			<input type="button" class ="btn btn-primary" value="목록" onclick="location.href='/course/getList'">
	            		</div>
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
	
	

	

</body>

</html>