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
<link rel="stylesheet" href="/css/pay/boxlayer.css" />
<link rel="stylesheet" href="/css/pay/common.css" />
<!-- Font Awesome 포함 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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

.box__sub-option {
	display: none;
}

.box__self-input {
	display: none;
}

.box__layer {
	display: none;
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
									<h3 class="sprite__checkout--before text__title-address">집</h3>
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
											<label for="delivery-request" class="text__label"
												id="delivery-label" style="color: rgb(0, 0, 0);">배송시
												요청사항을 선택해 주세요.</label> <select id="delivery-request"
												class="form__select js-form__select">
												<option value="0">배송시 요청사항을 선택해 주세요.</option>
												<option value="1">직접 수령하겠습니다.</option>
												<option value="2">배송 전 연락바랍니다.</option>
												<option value="3">부재 시 경비실에 맡겨주세요.</option>
												<option value="4">부재 시 문 앞에 놓아주세요.</option>
												<option value="5">부재 시 택배함에 넣어주세요.</option>
												<option value="6">직접 입력</option>
											</select>
										</div>
										<div class="box__self-input box__text-area"
											style="display: none;">
											<textarea class="input__txt" id="xo_id_shipping_request"
												name="textarea_self" maxlength="50"
												placeholder="최대 50자 입력이 가능합니다."></textarea>
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
									<%-- 총합을 저장할 변수를 선언합니다. --%>
									<c:set var="totalPrice" value="0" />
									<c:forEach var="payPageList" items="${payPageList}"
										varStatus="status">
										<input type="hidden" id="basket_id_${status.index}"
											value="${payPageList.basket_id}">
										<%-- 각 항목의 가격을 계산합니다. --%>
										<c:set var="prodPrice"
											value="${payPageList.price * payPageList.count}" />
										<%-- 계산된 가격을 총합 변수에 더합니다. --%>
										<c:set var="totalPrice"
											value="${totalPrice + prodPrice + payPageList.delivery_charge}" />
										<div class="box__goods js-goods-space"
											data-index="${status.index}">
											<ul class="list__goods-view">
												<li class="list-item"><br>
													<div class="box__goods-info">
														<div class="box__thmb">
															<a class="link__goods" href="https://${payPageList.url}"
																target="_blank"><img
																src="/img/${payPageList.img}.jpg" width="86" height="86"
																alt="제품사진" class="image__goods"></a>
														</div>
														<div class="box__info">
															<div class="box__goods-name">
																<a href="https://${payPageList.url}"
																	class="text__goods-name" target="_blank">${payPageList.pname}</a>
															</div>
															<div class="box__option">
																<p class="text__option">
																	<span class="text__option-make">${payPageList.mname}</span>
																</p>
															</div>
															<div class="box__price">
																<span class="text__value text__num price"
																	data-price="${prodPrice}"
																	id="prodPrice_${status.index}"></span> <span
																	class="text__unit">원 / </span><span
																	class="text__amount"> <span class="button-group">
																		<span type="text__value text__num" class="item-count"
																		id="itemCount_${status.index}">${payPageList.count}개</span>
																</span>
																</span>
															</div>
														</div>
													</div>
													<div class="box__delivery-charge">
														<span class="text__delivery">배송비</span> <span
															class="text__delivery-charge"> <c:choose>
																<c:when test="${payPageList.delivery_charge == 0}">
									                                무료배송
									                            </c:when>
																<c:otherwise>
																	<span class="text__num"
																		data-price="${payPageList.delivery_charge}"></span>
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
												<span class="text__title">상품금액</span><span
													class="text__num price" data-price="${totalPrice}"><span
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
												<span class="text__title">총 결제금액</span> <span
													class="text__num price" data-price="${totalPrice}"><span
													class="text__unit">원</span></span>
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
	<!-- 팝업 창 -->
	<div class="box__layer" role="dialog">
	    <div class="box__layer-header">
	        <span class="title">배송지 변경</span>
	        <button class="close-btn" onclick="closeDialog()">×</button>
	    </div>
	    <div class="box__iframe">
	        <div class="box__address-add">
	            <button type="button">배송지 추가</button>
	        </div>
	        <div class="box__address-list">
	            <!-- 배송지가 없을 경우 표시할 메시지 -->
	            <p id="no-address-msg">저장된 배송지가 없습니다. 배송지를 추가해주세요.</p>
	            <!-- 예시 배송지 데이터 -->
	            <div class="box__address-item">
	                <div class="box__address-header">
	                    <div class="box__address-title">
	                        <i class="fas fa-map-marker-alt"></i>
	                        <h3 class="sprite__checkout--before text__title-address home">집</h3>
	                        <span class="default-label">기본</span> <!-- 기본 배송지 표시 -->
	                        <button class="select-btn">선택</button> <!-- 선택 버튼 추가 -->
	                    </div>
	                    <div class="box__address-actions">
	                        <button class="edit-btn">수정</button>
	                        <button class="delete-btn">삭제</button>
	                    </div>
	                </div>
	                <div class="box__address-cont box__address--default">
	                    <div class="address_name">
	                        <span class="text__name">이준석</span> / <span class="text__tel">010-8525-3999</span>
	                    </div>
	                    <div class="address_txt">부산광역시 연제구 토현로 10 (주공아파트) 117동 801호</div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<div class="dimmed"></div>
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
// 배송지 변경
document.getElementById('xo_id_open_address_book').addEventListener('click', function() {
    document.querySelector('.box__layer').style.display = 'block';
    document.querySelector('.dimmed').style.display = 'block';
});

function closeDialog() {
    document.querySelector('.box__layer').style.display = 'none';
    document.querySelector('.dimmed').style.display = 'none';
}

// 예시 데이터가 있을 경우 메시지 숨김
window.onload = function() {
    var addressItems = document.querySelectorAll('.box__address-item');
    if (addressItems.length > 0) {
        document.getElementById('no-address-msg').style.display = 'none';
    }
}
</script>
<script>
// 요청사항 변경 시 라벨 텍스트 및 입력란 표시 여부 설정
document.getElementById('delivery-request').addEventListener('change', function () {
    var selfInputDiv = document.querySelector('.box__self-input');
    var deliveryLabel = document.getElementById('delivery-label');
    var selectedText = this.options[this.selectedIndex].text;

    if (this.value === '6') {
        selfInputDiv.style.display = 'block';
    } else {
        selfInputDiv.style.display = 'none';
    }

    deliveryLabel.textContent = selectedText;
});

// 초기 로드 시 선택된 옵션에 따라 라벨 텍스트 및 입력란 표시 여부 설정
document.addEventListener('DOMContentLoaded', function () {
    var deliveryRequest = document.getElementById('delivery-request');
    var selfInputDiv = document.querySelector('.box__self-input');
    var deliveryLabel = document.getElementById('delivery-label');
    var selectedText = deliveryRequest.options[deliveryRequest.selectedIndex].text;

    if (deliveryRequest.value === '6') {
        selfInputDiv.style.display = 'block';
    } else {
        selfInputDiv.style.display = 'none';
    }

    deliveryLabel.textContent = selectedText;
});
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
// 할인 금액 세부 항목
document.addEventListener('DOMContentLoaded', function() {
    const payOptionButton = document.querySelector('.button__pay-option');
    const subOptionList = document.querySelector('.box__sub-option');

    payOptionButton.addEventListener('click', function() {
        const isExpanded = payOptionButton.getAttribute('aria-expanded') === 'true';
        payOptionButton.setAttribute('aria-expanded', !isExpanded);
        subOptionList.style.display = isExpanded ? 'none' : 'block';
    });
});
</script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
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