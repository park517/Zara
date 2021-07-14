<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">   

<%@include file="../../WEB-INF/include/boot-head.jspf" %>
        <main class="flex-shrink-0">
          <!-- 배너-->
            <header class="bg-dark py-5">
                <div class="container px-5">
                    <div class="row gx-5 align-items-center justify-content-center">
                        <div class="col-lg-8 col-xl-7 col-xxl-6">
                            <div class="my-5 text-center text-xl-start">
                                <h1 class="display-5 fw-bolder text-white mb-2">자전거로 떠나는 여행</h1>
                                <p class="lead fw-normal text-white-50 mb-4">어디로갈까용ㅇ</p>
                                <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                                    <a class="btn btn-primary btn-lg px-4 me-sm-3" href="/course/getCategoryList?cos_category=1">Riding Course</a>
                                    <a class="btn btn-outline-light btn-lg px-4" href="/product/getlist">Buy bicycle</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center">
                        	<img src="../../resources/ride-banner.jpg" style="max-width:100%" alt="..." />
                        </div>
                    </div>
                </div>
            </header>
            <!-- 공지사항-->
            <section class="py-5" id="features">
                <div class="container px-5 my-5">
                    <div class="row gx-5">
                        <div class="col-lg-4 mb-5 mb-lg-0"><h2 class="fw-bolder mb-0"><a href="/product/getlist">공지사항</a></h2></div>
                        <div class="col-lg-8">
                            <div class="row gx-5 row-cols-1 row-cols-md-2">
                            <c:forEach items="${productList}" var="list" varStatus="status">
                            	<div class="col mb-5 h-100">
                            	
                                    <h2 class="h5"><a href="/product/detail?pno=${list.pno}">${list.pro_name}</a></h2>
                                 
                                    <p class="mb-0"><fmt:formatDate pattern="yyyy-MM-dd" value="${list.pro_date}" /></p>
                                </div>
							</c:forEach>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            
             <!-- 커뮤니티-->
            <section class="py-5" id="features">
                <div class="container px-5 my-5">
                    <div class="row gx-5">
                        <div class="col-lg-4 mb-5 mb-lg-0"><h2 class="fw-bolder mb-0"><a href="/board/getlist">커뮤니티</a></h2></div>
                        <div class="col-lg-8">
                            <div class="row gx-5 row-cols-1 row-cols-md-2">
                            <c:forEach items="${boardList}" var="list" varStatus="status">
                            	<div class="col mb-5 h-100">
                                    <h2 class="h5"><a href="/board/detail?pno=${list.bno}">${list.title}</a></h2>
                                    <p class="mb-0">${list.create_at}</p>
                                </div>
							</c:forEach>
							</div>
                        </div>
                    </div>
                </div>
            </section>
            
                     
            <!-- 판매상품-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-8 col-xl-6">
                            <div class="text-center">
                                <h2 class="fw-bolder">추천상품</h2>
                                <p class="lead fw-normal text-muted mb-5">조회수가 가장 높은 자전거들.....</p>
                            </div>
                        </div>
                    </div>
                    <div class="row gx-5">
                    <c:forEach items="${productList}" var="list" varStatus="status">
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="https://dummyimage.com/600x350/ced4da/6c757d" alt="..." />
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">News</div>
                                    <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">Blog post title</h5></a>
                                    <p class="card-text mb-0">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                                            <div class="small">
                                                <div class="fw-bold">Kelly Rowan</div>
                                                <div class="text-muted">March 12, 2021 &middot; 6 min read</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
        </main>
    </body>


<%@include file="../../WEB-INF/include/boot-footer.jspf" %>
</body>


</html>