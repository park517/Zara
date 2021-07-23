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
			margin : auto;
			width: 60%;
			height: 80%;
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
        		
				    <div class="write_wrap">
				        
				        <h2 style="margin-top : 10px; margin-bottom : 10px">${notice.title}</h2>
				        <div class="board_info">
				            <label><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.create_at}"/></label> 
				       		| 조회수 ${notice.hit}
				        </div>
				        <br>
				        <hr>
				        <br>
				        ${notice.contents}
				
					</div>
					
					<button onclick="location.href='/notice/list'" class = "btn btn-primary">목록보기</button>
        		
    
        		
        		</div>
        		
           
            </div>
     
        </div> 
            
              <!-- End of Toolbar -->
    </div>
    <!-- End of Page Wrapper -->
	
	<!-- 부트스트랩 js 부분 -->
	<%@include file="../../include/boot-footer.jspf" %>

</body>

</html>