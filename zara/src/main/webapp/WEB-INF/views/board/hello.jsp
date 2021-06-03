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
			
			width: 90%;
        	 margin: 0 auto;
        	 padding-top: 5%;
         	padding-bottom: 5%;
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
		.hello_table{
			margin : 100px auto;
			
		}
		#hello_box{
			margin : 0 auto;
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
            <div id="content" >
                <!-- Toolbar -->
				<%@include file="../../include/toolbar.jspf" %>
            	<div class="main">
        		<h3>HELLO WORLD!</h3>
        		
        			<table id="hello_table" class="hello_box">
        			<tr>
        				<td>
        					<img src = "../resources/helloZara.jpg"  style="max-width:350px">
        				</td>
        				<td>
        					<span style="color:blue;">자</span>전거 <span style="color:blue;">라</span>이딩을 줄여서 <span style="color:blue; font-weight:bold">'자라'</span>라고 이름을 붙였습니다.<br>
        					자라라는 이름에  걸맞게 <span style="color:blue; font-weight:bold">'자라'</span>를 캐릭터로 만들었습니다.<br><br>
        					수도권과 제주도 여행 시의 추천 코스와 전국 일주의 코스 추천을 위한 코스 추천 게시판이 있습니다.<br><br>
        					자전거를 중고로 회원들끼리 사고 팔 수 있도록 게시판을 따로 만들어 두었으며 <br>
        					저희 사이트에서 새 자전거를 구매할 수도 있습니다.<br><br>
        					또한 커뮤니티가 있어 사람들과 대화를 할 수 있고, 함께 자전거를 탈 동네 친구를 찾을 수 있습니다.<br>
        					전국에서 열리는 자전거와 관련된 행사를 사이트에서 정리해서 볼 수 있습니다.<br><br>
        					저희 <span style="color:blue; font-weight:bold">'자라'</span>를 이용해 즐거운 자전거 라이프를 즐기실 수 있었으면 좋겠습니다.
        				</td>
        			</tr>
        		
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