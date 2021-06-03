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
		
		 .main h2 {
		 	text-align: center;
		 }
	      #logo {
	         width: 100px;
	         height: 60px;
    	 }
        .product_wrap {
            margin: auto;
            margin-top: 100px;
            display: flex;
            flex-direction: row;
            width: 70%;
            height: 50%;
        }
		
        .pro_info {
            display: flex;
            flex-direction: column;
            background-color: white;
            width: 60%;
            height: 100%;
        }

        .pro_info ul {
            margin-top: 30px;
            list-style: none;
        }
        .pro_info li {
            margin-bottom: 10px;
        }
        .pro_img {
            text-align: center;
            width: 40%;
        }
        .pro_img ul {
            list-style: none;
            width: 100%;
            height: 300px;
            overflow: scroll;
        }
        .pro_img li {
            float: left;
        }
        .pro_img img{
            padding: 10px;
            width: 90%;
            height: 90%;
        }
        .pro_description {
            margin: auto;
            margin-top: 50px;
            width: 70%;
        }

	</style>
		
</head>

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
					<div class="main">
	                    <h2>상품 정보</h2>
	                    <div class="product_wrap">
	                        <div class="pro_img">
	                            <ul>
	                            	<c:forEach items="${files}" varStatus="status" var="files">
		                                <li><img src="/resources/upload/product/${files.file_name}/" alt="상품 이미지"></li>
									</c:forEach>
	                            </ul>
	                            
	                        </div>
	
	                        <div class="pro_info">
	                            <ul>    
	                                <li>상품 이름 : ${product.pro_name} </li>
	                                <li>상품 무게 : ${product.pro_weight} KG </li>
	                                <li>상품 재고 : ${product.pro_stock}개 </li>
	                                <li>상품 제조사 : ${product.pro_com} </li>
	                                <li>상품 가격 : ${product.pro_price} 원 </li>
	                                <li>상품 적립금 : ${product.pro_point} 원</li>
	                                <li><button class="btn btn-primary">구매하기</button></li>
	                            </ul>
	                        </div>
	                    </div>
	
	                    <div class="pro_description">
	                        <h3>상품설명</h3>
	                        <textarea style="resize: none" name="" id="" cols="30" rows="10" readonly>${product.pro_info}</textarea>
	                    	<c:if test="${product.mem_id eq loginMember.mem_id}">
		                    	<div class="btn_product">
			                    	<button  class="btn btn-primary" onclick="updateProduct(${product.pno})">수정</button>
			                    	<button  class="btn btn-danger" onclick="deleteProduct(${product.pno})">삭제</button>
		                    	</div>
	                    	</c:if>
	                    </div>
	                    <hr>

	                    
	        		</div>
	            </div>
	     
	        </div> 
	            
	              <!-- End of Toolbar -->
	    </div>

    <!-- End of Page Wrapper -->
    

	
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
            
            function updateProduct(pno) {
             	var check = confirm("수정하시겠습니까?");
            	if(check) {
            		location.href = "/product/update/?pno="+pno;
            	}
            }
            function deleteProduct(pno) {
             	var check = confirm("삭제하시겠습니까?");
            	if(check) {
            		location.href = "/product/delete/?pno="+pno;
            	}
            }
            
            
       

        
        </script>
	
		

</body>

</html>