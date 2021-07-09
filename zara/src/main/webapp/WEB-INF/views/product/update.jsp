<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    

<!DOCTYPE html>
<html lang="en">

    
    <!--  부트 스트랩 부분 -->
	<%@include file="../../include/boot-head.jspf" %>
	<style type="text/css">
	
    .sell_input {
        margin-top: 10px;
        list-style: none;
        margin-left: 10%;
        width: 75%;
    }
    .sell_input label {
        width: 150px;
        margin-top: 15px;
    }
    .sell_input li {
        padding: 10px;
        border-bottom: 1px solid rgb(136, 134, 134);
    }

    .select_img {
        list-style: none;
    }
    .select_img li {
        border: none;
    }
    #insert_zone p{
        margin-top: 100px;
        text-align: center;
        font-size: 30px;
        font-weight: bold;
    }
    .insert_form {
        margin: auto;
        width: 70%;
        height: 80%;
        border: 1px black solid;
    }
    .insert_form button {
        margin-left: 45%;
    }

    .select_img {
        text-align: center;
    }
    .select_img img {
        width: auto;
        height: 200px;
    } 

    .card {
        position: fixed;
    }

    .image {
        display: block;
        width: 100%;
    }
    .image-label {
        position: relative;
        bottom: 22px;
        left: 5px;
        color: white;
        text-shadow: 2px 2px 2px black;
    }
    
    .address_input {
        
    }
    .imgs_wrap {
        overflow: scroll;
        width: 100%;
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
        width: 1000px;
        list-style: none;
        padding: 0px;
    }
    .img_li {
        float: left;

    }
    #logo {
    	width: 100px;
    	height: 60px;
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
					  <div id="insert_zone">         
					    <p>상품 등록하기</p>
                        <form class="insert_form" action="/product/update" method="Post" enctype="multipart/form-data">
                            <input type="hidden" value="${product.pno}" name="pno">
                            <ul class="sell_input">
                                <li>
                                    <div>
                                        <h2><b>이미지 미리보기</b></h2>
                                        <div class="input_wrap">
                                            <a href="javascript:" onclick="fileUploadAction();" class="my_button">파일 업로드</a>
                                            <input type="file" id="input_imgs" name="files" multiple/>
                                        </div>
                                    </div>

                                    <div>
                                        <div class="imgs_wrap">
                                            <ul class="imgs_list">
                                             <img id="img" alt="640x604 이미지를 넣어주세요!"/>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <label>상품 이름</label>
                                    <input type="text" name="pro_name" placeholder="최대 50자" value="${product.pro_name}">
                                </li>
                                <li>
                                    <label>상품 무게</label>
                                    <input type="text" name="pro_weight" placeholder="최대 50자" value="${product.pro_weight}">
                                </li>
                                <li>
                                    <label>자전거 종류</label>
                                    <select name="pro_category" id="">
                                        <option value="${product.pro_category}" selected>${product.pro_category}</option>
                                        <option value="hybrid">하이브리드</option>
                                        <option value="road">로드</option>
                                        <option value="mtb">mtb</option>
                                    </select>

                                </li>
                                <li>
                                    <label>상품 제조사</label>
                                    <input type="text" name="pro_com" placeholder="최대 50자"
                                    value="${product.pro_com}"
                                    >
                                </li>

                                <li>
                                    <label>가격</label>
                                    <input type="text" name="pro_price" value="${product.pro_price}">원
                                </li>

                                <li>
                                    <label for="description"  >상품 설명</label>
                                    <textarea name="pro_info" id="" cols="30" rows="10">${product.pro_info}</textarea>
                                </li>
                                <li>
                                    <label>수량</label>
                                    <input type="text" name="pro_stock" value="1" value="${product.pro_stock}">개
                                </li>
                                
                            </ul>
                            <button class="btn btn-primary">판매글 작성</button>
                        </form> 
                     </div>   
	           	
	            </div>
	     
	        </div> 
	            
	              <!-- End of Toolbar -->
	    </div>

    <!-- End of Page Wrapper -->
    

	
	<!-- 부트스트랩 js 부분 -->
	<%@include file="../../include/boot-footer.jspf" %>
	</c:if>
	<c:if test="${empty loginMember}">
		<%@include file="../../include/noLogin.jspf" %>
    </c:if>
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