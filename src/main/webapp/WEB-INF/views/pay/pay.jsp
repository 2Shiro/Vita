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
</style>
</head>
<body>
	<%@include file="/WEB-INF/include/Header.jsp"%>
	<div id="container">
		<div class="box__checkout-title">
			<h2 class="text__main-title">주문결제</h2>
			<ul class="list__location">
				<li class="list-item">장바구니</li>
				<li class="list-item list__select">주문결제</li>
				<li class="list-item">주문완료</li>
			</ul>
		</div>
		<div id="content" class="checkout__wrap">
			<div class="box__contents">
				<div class="section__left">
					<div class="section__checkout-info section__delivery-info">
						<div
							class="box__card box__card-address box__card-address--default">
							<div class="box__inner">
								<div class="box__address-title">
									<h3 class="sprite__checkout--before text__title-address home">집</h3>
								</div>
								<div class="box__address-cont box__address--default ">
									<div class="address_name">
										<span class="text__name">이준석</span><span class="text__tel">010-8525-3999</span>
									</div>
									<div class="address_txt">부산광역시 연제구 토현로 10 (주공아파트) 117동
										801호</div>
									<div class="box__form-group">
										<div
											class="box__control-select sprite__checkout--after box__form-control box__form--active">
											<label for="delivery-request2" class="text__label"
												style="color: rgb(0, 0, 0);">직접 입력</label><select
												id="delivery-request" class="form__select js-form__select"><option
													value="0">배송시 요청사항을 선택해 주세요.</option>
												<option value="1">직접 수령하겠습니다.</option>
												<option value="2">배송 전 연락바랍니다.</option>
												<option value="3">부재 시 경비실에 맡겨주세요.</option>
												<option value="4">부재 시 문 앞에 놓아주세요.</option>
												<option value="5">부재 시 택배함에 넣어주세요.</option>
												<option value="6">직접 입력</option></select>
										</div>
										<div class="box__self-input box__text-area"
											style="display: block;">
											<textarea class="input__txt" id="xo_id_shipping_request"
												name="textarea_self" maxlength="50"
												placeholder="최대 50자 입력이 가능합니다.">문 앞에 놓아주세요</textarea>
										</div>
									</div>
									<div class="box__button-group">
										<button id="xo_id_open_address_book" type="button"
											class="button button__modify"
											data-montelena-acode="200007086">배송지 변경</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<section class="section__checkout-info section__paycase-info">
						<div class="section__checkout-info section__order-info">
							<div class="box__card box__order-info">
								<div class="box__inner">
									<div class="text__title">
										주문상품 <span class="text__count"></span>
									</div>
									<div class="box__goods js-goods-space">
										<ul class="list__goods-view">
											<li class="list-item"><h4
													class="sprite__checkout--before text__company-title">
													<a class="link__minishop" href="" target="_blank">제일헬스 사이언스</a>
												</h4>
												<div class="box__goods-info">
													<div class="box__thmb">
														<a class="link__goods"
															href="https://www.pillyze.com/products/19469/%EB%A0%88%EB%93%9C%EB%A6%AC%EB%B2%84%EC%97%B0%EC%A7%88%EC%BA%A1%EC%8A%90"
															target="_blank"><img src="/img/redliver.jpg"
															width="86" height="86" alt="제품사진" class="image__goods"></a>
													</div>
													<div class="box__info ">
														<div class="box__goods-name">
															<a
																href="https://www.pillyze.com/products/19469/%EB%A0%88%EB%93%9C%EB%A6%AC%EB%B2%84%EC%97%B0%EC%A7%88%EC%BA%A1%EC%8A%90"
																class="text__goods-name" target="_blank"><span
																class="text__brand">밀크씨슬</span>제일헬스 사이언스 레드리버 30정</a>
														</div>
														<div class="box__option">
															<p class="text__option">
																<span class="text__option-title"></span>
															</p>
														</div>
														<div class="box__price">
															<span class="text__value">30,000</span><span
																class="text__unit">원</span><span class="text__amount">
																/ 1개</span>
														</div>
													</div>
												</div>
												<div class="box__delivery-charge">
													<span class="text__delivery">배송비</span><span
														class="text__delivery-charge">무료배송</span>
												</div>
											</li>
										</ul>
									</div>
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
												<span class="text__title">상품금액</span><span class="text__num">30000<span
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
												<li class="list-sub-option"><span class="text__title">G마켓할인</span><span
													class="text__num">0<span class="text__unit">원</span></span></li>
											</ul></li>
									</ul>
									<ul class="list__detail-price box__total-price">
										<li class="list-item list__total-price"><div
												class="box__option">
												<span class="text__title">총 결제금액</span><span
													class="text__num">30000<span class="text__unit">원</span></span>
											</div></li>
									</ul>
									<button type="button" onclick="requestPay()"
										class="button__total-price" data-montelena-acode="200007077">결제하기</button>
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
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
IMP.init("imp03323882");
function requestPay(){
	IMP.request_pay(
			  {
			    pg: "uplus.tlgdacomxpay",
			    pay_method: "card",
			    merchant_uid: "order_no_10064224", //상점에서 생성한 고유 주문번호
			    name: "주문명:결제테스트",
			    amount: 1004,
			    buyer_email: "test@portone.io",
			    buyer_name: "구매자이름",
			    buyer_tel: "010-1234-5678",
			    buyer_addr: "서울특별시 강남구 삼성동",
			    buyer_postcode: "123-456",
			    m_redirect_url: "{모바일에서 결제 완료 후 리디렉션 될 URL}",
			    appCard: true, // 설정시 신용카드 결제모듈에서 앱카드 결제만 활성화됩니다.
			  },
			  function (rsp) { // callback
	                if (rsp.success) {
	                    console.log(rsp);
	                } else {
	                    console.log(rsp);
	                }
	            }
			);
}
</script>
</html>