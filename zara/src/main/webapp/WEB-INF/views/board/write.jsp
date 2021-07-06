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
					
					
	            	<div id="boardMain">
	            		<h2>글쓰기</h2>
	            		<br><br><br>
	            		<!-- 글쓰기 폼 작성 -->
	            		<form id="write_form" value="write_form" method="post" action="/board/write" enctype="multipart/form-data">
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
                                    <div>
                                        <h4><b>이미지 미리보기</b></h4>
                                        <div class="input_wrap">
                                            <input name="files" type="file" id="input_imgs" multiple accept=".gif,.jpg,.png"/>
                                        </div>
                                    </div>

                                    <div>
                                        <div class="imgs_wrap">
                                            <ul class="imgs_list">
                                             <img id="img" alt="640x640 이미지를 넣어주세요!"/>
                                            </ul>
                                        </div>
                                    </div>
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
	
	<script>

    

        var sel_files = [];


        $(document).ready(function() {
            $("#input_imgs").on("change", handleImgFileSelect);
        }); 

        function fileUploadAction() {
            console.log("fileUploadAction");
            $("#input_imgs").trigger('click');
        }

        function handleImgFileSelect(e) {

            // 이미지 정보들을 초기화
            sel_files = [];
            $(".imgs_list").empty();

            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);

            var index = 0;
            filesArr.forEach(function(f) {
                if(!f.type.match("image.*")) {
                    alert("확장자는 이미지 확장자만 가능합니다.");
                    return;
                }

                sel_files.push(f);

                var reader = new FileReader();
                reader.onload = function(e) {

                     var html = "<li class='img_li'><a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a></li>";

                    $(".imgs_list").append(html);
                    index++;

                }
                reader.readAsDataURL(f);
                
            });
        }

        function deleteImageAction(index) {            
        console.log("index : "+index);
        sel_files.splice(index, 1);

        var img_id = "#img_id_"+index;
        $(img_id).remove();

        console.log(sel_files);
    }

	</script>

</body>

</html>