<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        
        .mem_info ul {
        	margin-top : 30px;
        	list-style: none;
        }
        
        .mem_info li {
         	margin-bottom: 15px;
         }
        .mem_info label {
        	width: 150px;
        	margin-right: 10px;
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
	     				<div class="mem_info">
	     				
	     					<ul>
	     						<li>	<h1>회원정보</h1> </li>
	     						<li><label>아이디</label>${loginMember.mem_id}</li>
	     						<li><label>이름</label>${loginMember.mem_name}</li>
	     						<li><label>연락처</label>${loginMember.mem_tel}</li>
	     						<li><label>이메일</label>${loginMember.mem_email}</li>
	     						<li><label>포인트</label>${loginMember.mem_point}</li>
	     						<li><label>가입일</label>${loginMember.create_at}</li>
	     						<li><label>최근로그인 일자</label>${loginMember.last_login}</li>
	     						<li>
	     							<div class="btn_group">
	     								<button id="btn_write" type="button" class="btn btn-info" 
	     								onclick="location.href='/user/getProdutList/${loginMember.mem_id}'" 
	     								>내가 쓴 글 </button>
	     								<button type="button" class="btn btn-info" onclick="location.href='/user/checkPassword?job=update'" >정보수정</button>
	     								<button id="btn_delete" type="button" class="btn btn-danger">탈퇴</button>
	     							</div>
	     						</li>
	     					</ul>
	     				</div>
	            </div>
	     
	        </div> 
	    </div>
    </c:if>
    
    <c:if test="${empty loginMember}">
		<%@include file="../../include/noLogin.jspf" %>
    </c:if>
    <!-- End of Page Wrapper -->
	
	<!-- 부트스트랩 js 부분 -->
	<%@include file="../../include/boot-footer.jspf" %>
	<script >
	// 
		var btn_delete = document.getElementById('btn_delete');
		btn_delete.addEventListener('click', function(){
			location.href= '/user/writeList';
		});
		
		</script>
</body>

</html>