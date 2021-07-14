<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    

<!DOCTYPE html>
<html lang="en">


    
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
        .reply {
            width: 70%;
            margin: auto;
            height: 700px;
        }
        .insert_reply {
            display: flex;
            flex-direction: column;
            margin-top: 50px;
        }
        .insert_reply textarea {
            resize: none; 
            width: 50%;
        }
        .insert_reply button {
            width: 50%;
        }
        .re_reply {
            display: none;
        }
        .re_reply_wrap {
        	margin-left: 30px;
        	margin-top: 10px;
        	height: 
        	
        }
        .re_reply_wrap i {
        	font-size: 30px;
        }

	</style>
		

<body id="page-top">
	    <!-- Page Wrapper -->
	    <div id="wrapper">
	        <!-- Content Wrapper -->
	        <div id="content-wrapper" class="d-flex flex-column">
	
	            <!-- Main Content -->
	            <div id="content">

					<div class="main">
	                    <h2>상품 정보</h2>
	                    <div class="product_wrap">
	                        <div class="pro_img">
	                            <ul>
	                            	<c:forEach items="${files}" varStatus="status" var="file">
		                                <li><img src="/image/${file.file_path}/${file.file_name}" alt="상품 이미지"></li>
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
	                    <br>
	                    
	                    <div class="reply">
                            <h3>댓글 달기</h3>
                            <textarea rows="2" cols="30" id="reply_content" placeholder="로그인 후 이용 가능합니다"></textarea>
                            <br>
                            <c:if test="${not empty loginMember}">
                            	<button id="btn_insert" class="btn btn-primary" >댓글 작성</button>
                            </c:if>
                            <hr>
	                        <h3>댓글 </h3>
	                        <hr>
	                        <div class="reply_wrap">
	                        	<c:forEach items="${reply.list}" var="reply" varStatus="status">
	                        		<c:if test="${reply.depth eq 0}">
			                            <p>${reply.writer}</p>
			                            <p>${reply.content}</p>
			                            <c:if test="${not empty loginMember}">
			                            	<button id="${status.count}" onclick="show_re_reply(this.id)">대댓글달기</button>
			                            </c:if>
			                            <c:if test="${reply.writer eq loginMember.mem_id}">
			                      	      <button  class="re_reply_update" id="${reply.cno}">수정</button>
			                        	  <button  class="re_reply_delete" id="${reply.cno}">삭제</button>
			                            </c:if>
			                            <hr>
			                            <div class="re_reply" id="re_reply${status.count}">
			                                <br>
			                                <p>대댓글</p>
			                                <textarea name="" id="${reply.cno}_text" cols="20" rows="3"></textarea>
			                                <button id="${reply.cno}" onclick="insert_re_reply(this.id)">대댓글 작성</button>
			                              
			                                <hr>
			                            </div>
		                            </c:if>
		                            <c:if test="${reply.depth eq 1}">
		                            	<div class="re_reply_wrap">
		                            		
		                      				<i class="fab fa-replyd"></i><p>${reply.writer}</p>
			                            	<p>${reply.content}</p>
			                            	<div class="btn_re_reply">
			                            		<c:if test="${reply.writer eq loginMember.mem_id}">
				                            		<button id="${reply.cno}" onclick="update_reply(this.id)">수정</button>
				                            		<button id="${reply.cno}" onclick="delete_reply(this.id)">삭제</button>
			                            		</c:if>
			                            	</div>
			                            	<hr>
		                            	</div>
		                            </c:if>
		                            
	                            </c:forEach>
	                            <hr>
	                            
	        
	                     
	                    </div>
	                     <ul class="pagination" id="pagination">
							<li class="disabled">
								<a href="#">
									<span>«</span>
								</a>
							</li>
							<c:forEach begin="1" end ="${reply.totalPageNum}" step="1" varStatus="status">
								<li id="${status.count}">
								<a href="javascript:writeView(${status.count})" >
								${status.count}
								</a>
								</li>
							</c:forEach>
							<li>
								<a href="#">
									<span>»</span>
								</a>
							</li>
						</ul>
	                    

	                    
	        		</div>
	            </div>
	     
	        </div> 
	            
	              <!-- End of Toolbar -->
	    </div>

    <!-- End of Page Wrapper -->
    

	
	<!-- 부트스트랩 js 부분 -->
	<%@include file="../../include/boot-footer.jspf" %>
        <script>
      
            // 원글 수정
            function updateProduct(pno) {
             	var check = confirm("수정하시겠습니까?");
            	if(check) {
            		location.href = "/product/update/?pno="+pno;
            	}
            }
            // 원글 삭제
            function deleteProduct(pno) {
             	var check = confirm("삭제하시겠습니까?");
            	if(check) {
            		location.href = "/product/delete/?pno="+pno;
            	}
            }
            
            // 대댓글 달기 버튼 눌렀을 시 div 보이기
            
            function show_re_reply(id) {
            	
                var div_id = "#re_reply"+id
                console.log(div_id);
                $(div_id).toggle(200);
				
			}
            
            // 댓글 달기 버튼 눌렀을 시
            $('#btn_insert').click(function() {

    	           	 $.ajax({
    	    	         url : "/product/reply/write",
    	    	         type : "post",
    	    	         dataType : 'text',
    	    	         data : {
    	    	             pno : ${product.pno},
    	    		 		 writer : '${loginMember.mem_id}',
    	    		 		 content : $('#reply_content').val(),
    	    		 		 depth : 0 ,
    	    		 		 parent_no : 0
    	    	         },
    	    	         success : function(result) {
    	    	        	 alert("댓글이 작성 되었습니다.");
    	    	        	 writeView(1);
    	    	         },
    	    	         error : function(xhr,status,error) {
    	    	             console.log(error);
    	    	             console.log(xhr);
    	    	             console.log(status);
    	    	         }
    	    	     });
            	 

			});
            
            // 대댓글 달기 버튼 눌렀을 시
            
            function insert_re_reply(id) {
            	
            	 var text_id = "#"+id+"_text";
	           	 $.ajax({
	    	         url : "/product/reply/write",
	    	         type : "post",
	    	         dataType : 'text',
	    	         data : {
	    	             pno : ${product.pno},
	    		 		 writer : '${loginMember.mem_id}',
	    		 		 content : $(text_id).val(),
	    		 		 depth : 1,
	    		 		 parent_no : id
	    	         },
	    	         success : function(result) {
	    	        	 alert("대댓글이 작성 되었습니다.");
	    	        	 writeView(1);
	    	         },
	    	         error : function(xhr,status,error) {
	    	             console.log(error);
	    	             console.log(xhr);
	    	             console.log(status);
	    	         }
	    	     });
			}


            // 댓글 수정
            function update_reply(id) {

				 var text = prompt("수정할 댓글을 입력해주세요");
	           	 $.ajax({
	    	         url : "/product/reply/update",
	    	         type : "post",
	    	         dataType : 'text',
	    	         data : {
						cno : id,
						content : text
	    	         },
	    	         success : function(result) {
	    	        	 alert("댓글이 수정 되었습니다.");
	    	        	 writeView(1);
	    	         },
	    	         error : function(xhr,status,error) {
	    	             console.log(error);
	    	             console.log(xhr);
	    	             console.log(status);
	    	         }
	    	     });
			}
            
            // 댓글 삭제
            function delete_reply(id) {
             	 var del_check = confirm("댓글을 삭제하시겠습니까?");
             	 if(del_check) {
             		 
    	           	 $.ajax({
    	    	         url : "/product/reply/delete",
    	    	         type : "post",
    	    	         dataType : 'text',
    	    	         data : {
    						cno  : id
    	    	         },
    	    	         success : function(result) {
    	    	        	 alert("댓글이 삭제 되었습니다.");
    	    	        	 writeView(1);
    	    	         },
    	    	         error : function(xhr,status,error) {
    	    	             console.log(error);
    	    	             console.log(xhr);
    	    	             console.log(status);
    	    	         }
    	    	     });
             	 }

			}

            
            function writeView(currentPage) {
            	console.log("뷰 뿌리깅!");
            	$('.reply_wrap').html('');
            	$('.pagination').html('');
            	var html1="";
            	var html ="";
            	
	           	 $.ajax({
	    	         url : "/product/reply/get",
	    	         type : "post",
	    	         dataType : 'text',
	    	         data : {
						pno  : ${product.pno} ,
						currentPage : currentPage
	    	         },
	    	         success : function(result) {
	    	        	 var resultJson = JSON.parse(result);
	    	        	 var list = resultJson.list;
	    	        	 var pageNum = resultJson.totalPageNum;
	    	        	 
	    	        	 console.log("리스트 길이 " +list.length);
	    	        	 console.log("리스트 depth" +list[0].depth);
	    	        	 for(var i = 0 ; i< list.length ; i++) {
	    	        		 	
	    	        		 	 if(list[i].depth == 0) {
	    	        		 		 console.log("깊이 0");
		        	        	 	 html += "<p>"+list[i].writer+"</p>"; 
		    	    	        	 html += "<p>"+list[i].content+"</p>";
		    	    	        	 html += "<button id='"+(i+1)+"' onclick='show_re_reply("+(i+1)+")'>대댓글달기</button>"
		    	    	        	 if(list[i].writer == '${loginMember.mem_id}') {
		    	    	        		 html += "<button id='"+list[i].cno+"' onclick='(update_reply("+list[i].cno+"))'>수정</button>" ;
	    	    	    	    	     html += "<button id='"+list[i].cno+"' onclick='(delete_reply("+list[i].cno+"))'>삭제</button>" ;
		    	    	        	 }
		    	    	        	 html += "<hr> <div class='re_reply' id='re_reply"+(i+1)+"'> <br>";
		    	    	        	 html += "<p>대댓글</p>";
		    	    	        	 html += "<textarea id='"+list[i].cno+"_text' cols='20' rows='3'></textarea>";
		    	    	        	 html += "<button id='"+list[i].cno+"' onclick='insert_re_reply("+list[i].cno+")'>대댓글 작성</button>";
		    	    	        	 html += "<hr></div>";
	    	        		 	 }
	    	        		 	 if(list[i].depth == 1) {
	    	        		 		 html += "<div class='re_reply_wrap'>";
	    	    	    	         html += "<i class='fab fa-replyd'></i><p>"+list[i].writer+"</p>";
	    	    	    	      	 html += "<p>"+list[i].content+"</p>";
	    	    	    	      	 html += "<div class='btn_re_reply'>";
	    	    	    	      	 if(list[i].writer == '${loginMember.mem_id}') {
	    	    	    	      	   	 html += "<button id='"+list[i].cno+"' onclick='(update_reply("+list[i].cno+"))'>수정</button>" ;
	    	    	    	    	     html += "<button id='"+list[i].cno+"' onclick='(delete_reply("+list[i].cno+"))'>삭제</button>" ;
	    	    	    	      	 }
    	    	    	  	         html += "</div><hr></div>";
	    	        		 	 }
	    	        		 	 html +="<hr>";

	    
	    	        	 }
	    	        	 
	    	        	 html1 += "<li class='disabled'> <a href='#'> <span>«</span> </a> </li> ";
	    	        	 for(var i =1 ;i<=pageNum ; i++) {
	    	        		 html1 += "<li id='"+i+"'>"; 
	    	        		 html1 += "<a href='javascript:writeView("+i+")' >"+i+"</a></li>";
	    	        	 }
	    	        	 html1 += "<li><a href='#'> <span>»</span> </a> </li> ";
	    	  
	        		 	 console.log("html : "+html);
	        		 	 $('.reply_wrap').html(html);
	        		 	 $('.pagination').html(html1);
	
	    	        	 
	    	         },
	    	         error : function(xhr,status,error) {
	    	             console.log(error);
	    	             console.log(xhr);
	    	             console.log(status);
	    	         }
	    	     });
			}
            
         
            
         
           
        	
        		
            
            
       

        
        </script>
	
		

</body>

</html>