<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reviews</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<link href="/css/header.css" rel="stylesheet" />
<style>
ul, li{
	list-style: none;
}
    body {
        font-family: Arial, sans-serif;
/*         background-color: #f4f4f4; */
        background-color: white;
        margin-top: 0;
        padding: 0;
    }
    #header{
    		background-color: white;
    		position: fixed;
				top: 0;
				z-index: 5;
    }
		.navbar {
		    background-color: white;
		    position: sticky;
		    top: 100px; 
		    width: 100%;
		    height : 120px;
		    z-index: 999;
		    box-shadow: 0 10px 10px rgba(0, 0, 0, 0.1);
		    padding : 0 10% 0 10%;
		    font-size: 20px;
		}
		#search {
			magin : 10px;
		}
    .review-container {
        width: 90%;
        margin : 0 auto; 
        background: #fff;
        padding: 120px 20px 20px 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        display: flex;
   			justify-content: space-between;
    }
	 #left-section {
	    flex: 1;
	    padding: 20px;
	} 
	#right-section{
	    flex: 2.5;
	    padding: 20px;	
	}
    .review {
        border-bottom: 1px solid #ddd;
        padding: 20px 0;
    }
    .review:last-child {
        border-bottom: none;
    }
    .review-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
    .review-header .star-rating {
        display: flex;
        align-items: center;
    }
    .reviewTable{
    		width : 100%;
    }
/* 별 평점 구현 */
.rating-container {
	background: white;
	padding: 20px;
	border-radius: 8px;
/* 	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); */
	display: flex;
/* 	width: 600px; */
	margin-bottom: 20px;
	margin-top: 20px;
	text-align: center;
}

.left-section {
	text-align: center;
	margin-right: 20px;
	flex: 1;
}

.average-score {
	font-size: 18px;
	color: #666;
}

.total-reviews {
	font-size: 12px;
	color: #999;
}

.right-section {
	flex: 1.5;
}

.rating {
	display: flex;
	align-items: center;
	margin-bottom: 10px;
}

.rating-label {
	width: 40px;
	font-size: 12px;
}

.bar-container {
	display: flex;
	align-items: center;
	flex: 1;
	z-index: 1;
}

.bar {
	flex: 1;
	height: 10px;
	background: #e0e0e0;
	border-radius: 5px;
	margin: 0 10px;
	position: relative;
}

.filled-bar {
	height: 100%;
	background: #4CAF50;
	border-radius: 5px;
}

.percentage {
	width: 50px;
	font-size: 12px;
	text-align: right;
}

.review-count {
	font-size: 10px;
	color: #666;
	margin-left: 5px;
}
    
/* 평균 별 */
.starContainer {
	width : 100%;
	display: flex;
	align-items: center;
	justify-content : center;
}

.avgStar {
	width: 24px;
	height: 24px;
	background-color: lightgray;
	clip-path: polygon(50% 0%, 61% 35%, 98% 35%, 68% 57%, 79% 91%, 50% 70%, 21% 91%,
		32% 57%, 2% 35%, 39% 35%);
	margin-right: 4px;
	position: relative;
}

.avgStar.full {
	background-color: gold;
}

.avgStar .fill {
	background-color: gold;
	height: 100%;
	position: absolute;
	top: 0;
	left: 0;
}
/* 리뷰 당 별*/
.stars {
	display: flex;
	align-items: center;
}

.star {
	width: 24px;
	height: 24px;
	background-color: lightgray;
	clip-path: polygon(50% 0%, 61% 35%, 98% 35%, 68% 57%, 79% 91%, 50% 70%, 21% 91%,
		32% 57%, 2% 35%, 39% 35%);
	margin-right: 4px;
}

.star.full {
	background-color: gold;
}
/**/

		/* Review  styling */
		.reviewTable {
		    width: 100%;
		    border-collapse: collapse;
		    margin-bottom: 20px;
		}

    .review-body {
        margin-top: 10px;
        color: #666;
    }
    .review-footer {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-top: 10px;
    }
    .review-footer .review-date {
        font-size: 12px;
        color: #999;
    }
    .review-footer .review-actions {
        display: flex;
        align-items: center;
    }
    .review-actions button {
        background: none;
        border: none;
        color: #666;
        cursor: pointer;
        margin-right: 10px;
        font-size: 14px;
    }
    .review-actions button:hover {
        color: #000;
    }
    /* 페이징 */
    .pagination {
        display: flex;
        justify-content: center;
        padding: 20px 0;
    }
    .pagination a {
        color: #666;
        text-decoration: none;
        padding: 10px 15px;
        border: 1px solid #ddd;
        margin: 0 5px;
        border-radius: 5px;
    }
    .pagination a:hover {
        background-color: #f2f2f2;
    }
.like-button {
	background-color: white;
	border: none;
	color: grey;
}

.like-button.liked {
	color: #ED7802;
}

.notify-button {
	background-color: white;
	border: none;
}

.button-container {
	width: 100%;
	display: flex;
	align-items: center;
}

.button-container button {
	margin: 0 10px;
}

.notify-button-container {
	margin-left: auto;
}

textarea {
	height: 150px;
	font-size: 12px;
}

select, select option {
	font-size: 12px;
}

.modal-footer {
	display: flex;
	justify-content: center;
	align-items: center; 
	button { width : 150px;
					height: 35px;
					}
	}
	
.modal-title {
	text-align: center;
	width: 100%;
}
/*offcanvas*/
#offcanvasRightLabel {
	font-size: 22px;
	padding: 12px;
	z-index: 9999;
	table {
			width: 100%;
			display: flex;
			flex-direction: column;
			justify-content: space-between;
			height: 85%;
			}
}

.offcanvas-header {
	border-bottom: 1px solid #e9ecef;
}

.offcanvas-body {
	padding: 20px;
	button{margin-top:10px;}
	}


.offcanvas-body table td{ padding :5px;}
	
#goCart {
	width: 100%;
	height: 50px;
	vertical-align: bottom;
}

a {
	color: black;
	text-decoration-line: none;
}

a:hover {
	text-decoration-line: underline;
}

td>img {
	width: 120px;
	height: 130px;
}

.unfill {
	color: grey;
}

.fill {
	color: red;
}

/* 장바구니 추천상품 별*/
.recoContainer {
	display: flex;
	align-items: center;
}

.recoStar {
	width: 24px;
	height: 24px;
	background-color: lightgray;
	clip-path: polygon(50% 0%, 61% 35%, 98% 35%, 68% 57%, 79% 91%, 50% 70%, 21% 91%, 32% 57%, 2% 35%, 39% 35%);
	margin-right: 4px;
	position: relative;
}

.recoStar.full {
	background-color: gold;0 10px 10px rgba(0, 0, 0, 0.1);
}

.recoStar .fill {
	background-color: gold;
	height: 100%;
	position: absolute;
	top: 0;
	left: 0;
}   
/*검색*/
#search{
	margin : 20px;
	height : 36px;
} 
.reviewList{
	
}
.bestReview {
	width : 100%;
	height : 150px;
	border-collapse: collapse;
	border : none;
	border-radius: 10px;
  border-style: hidden;
/*   box-shadow: 0 0 0 1px #000; */

  padding : 10px;
  background-color : oldlace;
  margin-bottom: 30px;
}
  tr {
		  margin : 10%;
  		padding : 10px;
  }
}
</style>
</head>
<body>

	<div id="header"><%@include file="/WEB-INF/include/Header.jsp"%></div>

	<!-- 헤더 밑 상단바 -->
	<div class="navbar">
		<span><a href="/Detail?pro_id=${pro_id}&nowpage=1">
					<img id="prodImg" src="img/${ prod.img }.jpg" alt="prodImg" style="height : 80px; width : 80px;"><span id="link">${ prod.name }</span></a></span>
		<span><button id="addToCart" class="btn btn-outline-dark btn-lg" type="button" data-bs-toggle="offcanvas"
									data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">장바구니에 담기</button></span>
					<input type="hidden" name="id" id="id" value="${id}">
					<input type="hidden" name="pro_id" id="pro_id" value="${prod.pro_id}">
					<input type="hidden" name="state" id="state" value="1"> 
					<input type="hidden" name="price" id="price" value="${prod.pro_price}"> 
					<input type="hidden" name="delivery_charge" id="delivery_charge" value="">
					<input type="hidden" name="count" id="count" value="1">
	</div>
	
		<!-- offcanvas -->
		<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
			<div class="offcanvas-header">
				<h5 id="offcanvasRightLabel"></h5>
				<button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div>
			<div class="offcanvas-body">
				<div>함께 보시면 좋은 상품</div>
				<table>
					<c:forEach var="reco" items="${prodList}">
						<tr>
							<input type="hidden" id="prodList_id" value="${reco.pro_id }">
							<td rowspan="3"><img src="img/${ reco.img }.jpg"></td>
							<td><a href="/Detail?pro_id=${reco.pro_id}&nowpage=1">${ reco.name }</a></td>
						</tr>
						<tr>
							<td>가격 ${ reco.price }</td>
						</tr>
						<tr>
							<td><input type="hidden" class="recoAvg"
								data-reco-rating="${ reco.avg_rating }"> <span>
									<div id="recostars" class="recoContainer">
										<div class="recoStar"></div>
										<div class="recoStar"></div>
										<div class="recoStar"></div>
										<div class="recoStar"></div>
										<div class="recoStar"></div>
									</div>
							</span> ${ reco.avg_rating }, (${ reco.review_count }건)
								<button type="button" id="wishButton"
									style="border: none; background-color: white;">
									<ion-icon name="heart"></ion-icon>
								</button></td>
						</tr>
					</c:forEach>
				</table>
				<div>
					<button id="goCart" type="button"
						onclick="location.href='/Pay/Basket'">장바구니로 가기</button>
				</div>
			</div>
		</div>
		<!-- offcanvas 끝 -->		
			
	<div class="review-container">	
		<!-- 평점 -->
			<div id="left-section">
				<div class="rating-container">
					<div class="left-section">
						<div class="average-score">구매만족도</div>
						<div id="num" style="font-size: 50px;">${avgstar}</div>
						<input type="hidden" id="avgStar" value="${avgstar}">
						<div id="starRating2" class="starContainer">
							<div class="avgStar"></div>
							<div class="avgStar"></div>
							<div class="avgStar"></div>
							<div class="avgStar"></div>
							<div class="avgStar"></div>
						</div>
						<div style="font-size: 12px;">(구매후기 ${ recount }건 기준)</div>
					</div>
					</div>
					<!-- 막대바 -->
					<div class="right-section">
						<div class="rating">
							<div class="rating-label">5점</div>
							<div class="bar-container">
								<div class="bar">
									<div class="filled-bar" style="width: ${five}%;"></div>
								</div>
								<div class="percentage">${five}%</div>
							</div>
						</div>
						<div class="rating">
							<div class="rating-label">4점</div>
							<div class="bar-container">
								<div class="bar">
									<div class="filled-bar" style="width: ${four}%;"></div>
								</div>
								<div class="percentage">${four}%</div>
							</div>
						</div>
						<div class="rating">
							<div class="rating-label">3점</div>
							<div class="bar-container">
								<div class="bar">
									<div class="filled-bar" style="width:${three}%;"></div>
								</div>
								<div class="percentage">${three}%</div>
							</div>
						</div>
						<div class="rating">
							<div class="rating-label">2점</div>
							<div class="bar-container">
								<div class="bar">
									<div class="filled-bar" style="width: ${two}%;"></div>
								</div>
								<div class="percentage">${two}%</div>
							</div>
						</div>
						<div class="rating">
							<div class="rating-label">1점</div>
							<div class="bar-container">
								<div class="bar">
									<div class="filled-bar" style="width: ${one}%;"></div>
								</div>
								<div class="percentage">${one}%</div>
							</div>
						</div>
					</div>
				<!-- 막대바 끝 -->		
				</div>	
				<!-- 사람들 리뷰 시작 -->
				<div id="right-section">
						<!-- 검색 form -->
							<form class="d-flex justify-content-end mt-3" role="search"  id="search"
										action="/QnA?nowpage=1&pro_id=${pro_id}" method="POST">
								<c:choose>
									<c:when test="${keyword eq 'none'}">
										<input class="form-control me-2" style="width: 300px;" type="search"
														placeholder="문의하신 내용을 입력해주세요." aria-label="Search" id="keyword" name="keyword">
									</c:when>
									<c:otherwise>
										<input class="form-control me-2" style="width: 300px;" type="search"
														placeholder="문의하신 내용을 입력해주세요." aria-label="Search" id="keyword" name="keyword" value="${keyword}">
									</c:otherwise>
								</c:choose>
								<button class="btn btn-outline-secondary" style="width: 110px; margin-right: 9px;" type="submit">검색</button>
							</form>
					 <!-- 검색 끝 -->
					 <div class="reviewList">
						<table class="bestReview">
							<tr><td colspan="2">    </td></tr>
								<tr><td colspan="2" style="text-align:center; font-size:15px;"><div>가장 많은 추천을 받은 리뷰</div></td></tr>
								<tr>
									<td>id : ${ best.nick }</td>
									<td style="text-align: right; margin-right:15px;">${ best.created }</td>
								</tr>
								<tr>
									<td colspan="2"><input type="hidden" class="starscore"
										data-rev-rating="${best.rating}">
										<div id="starRating2" class="stars">
											<div class="star"></div>
											<div class="star"></div>
											<div class="star"></div>
											<div class="star"></div>
											<div class="star"></div>
										</div></td>
								</tr>
								<tr>
									<td colspan="2">${ best.content }</td>
								</tr>
								<tr>
									<td>${ best.img }</td>
								</tr>
								<tr>
									<!-- 리뷰 추천 버튼 -->
									<td>
										<div class="button-container">
											<button type="button" class="like-button" data-rev-id="${best.rev_id}" data-id="" style="background-color:oldlace;">
												<ion-icon name="thumbs-up"></ion-icon>
												<span class="like-count"></span>
											</button>
											<span class="like-status"></span>
											<!-- 리뷰 추천 버튼 끝 -->
										</div>
									</td>
									<td style="text-align: right; margin-right:15px;">
										<!-- 리뷰 신고 버튼 -->
										<span class="notify-button-container" >
											<button type="button" class="notify-button" data-rev-id="${best.rev_id}" data-id="" style="background-color:oldlace;"
												class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo"
												style="text-align: center;">신고하기</button>
									 </span>
									 <!-- 리뷰 신고 버튼 끝 -->
									 <!-- 리뷰 신고창 -->
										<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content" style="text-align: left;">
													<div class="modal-header">
														<h1 class="modal-title fs-5" id="exampleModalLabel">신고하기</h1>
														<button type="button" class="btn-close"	data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<form>
															<div class="mb-3">
																<label for="recipient-name" class="col-form-label">신고이유</label>
																<div>
																	<select name="noti_type" id="noti_type">
																		<option value="1">욕설/비방</option>
																		<option value="2">광고/홍보성</option>
																		<option value="3">게시글 도배</option>
																		<option value="4">음란성</option>
																		<option value="5">개인정보 유출</option>
																		<option value="6">반사회성 행위</option>
																		<option value="7">관계없는 사진</option>
																		<option value="8">기타</option>
																	</select>
																</div>
															</div>
															<div class="mb-3">
																<label for="message-text" class="col-form-label">신고
																	메세지</label>
																<textarea class="form-control" id="message-text"
																	name="noti_reason" placeholder="작성해주세요"
																	style="font-size: 13px;"></textarea>
															</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">닫기</button>
														<button type="button" class="btn btn-primary"
															id="notifyBtn">신고하기</button>
													</div>
													</form>
												</div>
											 </div>
											</div>
											<!-- 리뷰 신고창 끝 -->
										</div>
									</td>
								</tr>
								<tr><td colspan="2"></td></tr>
						</table>
					 </div>  
					   
					 <!-- 리뷰리스트 -->
					<div id="reviews">
						<table class="reviewTable">
							<c:forEach var="re" items="${ response.list }">
								<tr>
									<td>id : ${ re.nick }</td>
									<td style="text-align: right; margin-right:15px;">${ re.created }</td>
								</tr>
								<tr>
									<td colspan="2"><input type="hidden" class="starscore"
										data-rev-rating="${re.rating}">
										<div id="starRating2" class="stars">
											<div class="star"></div>
											<div class="star"></div>
											<div class="star"></div>
											<div class="star"></div>
											<div class="star"></div>
										</div></td>
								</tr>
								<tr>
									<td colspan="2">${ re.content }</td>
								</tr>
								<tr>
									<td>${ re.img }</td>
								</tr>
								<tr style="border-bottom: 1px solid #ccc;">
									<!-- 리뷰 추천 버튼 -->
									<td>
										<div class="button-container">
											<button type="button" class="like-button"
												data-rev-id="${re.rev_id}" data-id="">
												<ion-icon name="thumbs-up"></ion-icon>
												<span class="like-count"></span>
											</button>
											<span class="like-status"></span>
											<!-- 리뷰 추천 버튼 끝 -->
										</div>
									</td>
									<td style="text-align: right; margin-right:15px;">
										<!-- 리뷰 신고 버튼 -->
										<span class="notify-button-container" >
											<button type="button" class="notify-button" data-rev-id="${re.rev_id}" data-id=""
												class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo"
												style="text-align: center;">신고하기</button>
									 </span>
									 <!-- 리뷰 신고 버튼 끝 -->
									 <!-- 리뷰 신고창 -->
										<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content" style="text-align: left;">
													<div class="modal-header">
														<h1 class="modal-title fs-5" id="exampleModalLabel">신고하기</h1>
														<button type="button" class="btn-close"	data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<form>
															<div class="mb-3">
																<label for="recipient-name" class="col-form-label">신고이유</label>
																<div>
																	<select name="noti_type" id="noti_type">
																		<option value="1">욕설/비방</option>
																		<option value="2">광고/홍보성</option>
																		<option value="3">게시글 도배</option>
																		<option value="4">음란성</option>
																		<option value="5">개인정보 유출</option>
																		<option value="6">반사회성 행위</option>
																		<option value="7">관계없는 사진</option>
																		<option value="8">기타</option>
																	</select>
																</div>
															</div>
															<div class="mb-3">
																<label for="message-text" class="col-form-label">신고
																	메세지</label>
																<textarea class="form-control" id="message-text"
																	name="noti_reason" placeholder="작성해주세요"
																	style="font-size: 13px;"></textarea>
															</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">닫기</button>
														<button type="button" class="btn btn-primary"
															id="notifyBtn">신고하기</button>
													</div>
													</form>
												</div>
											 </div>
											</div>
											<!-- 리뷰 신고창 끝 -->
										</div>
									</td>
								</tr>
							</c:forEach>
						</table>
				<div class="d-flex justify-content-center paging-bottom-container">
					<%@include file="/WEB-INF/pagination/reviewPaging.jsp"%>
				</div>
			</div>
          				
		<!-- 리뷰 추천 -->
		<script>
		document.addEventListener('DOMContentLoaded', function() {
	    document.querySelectorAll('.like-button').forEach(function(button) {
	        // 해당 리뷰의 rev_id 가져오기
	        let rev_id = button.getAttribute('data-rev-id');
	        let requestData = {
	            rev_id: rev_id
	        };
	        
	        let requestJSON = JSON.stringify(requestData);
	
	        // 서버로 POST 요청 보내기
	        fetch('/checkThumb', {
	            method: 'POST',
	            headers: {
	                'Content-Type': 'application/json'
	            },
	            body: requestJSON
	        })
	        .then(response => response.json())
	        .then(data => {
	            // 처리 결과에 따른 동작
	            if (data.state === 'liked') {
	                button.classList.add('liked');
	                button.nextElementSibling.textContent = '추천했어요';
	            } else if (data.state === 'not') {
	                button.classList.remove('liked');
	            }            
	            let likeCount = button.parentElement.querySelector('.like-count');
	            likeCount.textContent = data.thumb;
	        })
	        .catch(error => {
	            console.error('Error:', error);
	        });
	    });
	
	    document.querySelectorAll('.like-button').forEach(function(button) {
	        button.addEventListener('click', function() {
	            // 해당 리뷰의 rev_id 가져오기
	            let rev_id = button.getAttribute('data-rev-id');
	            let requestData = {
	                rev_id: rev_id
	            };
	
	            // 서버로 POST 요청 보내기
	            fetch('/thumb', {
	                method: 'POST',
	                headers: {
	                    'Content-Type': 'application/json'
	                },
	                body: JSON.stringify(requestData)
	            })
	            .then(response => response.json())
	            .then(data => {
	                // 처리 결과에 따른 동작
	                if (data.current === 'added') {
	                    button.classList.add('liked'); // 추천된 상태를 나타내는 CSS 클래스 추가
	                    button.nextElementSibling.textContent = '추천했어요';
	                    alert('리뷰를 추천해요!');
	                } else if (data.current === 'removed') {
	                    button.classList.remove('liked'); // 추천이 취소된 상태를 나타내는 CSS 클래스 제거
	                    button.nextElementSibling.textContent = '';
	                    alert('리뷰 추천이 취소되었어요!');
	                }
		            let likeCount = button.parentElement.querySelector('.like-count');
		            likeCount.textContent = data.thumb;
	            })
	            .catch(error => {
	                console.error('Error:', error);
	            });
	        });
	    });
	});
	</script>

		<!-- 리뷰 신고 버튼 -->
		<script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function() {
        	
        	 let rev_id = null;  // 전역 변수로 선언
        	
            // 리뷰 신고 버튼 클릭 시 rev_id와 id 저장
            document.querySelectorAll('.notify-button').forEach(function(button) {
                button.addEventListener('click', function() {
                   let rev_id = button.getAttribute('data-rev-id');
                   
                   // 모달 내 신고하기 버튼 클릭 시 데이터 전송
                   document.getElementById('notifyBtn').addEventListener('click', function() {
                       const noti_type = document.getElementById('noti_type').value;
                       const noti_reason = document.getElementById('message-text').value;
                       console.log('신고이유:', noti_type);
                       console.log('신고 메시지:', noti_reason);

                       let requestData = {
                           rev_id: rev_id,
                           noti_type: noti_type,
                           noti_reason: noti_reason
                       };
                       
                       let datdJSON = JSON.stringify(requestData);

                       fetch('/notify', {
                           method: 'POST',
                           headers: {
                               'Content-Type': 'application/json'
                           },
                           body: datdJSON
                       })
                       .then(response => response.json())
                       .then(data => {
                           console.log('Success:', data);
                           alert("신고해주셔서 감사합니다. 더 좋은 서비스를 만들기 위해 노력하겠습니다.")
                           var myModalEl = document.getElementById('exampleModal');
                           var modal = bootstrap.Modal.getInstance(myModalEl); 
                           modal.hide();
                       })
                       .catch(error => {
                           console.error('Error:', error);
                       });
                   });
                });
            });
        });
    </script>

		<!-- 리뷰 당  별 -->
		<script>
    document.addEventListener('DOMContentLoaded', function() {
        // 모든 리뷰를 처리
        document.querySelectorAll('.starscore').forEach(starScoreElement => {
            // 데이터 속성에서 별점 값 가져오기
            const rating = parseFloat(starScoreElement.getAttribute('data-rev-rating'));
            
            const fullStars = Math.floor(rating);
            
            // 현재 리뷰의 별 요소들 가져오기
            const stars = starScoreElement.nextElementSibling.querySelectorAll('.star');
            
            // 별 채우기
            stars.forEach((star, index) => {
                if (index < fullStars) {
                    star.classList.add('full');
                }
            });
        });
    });
    </script>
    </script>
  <!-- 장바구니에 담기 -->
  <script type="text/javascript">
  document.addEventListener("DOMContentLoaded", () => {
	  let addToCartButton = document.querySelector("#addToCart");
	  let id = parseInt(document.querySelector("#id").value);
	  let pro_id = parseInt(document.querySelector("#pro_id").value);
	  let count = parseInt(document.querySelector("#count").value);

	  let delivery_charge = parseInt(document.querySelector("#delivery_charge").value);
	  
	   
	  console.log("데이터:", { id, pro_id, count, price, delivery_charge });
	  
  
    });
  </script>

	
   
  <!-- 평균 별 -->
	<script>
   document.addEventListener('DOMContentLoaded', function() {
		
      const avgstar = parseFloat(document.querySelector('#avgStar').value);

      // 정수 부분과 소수 부분 계산
      const fullStars = Math.floor(avgstar);
      const partialStar = avgstar - fullStars;
      const percentage = Math.round(partialStar * 100)
      
      // 현재 리뷰의 별 요소들 가져오기
      const stars = document.querySelectorAll('#starRating2 .avgStar');
      
      // 별 채우기
       stars.forEach((avgstar, index) => {
          if (index < fullStars) {
          	avgstar.classList.add('full');
          } else if (index == fullStars) {
          	avgstar.innerHTML = '<div class="fill" style="width: ' +  percentage + '%;"></div>';
          }
       });
   });
   </script>
   
	<!-- 장바구니 추천에서 위시리스트에 추가 -->
	
	<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>