<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        			<h2>공지사항</h2>
        			
        			<table class="notice_table">
        				<thead>
        					<th>글번호</th>
        					<th>제목</th>
        					<th>작성일</th>
        					<th>조회수</th>
        				</thead>
        				
        				<tbody>
        					<tr>
        						<td>1</td>
        						<td>공지사항1</td>
        						<td>2021-05-23</td>
        						<td>0</td>
        					</tr>
        				
        				
        				
        				</tbody>

        			</table>
        		
        		
        		
        		
        		
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