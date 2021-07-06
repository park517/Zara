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
		</style>
		

<body id="page-top">
	    <!-- Page Wrapper -->
	    <div id="wrapper">
	        <!-- Content Wrapper -->
	        <div id="content-wrapper" class="d-flex flex-column">
	
	            <!-- Main Content -->
	            <div id="content">
	                <!-- Toolbar -->
					<%@include file="../../include/toolbar.jspf" %>
					
					
	            	<div id="boardMain">
	            		<h2>글 상세 보기</h2>
	            		<br><br><br>
	            		<c:if test="${loginMember.mem_id eq board.mem_id}">
		            		<input type="button" value="수정" class ="btn btn-primary" onclick="location.href='update?bno=${board.bno}'" >
		            		<input type="button" value="삭제" class ="btn btn-primary" id="delete_btn">
	            		</c:if>
	            		<!-- 글 정보 입력 -->
	            		<ul>
	            			<li>작성자 : ${board.mem_id}</li>
	            			<li>카테고리 : ${board.category }</li>
	            			<li>제목 : ${board.title }</li>
	            			<li>작성일 : ${board.create_at}</li>
	            			<li>
	            				첨부 파일
	            				<c:forEach items="${fileList}" var="fileList" varStatus="stats">
	            					<br>
	            					<a href="/file/down/${fileList.no}/${stats.index}/board">${fileList.file_real_name}</a>
	            				</c:forEach>
	            				<br>
	            				사진 미리보기(1개만 대표로)
	            				<br>
	            				<img id="img_preview" alt="대표사진" src="/resources/upload//board/${fileList[0].file_name}">
	            			</li>
	            		</ul>
	            		<hr>
	            		<div>
	            			내용 : <br>
	            			${board.content}
	            		</div>
	            		<hr>
	            				
	            		<div> <!-- 댓글 달기 -->
	            			<div class="reply_wrap">
		            			댓글 : <br>
		            			<c:forEach items="${boardReply}" var="getList">
		            				<li>
		            					<div>
		            						<p>${getList.mem_id} / ${getList.create_at}</p>
		            						<p>${getList.content}</p>
		            					</div>
		            				</li>
		            				<c:if test="${loginMember.mem_id eq getList.mem_id}">
		            					<button type="button" class="btn_replyUpdate" onclick="update_reply(${getList.cno})">수정</button>
		            					<button type="button" class="btn_replyDelete" onclick="delete_reply(${getList.cno})">삭제</button>
		            				</c:if>
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
	            
	              <!-- End of Toolbar -->
	    </div>

    <!-- End of Page Wrapper -->
    

	
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
	             content: $('#reply_content').val()
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
	             reply_html+= "댓글 : <br>";
	             for(var i = 0 ; i<resultJson.list.length ; i++) {
	            	 
	 				 reply_html+= "<li>";
	 				 reply_html+= "<div>";
	 				 reply_html+= "<p>"+resultJson.list[i].mem_id+"/"+
	 				 resultJson.list[i].create_at+"</p>";
	 				 reply_html+= "<p>"+resultJson.list[i].content+"</p>";
	 				 reply_html+= "</div>"; 
	 				 reply_html+= "</li>"; 
					 if( "${loginMember.mem_id}" === resultJson.list[i].mem_id) {
						 reply_html+= "<button type='button' class='btn_replyUpdate' onclick='update_reply("+resultJson.list[i].cno+")'>수정</button>";
						 reply_html+= "<button type='button' class='btn_replyDelete' onclick='delete_reply("+resultJson.list[i].cno+")'>삭제</button>";
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