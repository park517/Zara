<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
         margin-left : 900px;
         width: 300px;
      }
      
      #btnWrite {
      	margin-bottom: 10px;
      	background-color: gray;
      }
      #boardMain{
         width: 90%;
         margin: 0 auto;
         padding-top: 5%;
         padding-bottom: 5%;
      }
      .table > thead { 
         background-color: #212529; 
         color: white;
      } 
      
      .table > thead > tr > th { 
         text-align: center; 
      }
      
      .table > tbody { 
         text-align: center; 
      }
      
      #btnWrite, #btnSearch{
         background-color: gray; 
      }

      
   </style>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
               <div id="boardMain">
                <center><h2 style="font-weight: bold">안타시는 자전거를 팔아보세요!</h2></center>
                  <br><br>
                
               	  <c:if test="${not empty loginMember}">
                     <div align="right">
                           <button  id="btnWrite" class ="btn btn-primary" onclick="location.href='/product/new'">판매 글 작성</button>
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
                                 <th width="20%">자전거 종류</th> 
                                 <th width="30%">제목</th> 
                                 <th width="10%">작성자</th> 
                                 <th width="20%">작성일</th> 
                                 <th width="20%">조회수</th>
                               </tr> 
                           </thead> 
                           <tbody> 
                              <c:forEach var="product" items="${list}" varStatus="status"> 
                              <tr> 
                                 <td>${product.pno}</td> 
                                 <td>${product.pro_category}</td> 
                                 <td id="title"><a href="/product/detail?pno=${product.pno}">   ${product.pro_name} </a></td> 
                                 <td>${product.mem_id}</td> 
                                 <td><fmt:formatDate pattern="yyyy-MM-dd" value="${product.pro_date}" /></td> 
                                 <td>${product.pro_hit}</td> 
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