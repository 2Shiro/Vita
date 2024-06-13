<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/start.css" rel="stylesheet" />
<link href="/css/header.css" rel="stylesheet" />
<link rel="stylesheet" href="/css/pay/app.css" />
<link rel="stylesheet" href="/css/pay/common.css" />
<style>
#container {
	width: 100%;
	height: 100%;
	margin-top: 130px;
}

.landing .section1 {
	position: relative;
	width: 1240px;
	height: 920px;
	margin: 150px auto 0;
	padding-top: 45px;
}

.landing .section1.ui-ani-appear .txt {
	transform: translateX(0);
	opacity: 1;
}

.landing .section1 .txt {
	transform: translateX(50px);
	opacity: 0;
	transition: all 400ms 600ms ease-out;
}

.landing .section1 .txt {
	font-weight: 700;
	font-size: 50px;
	line-height: 70px;
	color: #2c2c2c;
}

.landing .section1 .img {
	position: absolute;
	top: 269px;
	width: 1240px;
	border-radius: 32px;
	overflow: hidden;
}

.landing img {
	width: 100%;
}

.landing .section1.ui-ani-appear .img2 {
	transform: translateX(0);
	opacity: 1;
}

.landing .section1 .img2 {
	transform: translateX(50px);
	opacity: 0;
	transition: all 800ms;
}

.landing .section1 .img2 {
	position: absolute;
	width: 1240px;
	top: 0;
}

.checkbox__goods {
    position: absolute;
    right: 10px;
    top: 50%;
    transform: translateY(-50%);
    width: 24px; /* 너비 조절 */
    height: 24px; /* 높이 조절 */
}

/* 입력 상자의 기본 스타일 조정 */
.item-count {
    width: 30px; /* 입력 상자의 너비를 조정 */
    text-align: center; /* 텍스트 중앙 정렬 */
}

.button-group {
    display: flex;
    align-items: center;
}
.button-group button {
    width: 30px;
    height: 30px;
    text-align: center;
    vertical-align: middle;
    line-height: 1;
    margin: 0 5px;
    cursor: pointer;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/include/Header.jsp"%>
	<div id="container">
		<div class="box__checkout-title">
			<h2 class="text__main-title">장바구니</h2>
			<ul class="list__location">
				<li class="list-item list__select">장바구니</li>
				<li class="list-item">주문결제</li>
				<li class="list-item">주문완료</li>
			</ul>
		</div>
		<form action="/Pay/PayForm" method="POST">
			<div id="content" class="checkout__wrap">
				<div class="box__contents">
					<div class="section__left">
						<section class="section__checkout-info section__paycase-info">
							<div class="section__checkout-info section__order-info">
								<div class="box__card box__order-info">
									<div class="box__inner">
										<div class="text__title">
											주문상품 <span class="text__count"></span>
										</div>
										<%-- 총합을 저장할 변수를 선언합니다. --%>
										<c:set var="totalPrice" value="0" />
										<c:forEach var="basketPageList" items="${basketPageList}">
											<%-- 각 항목의 가격을 계산합니다. --%>
											<c:set var="prodPrice" value="${basketPageList.price * basketPageList.count}" />
											<%-- 계산된 가격을 총합 변수에 더합니다. --%>
											<c:set var="totalPrice" value="${totalPrice + prodPrice}" />
											<div class="box__goods js-goods-space">
												<ul class="list__goods-view">
													<li class="list-item">
														<br>
														<div class="box__goods-info">
															<div class="box__thmb">
																<a class="link__goods"
																	href="https://www.pillyze.com/products/19469/%EB%A0%88%EB%93%9C%EB%A6%AC%EB%B2%84%EC%97%B0%EC%A7%88%EC%BA%A1%EC%8A%90"
																	target="_blank"><img src="${basketPageList.img}"
																	width="86" height="86" alt="제품사진" class="image__goods"></a>
															</div>
															<div class="box__info ">
																<div class="box__goods-name">
																	<a
																		href="https://www.pillyze.com/products/19469/%EB%A0%88%EB%93%9C%EB%A6%AC%EB%B2%84%EC%97%B0%EC%A7%88%EC%BA%A1%EC%8A%90"
																		class="text__goods-name" target="_blank">${basketPageList.pname}</a>
																</div>
																<div class="box__option">
																	<p class="text__option">
																		<span class="text__option-make">${basketPageList.mname}</span>
																	</p>
																</div>
																<div class="box__price">
																	<span class="text__value text__num" data-price="${prodPrice}"></span>
																	<span class="text__unit">원 / </span><span class="text__amount">
																		<span class="button-group">
																			<input type="number" class="item-count" value="${basketPageList.count}" min="1">개
																			<button class="increment">+</button>
																			<button class="decrement">-</button>
																		</span>
																	</span>
																</div>
																<input type="checkbox" class="checkbox__goods" style="width: 36px; height: 36px;">
															</div>
														</div>
														<div class="box__delivery-charge">
															<span class="text__delivery">배송비</span>
															<span class="text__delivery-charge" >
																<c:choose>
																	<c:when test="${basketPageList.delivery_charge == 0}">
																		무료배송
																	</c:when>
																	<c:otherwise>
																		<span class="text__num" data-price="${basketPageList.delivery_charge}"></span>
																	</c:otherwise>
																</c:choose>
															</span>
														</div>
													</li>
												</ul>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</section>
					</div>
					<div class="section__right">
						<div class="section__right-inner">
							<div class="section__checkout-info section__payment-info">
								<div class="box__card box__payment-info">
									<div class="box__inner">
										<ul class="list__detail-price">
											<li class="list-item"><div class="box__option">
													<span class="text__title">상품금액</span><span class="text__num" data-price="${totalPrice}"><span
														class="text__unit">원</span></span>
												</div></li>
											<li class="list-item list-discount"><div
													class="box__option">
													<button type="button" class="button__pay-option"
														aria-expanded="false" data-montelena-acode="200007074">
														<span class="text__title sprite__checkout--after">할인금액</span><span
															class="text__num">0<span class="text__unit">원</span></span>
													</button>
												</div>
												<ul class="box__sub-option">
													<li class="list-sub-option"><span class="text__title">쿠폰할인</span><span
														class="text__num">0<span class="text__unit">원</span></span></li>
												</ul></li>
										</ul>
										<ul class="list__detail-price box__total-price">
											<li class="list-item list__total-price"><div
													class="box__option">
													<span class="text__title">총 결제금액</span>
													<span class="text__num" data-price="${totalPrice}"><span class="text__unit">원</span></span>
												</div></li>
										</ul>
										<button type="submit"
											class="button__total-price">결제하기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
<script src="/js/header.js"></script>
<script>
function getCookie(name) {
	var value = "; " + document.cookie;
	var parts = value.split("; " + name + "=");
	if (parts.length === 2) return parts.pop().split(";").shift();
}

	// Extract cookies
	var accessCookie = getCookie("access");
	var refreshCookie = getCookie("refresh");
	var userIdCookie = getCookie("userId");
	
	// Store tokens and userId in local storage
	localStorage.setItem("access_token", accessCookie);
	localStorage.setItem("refresh_token", refreshCookie);
	localStorage.setItem("user_id", userIdCookie);
	
	// Verify the stored values
	console.log("Access token saved: " + localStorage.getItem("access_token"));
	console.log("Refresh token saved: " + localStorage.getItem("refresh_token"));
	console.log("User ID saved: " + localStorage.getItem("user_id"));
</script>
<script>
	// 3자리 수마다 ,
    // 모든 .text__num 요소들을 선택
    const priceElements = document.querySelectorAll('.text__num');

    priceElements.forEach(priceElement => {
        // 각 요소의 data-total-price 속성 값을 가져옴
        const price = priceElement.getAttribute('data-price');

        // totalPrice 값을 포맷
        const formattedPrice = Number(price).toLocaleString('ko-KR');

        // 포맷된 값을 HTML에 삽입
        priceElement.textContent = formattedPrice;
    });
</script>
<script>
	// 아이템 개수 입력 상자와 버튼에 이벤트 리스너 추가
	document.querySelectorAll('.button-group').forEach(group => {
	    const input = group.querySelector('.item-count');
	    const incrementButton = group.querySelector('.increment');
	    const decrementButton = group.querySelector('.decrement');
	
	    incrementButton.addEventListener('click', (event) => {
	        event.preventDefault(); // 기본 동작을 막음
	        let currentValue = parseInt(input.value, 10);
	        input.value = currentValue + 1;
	        console.log(`새로운 개수: ${input.value}`);
	    });
	
	    decrementButton.addEventListener('click', (event) => {
	        event.preventDefault(); // 기본 동작을 막음
	        let currentValue = parseInt(input.value, 10);
	        if (currentValue > parseInt(input.min, 10)) {
	            input.value = currentValue - 1;
	            console.log(`새로운 개수: ${input.value}`);
	        }
	    });
	
	    input.addEventListener('input', (event) => {
	        const newValue = event.target.value;
	        console.log(`새로운 개수: ${newValue}`);
	    });
	});
</script>
</html>