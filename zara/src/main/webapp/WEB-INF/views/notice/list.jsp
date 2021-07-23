<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

    <!--  부트 스트랩 부분 -->
	<%@include file="../../include/boot-head.jspf" %>
	<style type="text/css">
	
	
		.main {
			margin-left : 50px;
			width: 100%;
			height: 80%;
		}
		#logo {
			width: 100px;
			height: 60px;
		}
		
		.btn-user {
			margin-left : 850px;
			width: 500px;
		}
		
		.notice_table {
			margin-top : 50px;
			text-align: center;
			width: 50%;
		}
		#banner {
			margin-top : 40px;
			margin-bottom : 40px;
		}
		thead {
			background-color: #212529; 
			color: white;
		}
		#btn_write_notice {
			background-color: gray;
		}
		.btn-danger,.btn-primary {
			width:100px;
			height : 30px;
			font-size : 12px;
		}
		
	</style>

<body class="d-flex flex-column h-100">

    <!-- Page Wrapper -->
    <div id="wrapper">
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
            	
        		<div class="main">

        			
        			<h2 id="banner">Zara 공지사항</h2>
        			<c:if test="${loginMember.mem_type == 1}">
        				<button onclick="location.href='/notice/write'" id="btn_write_notice" class ="btn btn-secondary">공지사항 작성하기</button>
        			</c:if>
        			<br>
        			<br>
        			<table class="table table-hover">
        				<thead>
        					<th width="10%">글번호</th>
        					<th width="20%">제목</th>
        					<th width="20%">작성일</th>
        					<th width="20%">수정일자</th>
        					<th width="10%">조회수</th>
        					<c:if test="${loginMember.mem_type == 1}">
        						<th width="20%">기능</th>
        					</c:if>
        				</thead>
        				
        				<tbody>
        					<c:forEach items="${list}" var="list">
        					<tr>
        						<td>${list.nno}</td>
        						<td><storg><a href='/notice/detail?nno=${list.nno}'>${list.title}</a></storg></td>
        						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.create_at}"/></td>
        						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.update_at}"/></td>
        						<td>${list.hit}</td>
        						<c:if test="${loginMember.mem_type == 1}">
	        		        		<td>
	        							<button onclick="update_notice(this.id)" id="${list.nno}" class ="btn btn-primary">수정하기</button>
	        							<button onclick="delete_notice(this.id)" id="${list.nno}" class ="btn btn-danger">삭제하기</button>
	        						</td>
        						</c:if>
        					</tr>
        					</c:forEach>
        				</tbody>

        			</table>
        		
        		
        		
        		
        		
        		</div>
        		
        		<div style="text-align:center">${pagingHtml}</div>
           
            </div>
     
        </div> 
            
              <!-- End of Toolbar -->
    </div>
    <!-- End of Page Wrapper -->
	
	<!-- 부트스트랩 js 부분 -->
	<%@include file="../../include/boot-footer.jspf" %>
	<script>
	
		function delete_notice(id) {
			
			var check = confirm("삭제하시겠습니까?");
			
			if(check) {
				location.href="/notice/delete/"+id;
			}
		}
		
		function update_notice(id) {
			
			var check = confirm("수정하시겠습니까?");
			
			if(check) {
				location.href="/notice/update?nno="+id;
			}
		}
	
	
	</script>
</body>

</html>