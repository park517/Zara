<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


    
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

<body class="d-flex flex-column h-100">
 
 <section class="py-5 bg-light" id="scroll-target">
                <div class="container px-5 my-5">
                    <div class="row gx-5 align-items-center">
                        <div class="col-lg-4">
                        	<img class="img-fluid rounded mb-5 mb-lg-0" src= "../resources/helloZara.jpg"  alt="..." style="max-width:350px"/>
                        </div>
                        <div class="col-lg-8">
                            <h2 class="fw-bolder">About us</h2>
                            <p class="lead fw-normal text-muted mb-0">
								<span style="color:green;">자</span>전거 <span style="color:green;">라</span>이딩을 줄여서 <span style="color:green; font-weight:bold">'자라'</span>라고 이름을 붙였습니다.<br>
	        					자라라는 이름에  걸맞게 <span style="color:green; font-weight:bold">'자라'</span>를 캐릭터로 만들었습니다.<br><br>
	        					수도권과 제주도 여행 시의 추천 코스와 전국 일주의 코스 추천을 위한 코스 추천 게시판이 있습니다.<br><br>
	        					자전거를 중고로 회원들끼리 사고 팔 수 있도록 게시판을 따로 만들어 두었으며 <br>
	        					저희 사이트에서 새 자전거를 구매할 수도 있습니다.<br><br>
	        					또한 커뮤니티가 있어 사람들과 대화를 할 수 있고, 함께 자전거를 탈 동네 친구를 찾을 수 있습니다.<br>
	        					전국에서 열리는 자전거와 관련된 행사를 사이트에서 정리해서 볼 수 있습니다.<br><br>
	        					저희 <span style="color:green; font-weight:bold">'자라'</span>를 이용해 즐거운 자전거 라이프를 즐기실 수 있었으면 좋겠습니다.
							</p>
                        </div>
                    </div>
                </div>
            </section>
    
        <!-- Team members section-->
            <section class="py-5 bg-light">
                <div class="container px-5 my-5">
                    <div class="text-center">
                        <h2 class="fw-bolder">Our team</h2>
                    </div>
                    <div class="row gx-5 row-cols-1 row-cols-sm-2 row-cols-xl-4 justify-content-center">
                        <div class="col mb-5 mb-5 mb-sm-0">
                            <div class="text-center">
                                <img class="img-fluid rounded-circle mb-4 px-4" src="../../resources/kyu.jpg" alt="..." />
                                <h5 class="fw-bolder">ChunGyu Park</h5>
                                <div class="fst-italic text-muted">바보</div>
                            </div>
                        </div>
                        <div class="col mb-5">
                            <div class="text-center">
                                <img class="img-fluid rounded-circle mb-4 px-4" src="../../resources/sungmi.jpg" alt="..." />
                                <h5 class="fw-bolder">SungMi YUN</h5>
                                <div class="fst-italic text-muted">천재</div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            
              <!-- End of Toolbar -->
    </div>
    <!-- End of Page Wrapper -->
	
	<!-- 부트스트랩 js 부분 -->
	<%@include file="../../include/boot-footer.jspf" %>

</body>

</html>