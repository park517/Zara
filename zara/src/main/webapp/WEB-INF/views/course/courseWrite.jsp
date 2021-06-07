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
</head>

<!-- 네이버 스마트 에디터  -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
 
$(function(){
   nhn.husky.EZCreator.createInIFrame({
      oAppRef: oEditors,
      elPlaceHolder: "ir1",
      //SmartEditor2Skin.html 파일이 존재하는 경로
      sSkinURI: "${pageContext.request.contextPath}/resources/static/SE2SmartEditor2Skin.html",  
      htParams : {
          // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
          bUseToolbar : true,             
          // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
          bUseVerticalResizer : true,     
          // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
          bUseModeChanger : true,         
          fOnBeforeUnload : function(){
               
          }
      }, 
      fOnAppLoad : function(){
          //textarea 내용을 에디터상에 바로 뿌려주고자 할때 사용
          oEditors.getById["ir1"].exec("PASTE_HTML", ["ㅎㅇ 시작하자마자 이문구 작성됨."]);
      },
      fCreator: "createSEditor2"
      });
</script>


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
	            		<form id="write_form" value="write_form" method="post" action="/course/write" enctype="multipart/form-data">
	            		<div class="form-group">
	            		<input type="hidden" value="${loginMember.mem_id}" name="mem_id">
	            		<ul>
	            			<li>
	            				<label for="cos_title">제목</label>
	            				<input type="text" id="cos_title" name="cos_title" required="required" >
	            			</li>
	            			
	            			<li>
	            				<label for="cos_category">카테고리</label>
	            				<select name='cos_category'>
								    <option value='' selected>-- 선택 --</option>
								    <option value="1">수도권</option>
								    <option value="2">제주</option>
								    <option value="3">전국일주</option>
								</select>
	            			</li>
	            			<li>
	            				<label for="cos_content">내용</label>
	            				<textarea rows="10" cols="50" id="ir1" name="ir1"></textarea>
	            			</li>
	            			
	            		</ul>
	            		<div align="center">
	            			<input type="submit" class ="btn btn-primary" value="작성하기">
	            			<input type="button" class ="btn btn-primary" value="목록" onclick="location.href='/course/getCategoryList'">
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