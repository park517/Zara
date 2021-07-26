<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    

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
		#img_preview {
			width: 200px;
			height: 200px;
		}
		
		.board_info label {
            color: gray;
        }

        .board_info a {
            color: lightsalmon;
            text-decoration:none;
            
        }
        .write_wrap {
            margin-top: 200px;
            margin: auto;
            width: 60%;
        }
		</style>
		

<body class="d-flex flex-column h-100">
<section class="py-5 scroll-target">
	    <!-- Page Wrapper -->
	    <div id="wrapper">
	        <!-- Content Wrapper -->
	        <div id="content-wrapper" class="d-flex flex-column">
	
	            <!-- Main Content -->
	            <div id="content">
	               
					<br>
					<br>
					
				    <div class="write_wrap">
				        
				        <strong>${board.category}</strong>
				        
				        <h2 style="margin-top : 10px; margin-bottom : 10px">제목</h2>
				        <div class="board_info">
				            <label>${board.mem_id} | ${board.create_at}</label> |
				            <a href="/board/update?bno=${board.bno}"> 수정 </a> | <a href="/board/delete?bno=${board.bno}"> 삭제 </a>
				       		| 조회수 ${board.hit}
				        </div>
				        <br>
				        <hr>
				        <br>
				        ${board.content}
				
				
				    
	            	
	            	<hr>
	            				
	            		<div> <!-- 댓글 달기 -->
	            			<div class="reply_wrap">
		            			<c:forEach items="${boardReply}" var="getList">
		            				<strong> ${getList.mem_id}  | ${getList.create_at}</strong>  <br><br>
		            				${getList.content}<br><br>
		            				<c:if test="${loginMember.mem_id eq getList.mem_id}">
		            					<div>
		            						<button>대댓글 달기</button>
		            						<button type="button" class="btn_replyUpdate" onclick="update_reply(${getList.cno})">수정</button>
		            						<button type="button" class="btn_replyDelete" onclick="delete_reply(${getList.cno})">삭제</button>
		            					</div>
		            					
		            				</c:if>
		            				<hr>
		            			</c:forEach>
		            			
		            			<br><br>
								<ul class="pagination" id="pagination">
									<li class="disabled">
										<a href="#">
										<span>«</span>
										</a>
									</li>
									<c:forEach begin="1" end ="${totalPageNum}" step="1" varStatus="status">
										<li id="${status.count}">
										<a href="javascript:get_reply(${status.count})" >
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
	            			<c:if test="${not empty loginMember}">
		            			<form id="writeReply" action="/board/detail/writeReply" method="post">
		            				<input type="hidden" name="bno" value="${board.bno}" id="bno">
		            				<input type="hidden" name="mem_id" value="${loginMember.mem_id}" id="mem_id">
		            				
		            				<!-- 로그인 체크 필욯 -->
		            				
		            				<textarea rows = "3" cols = "50" name="content" id="reply_content"></textarea>
		            				
		            				<div id="comment_submit" align="right">
		            					<input type="button" value="전송" id="btn_insertReply" onclick="insert_reply()">
		            				</div>
		            			
		            			</form>
		            		</c:if>

		            	</div>
		            		
		            		<input type="button" value="목록" class ="btn btn-primary" onclick="location.href='getCategoryList?category=와글와글'">
	            		
	            	</div>
	           	</div>
	            </div>
	     
	        </div> 
	            

    <!-- End of Page Wrapper -->
    </section>

	
	<!-- 부트스트랩 js 부분 -->
	<%@include file="../../include/boot-footer.jspf" %>
	<script>
	
	// 댓글 입력
	function insert_reply(){
		
		 $.ajax({
	         url : "/board/detail/writeReply",
	         type : "post",
	         dataType : 'text',
	         data : {
	             bno : $('#bno').val(),
	             mem_id : $('#mem_id').val(),
	             content: $('#reply_content').val(),
	             depth : 0,
	             parent_no : 0
	         },
	         success : function(result) {
	        	 alert("댓글이 입력 되었습니다");
	        	 get_reply(1);
				 
	         },
	         error : function(xhr,status,error) {
	             console.log(error);
	             console.log(xhr);
	             console.log(status);
	         }
	     });
	}
	
	// 댓글 삭제하기
	
	function delete_reply(cno) {
		var is_delete = confirm("정말로 삭제 하시겠습니까?");
		if(is_delete) {
		 $.ajax({
	         url : "/board/detail/deleteReply",
	         type : "post",
	         dataType : 'text',
	         data : {
	             cno : cno
	         },
	         success : function(result) {
				alert("댓글이 삭제되었습니당!");
				get_reply(1);
	         },
	         error : function(xhr,status,error) {
	             console.log(error);
	             console.log(xhr);
	             console.log(status);
	         }
	     });
		}
		else {
			alert("취소되었습니다!");
		}
	}
	
	//댓글 수정 
	
	function update_reply(cno) {
		var change_reply = prompt("수정할 댓글을 입력해주세요");
		if(change_reply != null) {
			 $.ajax({
		         url : "/board/detail/updateReply",
		         type : "post",
		         dataType : 'text',
		         data : {
		             cno : cno ,
		             content : change_reply
		         },
		         success : function(result) {
					alert("댓글이 수정되었습니당!");
					get_reply(1);
		         },
		         error : function(xhr,status,error) {
		             console.log(error);
		             console.log(xhr);
		             console.log(status);
		         }
		     });
			}
			else {
				alert("입력하지 않아서 취소되었습니다!");
			}
		
		
	}	
	
	
	// 댓글 리스트 가져와서 뿌리기
	
	function get_reply(currentPage) {
		
		 $.ajax({
	         url : "/board/detail/listReply",
	         type : "post",
	         dataType : 'text',
	         data : {
	             bno : $('#bno').val() ,
	             pageNum : currentPage
	         },
	         success : function(result) {
	        	 console.log(result);
	        	 $('#reply_content').val('');
	        	 var resultJson = JSON.parse(result);
	        	 var reply_html = '';
	             $('.reply_wrap').html('');
	             for(var i = 0 ; i<resultJson.list.length ; i++) {
	            	 
	 				 reply_html+= "<strong>"+resultJson.list[i].mem_id+" | "+
	 				 resultJson.list[i].create_at+"</strong><br><br>";
	 		
	 				 reply_html+= resultJson.list[i].content+"<br><br>";
					 if( "${loginMember.mem_id}" === resultJson.list[i].mem_id) {
						 reply_html+= "<div>";
						 	reply_html+= "<button>대댓글 달기</button>";
						 	reply_html+= "<button type='button' class='btn_replyUpdate' onclick='update_reply("+resultJson.list[i].cno+")'>수정</button>";
						 	reply_html+= "<button type='button' class='btn_replyDelete' onclick='delete_reply("+resultJson.list[i].cno+")'>삭제</button>";
						 reply_html+= "</div><hr>";
					 }
	             }
					 reply_html+= "<br><br>"
					 reply_html+= "<ul class='pagination' id='pagination'>";
					 reply_html+= "<li class='disabled'><a href='#'><span>«</span></a></li>"
					 for(var i =1 ;i<=${totalPageNum} ; i++) {
						 reply_html+= "<li id='"+i+"'>";
						 reply_html+= "<a href ='javascript:get_reply("+i+")'>"+i;
						 reply_html+= "</a></li>";
					 }
					 reply_html+="<li><a href='#'><span>»</span></a></li></ul>";
	   	
	             $('.reply_wrap').html(reply_html);
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