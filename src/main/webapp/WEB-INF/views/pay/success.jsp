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
.text__message {
    font-size: 54px; /* 글자 크기를 크게 설정 */
    font-weight: bold; /* 글자 굵기를 굵게 설정 */
    color: #000; /* 글자 색상을 검정으로 설정 */
    padding: 10px; /* 패딩을 추가하여 여백을 설정 */
    margin: 0; /* 위아래 여백을 추가 */
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/include/Header.jsp"%>
	<div id="container">
		<div class="box__checkout-title">
			<h2 class="text__main-title">주문완료</h2>
			<ul class="list__location">
				<li class="list-item">장바구니</li>
				<li class="list-item">주문결제</li>
				<li class="list-item list__select">주문완료</li>
			</ul>
		</div>
		<div id="content" class="checkout__wrap">
			<div class="box__contents">
				<div class="section__left">
					<section class="section__checkout-info section__paycase-info">
						<div class="box__inner">
							<h1 class="text__message">결제 완료 되셨습니다🎉</h1>
						</div>
					</section>
				</div>
				<div class="section__right">
					<div class="section__right-inner">
						<div class="section__checkout-info section__payment-info">
							<div class="box__card box__payment-info">
								<div class="box__inner">
									<button type="button" id="goMypage"
										class="button__total-price">마이페이지로</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
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
</html>