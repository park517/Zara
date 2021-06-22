<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Zara</title>


<!--  부트 스트랩 부분 -->
<%@include file="../include/boot-head.jspf"%>
<style type="text/css">
.main {
	margin-left: 50px;
	width: 100%;
	height: 80%;
}

#logo {
	width: 100px;
	height: 60px;
}

.btn-user {
	margin-left: 850px;
	width: 500px;
}

.recommend_banner {
	margin: 0px;
	width: 80%;
	height: 55%;
	display: flex;
	align-items: center;
}

.slide {
	width: 90%;
	height: 80%;
	margin: auto;
}

.board_wrap {
	margin: 0px;
	width: 80%;
	height: 55%;
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
	margin-top: 10px;
	margin-left: 10px;
	display: flex;
	align-items: center;
	width: 100%;
}

.top a {
	margin-left: auto;
	margin-right: 20px;
}
.swiper-container {
		width:90%;
		height:350px;
		border:5px solid silver;
		border-radius:7px;
	}
	.swiper-slide {
		text-align:center;
		display:flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
		align-items:center; /* 위아래 기준 중앙정렬 */
		justify-content:center; /* 좌우 기준 중앙정렬 */
	}
	.swiper-slide img {
		box-shadow:0 0 5px #555;
	}
	.guide{
		margin:0 auto;
	}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>



</head>


<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">
		<%@include file="../include/sidemenu.jspf"%>
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<!-- Toolbar -->
				<%@include file="../include/toolbar.jspf"%>

				<div class="main">
				
					<!-- 메인 배너 -->
					<div class="recommend_banner">

					<div class="swiper-container">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
                         		<a href="/course/getList">
									<img src="../../resources/ride-banner.jpg" style="max-width:100%">
								</a>
							</div>
							<div class="swiper-slide">
								<a href="/course/getCategoryList?cos_category=1">	
									<img src="../../resources/seoul-banner.jpg" style="max-width:100%">
                        		</a>
							</div>
							<div class="swiper-slide">
								<a href="/course/getCategoryList?cos_category=2">
									<img src="../../resources/jeju-banner.jpg" style="max-width:100%">
                        		</a>
							</div>
							<div class="swiper-slide">
								<a href="/course/getCategoryList?cos_category=3">
									<img src="../../resources/all-banner.jpg" style="max-width:100%">
                        		</a>
							</div>
				
						</div>
			
						<!-- 네비게이션 -->
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
					</div>

					</div>

						<br><br><br>
					<div class="board_wrap">
	
	
						<!-- 공지사항 -->
						<div class="notice">

							<div class="top">
								<h2>공지사항</h2>
								<a href="/notice">더보기</a>
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
						
						<br><br><br>
						<!-- 자전거 중고 -->
						<div class="ride">

							<div class="top">
								<h2>자전거 판매</h2>
								<a href="/product/getlist">더보기</a>
							</div>

							<div class="list">
								<table>
									<thead>
										<th>순번</th>
										<th>제목</th>
										<th>등록일</th>
									</thead>

									<tbody>
										<c:forEach items="${productList}" var="list"
											varStatus="status">
											<tr>
												<td>${status.count}</td>
												<td>${list.pro_name}</td>
												<td>${list.pro_date}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>


						</div>
						<br><br><br>
						<!-- 커뮤니티 -->
						<div class="talk">

							<div class="top">
								<h2>커뮤니티 게시판</h2>
								<a href="/board/getlist">더보기</a>
							</div>

							<div class="list">
								<table>
									<thead>
										<th>순번</th>
										<th>제목</th>
										<th>등록일</th>
									</thead>

									<tbody>
										<c:forEach items="${boardList}" var="list" varStatus="status">
											<tr>
												<td>${status.count}</td>
												<td>${list.title}</td>
												<td>${list.create_at}</td>
											</tr>
										</c:forEach>
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
	<%@include file="../include/boot-footer.jspf"%>
<script>
$(document).ready(function(){
	new Swiper('.swiper-container', {
		loop:true,
		navigation : {
			nextEl : '.swiper-button-next', // 다음 버튼 클래스명
			prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
		},
	})
})
	

</script>
</body>

</html>