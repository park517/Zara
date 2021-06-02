<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>게시판</title>
    
    
    <!--  부트 스트랩 부분 -->
   <%@include file="../../include/boot-head.jspf" %>
   <style type="text/css">
   
      #logo {
         width: 100px;
         height: 60px;
      }
      
      .btn-user {
         margin-left : 900px;
         width: 300px;
      }
      
      #boardMain{
         width: 90%;
         margin: 0 auto;
         padding-top: 5%;
         padding-bottom: 5%;
      }
      .table > thead { 
         background-color: #55bcfc; 
         color: white;
      } 
      
      .table > thead > tr > th { 
         text-align: center; 
      }
      
      .table > tbody { 
         text-align: center; 
      }
      
      #btnWrite, #btnSearch{
         background-color: #55bcfc; 
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
               <div id="boardMain">
                  <h2>전체게시판!</h2>
                  <br><br><br>
                	
               	  <c:if test="${not empty loginMember}">
                     <div align="right">
                           <button  id="btnWrite" class ="btn btn-primary" onclick="location.href='write'"> 글쓰기</button>
                     </div>
                  </c:if>
                  <c:if test="${total == 0}">
                     <div style="text-align: center">
                        등록된 게시물이 없습니다.
                     </div>
                  </c:if>
                  <c:if test="${total > 0}">
                        
                     <div> 
                        <table class="table"> 
                           <thead> 
                              <tr> 
                                 <th width="10%">번호</th> 
                                 <th width="20%">카테고리</th> 
                                 <th width="40%">제목</th> 
                                 <th width="10%">작성자</th> 
                                 <th width="20%">작성일</th> 
                                 <th width="10%">조회</th>
                               </tr> 
                           </thead> 
                           <tbody> 
                              <c:forEach var="board" items="${list}" varStatus="status"> 
                              <tr> 
                                 <td>${board.bno}</td> 
                                 <td>${board.category}</td> 
                                 <td id="title"><a href="detail?bno=${board.bno}">   ${board.title} </a></td> 
                                 <td>${board.mem_id}</td> 
                                 <td>${board.create_at}</td> 
                                 <td>${board.hit}</td> 
                              <tr> 
                              </c:forEach> 
                           </tbody> 
                        </table> 
                        <div align="center">
                           <select class="selectpicker" name="type">
                               <option value="" selected="selected">분류를 선택해주세요</option>
                            <option value="title">제목</option>
                            <option value="mem_id">작성자</option>
                           </select>
                        <input type="text" class="" name="keyword" id="search">
                        <button class="btn btn-primary" name="btnSearch" id="btnSearch">검색</button>
                     </div>
   
                        
                        <!-- Paging 처리 --> 
                        <div style="text-align:center">${pagingHtml}</div>
                        
                     </div>
                  </c:if>
                     
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