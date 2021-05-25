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
	<%@include file="../include/boot-head.jspf" %>
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
		
		.recommend_banner {
			margin : 0px;
            width: 80%;
            height: 55%;
            background-color: blue;
            display: flex;
            align-items: center;
        }

        .slide {

            width: 90%;
            height: 80%;
            background-color: turquoise;
            margin: auto;
            
        }
        .board_wrap {
			margin : 0px;
            width: 80%;
            height: 55%;
            background-color: blueviolet;
            display: flex;
            flex-direction: row;
            justify-content: space-around;
            align-items: center;
        }

        .notice {
            padding: 5px;
            width: 30%;
            height: 70%;
            background-color: white;
        }

        .ride {
            padding: 5px;
            width: 30%;
            height: 70%;
            background-color: white;
        }
        .talk {
            padding: 5px;
            width: 30%;
            height: 70%;
            background-color: white;
        }

        .top {
        	margin-top : 10px;
        	margin-left : 10px;
            display: flex;
            align-items: center;
            width: 100%;

        }
        .top a {
       		 margin-left: auto;
       		 margin-right: 20px;
        	
        }
		
	</style>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
		<%@include file="../include/sidemenu.jspf" %>
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
                <!-- Toolbar -->
				<%@include file="../include/toolbar.jspf" %>
            	
        		<div class="main">
			        <div class="recommend_banner">
			
			            <div class="slide">
			                
			            </div>
			
			        </div>
			        
			        <div class="board_wrap">
			
			            <div class="notice">
			                
			                <div class="top">
			                    <h2> 공지사항 </h2>
			                    <a href="#">더보기</a>
			                </div>
			
			                <div class="list">
			                    <table>
			                        <thead>
			                            <th>순번</th>
			                            <th>제목</th>
			                            <th>등록일</th>
			                        </thead>
			
			                        <tbody>
			                            <tr>
			                                <td>1</td>
			                                <td>테스트</td>
			                                <td>2021-05-17</td>
			                            </tr>
			
			                            <tr>
			                                <td>2</td>
			                                <td>테스트</td>
			                                <td>2021-05-17</td>
			                            </tr>
			                        </tbody>
			                    </table>
			                </div>
			            </div>
			
			            <div class="ride">
			
			                <div class="top">
			                    <h2> 자전거 </h2>
			                    <a href="#">더보기</a>
			                </div>
			
			                <div class="list">
			                    <table>
			                        <thead>
			                            <th>순번</th>
			                            <th>제목</th>
			                            <th>등록일</th>
			                        </thead>
			
			                        <tbody>
			                            <tr>
			                                <td>1</td>
			                                <td>테스트</td>
			                                <td>2021-05-17</td>
			                            </tr>
			
			                            <tr>
			                                <td>2</td>
			                                <td>테스트</td>
			                                <td>2021-05-17</td>
			                            </tr>
			                        </tbody>
			                    </table>
			                </div>
			
			
			            </div>
			            <div class="talk">
			
			                <div class="top">
			                    <h2> 와글와글 </h2>
			                    <a href="#">더보기</a>
			                </div>
			
			                <div class="list">
			                    <table>
			                        <thead>
			                            <th>순번</th>
			                            <th>제목</th>
			                            <th>등록일</th>
			                        </thead>
			
			                        <tbody>
			                            <tr>
			                                <td>1</td>
			                                <td>테스트</td>
			                                <td>2021-05-17</td>
			                            </tr>
			
			                            <tr>
			                                <td>2</td>
			                                <td>테스트</td>
			                                <td>2021-05-17</td>
			                            </tr>
			                        </tbody>
			                    </table>
			                </div>
			            </div>
			        </div>
			    </div>
           
            </div>
     
        </div> 
            
              <!-- End of Toolbar -->
    </div>
    <!-- End of Page Wrapper -->
	
	<!-- 부트스트랩 js 부분 -->
	<%@include file="../include/boot-footer.jspf" %>

</body>

</html>