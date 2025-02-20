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
<link href="/css/reviews.css" rel="stylesheet" />
</head>
<body>

	<div id="header"><%@include file="/WEB-INF/include/Header.jsp"%></div>

	<!-- 헤더 밑 상단바 -->
	<div class="navbar">
		<span><a href="/Detail?pro_id=${pro_id}&nowpage=1">
					<img id="prodImg" src="img/${ prod.image }.jpg" alt="prodImg" style="height : 80px; width : 80px;"><span id="link">${ prod.name }</span></a></span>
		<span><button id="addToCart" class="btn btn-outline-dark btn-lg" type="button" data-bs-toggle="offcanvas"
									data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">장바구니에 담기</button></span>
					<input type="hidden" name="id" id="id" value="${id}">
					<input type="hidden" name="pro_id" id="pro_id" value="${prod.pro_id}">
					<input type="hidden" name="state" id="state" value="1"> 
					<input type="hidden" name="price" id="price" value="${prod.pro_price}"> 
					<input type="hidden" name="delivery_charge" id="delivery_charge" value="">
					<input type="hidden" name="count" id="count" value="1">
	</div>
	
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
				
				<!-- 평점 별 리뷰 가져오기 -->	
								<div id="right-section">
						<!-- 검색 form -->
							<form class="d-flex justify-content-end mt-3" role="search"  id="search"
										action="/reviews?nowpage=1&pro_id=${pro_id}" method="POST">
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
<!-- 			<div class="rating-filter"> -->
<!-- 		        <h3>평가순</h3> -->
<%-- 		        <input type="hidden" id="pro_id" value="${pro_id}"> --%>
<!-- 		        <div class="rating-item"> -->
<!-- 		            <input type="radio" name="ratings" value="5"> ★★★★★ -->
<%-- 		            <span class="count">${star5}</span> --%>
<!-- 		        </div> -->
<!-- 		        <div class="rating-item"> -->
<!-- 		            <input type="radio" name="ratings" value="4"> ★★★★☆ -->
<%-- 		            <span class="count">${star4}</span> --%>
<!-- 		        </div> -->
<!-- 		        <div class="rating-item"> -->
<!-- 		            <input type="radio" name="ratings" value="3"> ★★★☆☆ -->
<%-- 		            <span class="count">${star3}</span> --%>
<!-- 		        </div> -->
<!-- 		        <div class="rating-item"> -->
<!-- 		            <input type="radio" name="ratings" value="2"> ★★☆☆☆ -->
<%-- 		            <span class="count">${star2}</span> --%>
<!-- 		        </div> -->
<!-- 		        <div class="rating-item"> -->
<!-- 		            <input type="radio" name="ratings" value="1"> ★☆☆☆☆ -->
<%-- 		            <span class="count">${star1}</span> --%>
<!-- 		        </div> -->
<!-- 		    </div> -->
<!-- 		    <div class="review-list"></div> -->
<!-- 		</div>	 -->
				

				<!-- 사람들 리뷰 시작 -->
					 <div class="reviewList">
						<h1 style="text-align: center; margin:20px;">가장 많은 추천을 받은 리뷰</h1>
						<div class="review-card">
			        <div class="review-header">
			            <img src="/img/사람.png" alt="User Image">
			            <div class="username">id : ${ best.nick }</div>
			            <div class="stats">${ best.created }</div>
			        </div>
			        <div class="review-body">
								<input type="hidden" class="starscore" data-rev-rating="${best.rating}">
								<div id="starRating2" class="stars">
									<div class="star"></div>
									<div class="star"></div>
									<div class="star"></div>
									<div class="star"></div>
									<div class="star"></div>
								</div>
			           <div class="content"> ${ best.content }</div>
			        </div>
			        <img class="image" src="img/${best.img}.jsp"alt="Product Image">
			        <div class="review-footer">
			        		<div class="notice">
											<button type="button" class="like-button" data-rev-id="${best.rev_id}" data-id="">
												<ion-icon name="thumbs-up"></ion-icon> <span class="like-count"></span>
											</button>
											<span class="like-status"></span>
			            </div>
			            <div class="actions">
											<span class="notify-button-container" >
												<button type="button" class="notify-button" data-rev-id="${best.rev_id}" data-id=""
													class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo"
													style="text-align: right;">신고하기</button>
										 </span>
			              <button id="shareButton">공유하기 <ion-icon name="share-social-outline"></ion-icon></button>										</div>
			            </div>
			        </div> 
					   
	  <!-- 리뷰리스트 -->
		<div id="reviews">
		<h1 style="text-align: center; margin:20px;">구매 고객님들의 생생한 후기</h1>
		 <c:forEach var="re" items="${ response.list }">			
			<div class="review-card">
        <div class="review-header">
            <img src="/img/사람.png" alt="User Image">
            <div class="username">id : ${ re.nick }</div>
            <div class="stats">${ re.created }</div>
        </div>
        <div class="review-body">
					<input type="hidden" class="starscore" data-rev-rating="${re.rating}">
					<div id="starRating2" class="stars">
						<div class="star"></div>
						<div class="star"></div>
						<div class="star"></div>
						<div class="star"></div>
						<div class="star"></div>
					</div>
           <div class="content"> ${ re.content }</div>
        </div>
        <img class="image" src="img/${re.img}.jsp"alt="Product Image">
        <div class="review-footer">
        		<div class="notice">
								<button type="button" class="like-button" data-rev-id="${re.rev_id}" data-id="">
									<ion-icon name="thumbs-up"></ion-icon> <span class="like-count"></span>
								</button>
								<span class="like-status"></span>
            </div>
            <div class="actions">
								<span class="notify-button-container" >
									<button type="button" class="notify-button" data-rev-id="${re.rev_id}" data-id=""
										class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo"
										style="text-align: right;">신고하기</button>
							 </span>
              <button>공유하기</button>
							</div>
            </div>
        </div>
        </br>
    </c:forEach>
   </div>
				<div class="d-flex justify-content-center paging-bottom-container">
					<%@include file="/WEB-INF/pagination/reviewPaging.jsp"%>
				</div>
			</div>
			
			
    <script src="/js/header.js"></script>     				
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
   <script>
   document.addEventListener('DOMContentLoaded', function() {
          const shareButton = document.getElementById('shareButton');
   
          shareButton.addEventListener('click', function() {
              if (navigator.share) {
                  navigator.share({
                      title: 'My Website',
                      text: 'Check out this awesome page!',
                      url: window.location.href
                  }).then(() => {
                      console.log('Thanks for sharing!');
                  }).catch(console.error);
              } else {
                  alert('Sharing is not supported in your browser.');
              }
          });
      });
   </script> 
   <script src="share.js"></script>
	<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>