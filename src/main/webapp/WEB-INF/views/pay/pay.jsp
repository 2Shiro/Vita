<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 스타일 시트 로드 -->
<link href="/css/start.css" rel="stylesheet" />
<link href="/css/header.css" rel="stylesheet" />
<link rel="stylesheet" href="/css/pay/app.css" />
<link rel="stylesheet" href="/css/pay/boxlayer.css" />
<link rel="stylesheet" href="/css/pay/common.css" />
<!-- Font Awesome 포함 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
/* 페이지 컨테이너 스타일 */
#container {
	width: 100%;
	height: 100%;
	margin-top: 130px;
}

/* 섹션 스타일 */
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
	position: absolute;
	width: 1240px;
	top: 0;
}

.box__sub-option, .box__self-input {
	display: none;
}

/* 팝업 레이어 스타일 */
.box__layer, .box__layer-add, .box__layer-edit {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: #f0f0f0;
	padding: 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	width: 600px;
	height: 700px;
}

.box__layer {
	z-index: 1000;
}

.box__layer-add, .box__layer-edit {
	z-index: 1100;
}

/* dimmed 레이어 스타일 */
.dimmed {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: 999;
}

/* 폼 스타일 */
.box__iframe {
	display: flex;
	flex-direction: column;
}

.form-group {
	display: flex;
	margin-bottom: 20px;
	align-items: center;
}

.form-group label {
	flex: 3;
	text-align: left;
	font-size: 18px;
}

.form-group input, .form-group button {
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 16px;
}

.form-group input[type="text"], .form-group input[type="tel"] {
	flex: 7;
}

.form-group .zipcode-container {
	display: flex;
	flex: 7;
}

.form-group .zipcode-container input[type="text"] {
	flex: 2;
	margin-right: 10px;
}

.form-group .zipcode-container input[type="button"] {
	flex: 1;
	cursor: pointer;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 4px;
}

input[type="button"] {
	align-self: center;
	padding: 12px 24px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 18px;
}

input[type="button"]:hover {
	background-color: #0056b3;
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
								<input type="hidden" id="address_id" name="address_id" value="${deliveryvo.address_id}">
								<div class="box__address-title">
									<h3 class="sprite__checkout--before text__title-address">${deliveryvo.name}</h3>
								</div>
								<div class="box__address-cont box__address--default">
									<div class="address_name">
										<span class="text__name">${deliveryvo.recipent}</span><span
											class="text__tel">${deliveryvo.tel}</span>
									</div>
									<div class="address_txt">${deliveryvo.address}
										${deliveryvo.addressdetail}</div>
									<!-- 배송 요청사항 선택 및 입력란 -->
									<div class="box__form-group">
									    <div class="box__control-select sprite__checkout--after box__form-control box__form--active">
									        <label for="delivery-request" class="text__label" id="delivery-label" style="color: rgb(0, 0, 0);">
									            배송시 요청사항을 선택해 주세요.
									        </label>
									        <select id="delivery-request" class="form__select js-form__select">
									            <option value="selected" ${deliveryvo.req == 'selected' ? 'selected' : ''}>배송시 요청사항을 선택해 주세요.</option>
									            <option value="1" ${deliveryvo.req == '1' ? 'selected' : ''}>직접 수령하겠습니다.</option>
									            <option value="2" ${deliveryvo.req == '2' ? 'selected' : ''}>배송 전 연락바랍니다.</option>
									            <option value="3" ${deliveryvo.req == '3' ? 'selected' : ''}>부재 시 경비실에 맡겨주세요.</option>
									            <option value="4" ${deliveryvo.req == '4' ? 'selected' : ''}>부재 시 문 앞에 놓아주세요.</option>
									            <option value="5" ${deliveryvo.req == '5' ? 'selected' : ''}>부재 시 택배함에 넣어주세요.</option>
									            <option value="6" ${!(deliveryvo.req == 'selected' || deliveryvo.req == '1' || deliveryvo.req == '2' || deliveryvo.req == '3' || deliveryvo.req == '4' || deliveryvo.req == '5') ? 'selected' : ''}>
									                직접 입력
									            </option>
									        </select>
									    </div>
									    <div class="box__self-input box__text-area" ${!(deliveryvo.req == 'selected' || deliveryvo.req == '1' || deliveryvo.req == '2' || deliveryvo.req == '3' || deliveryvo.req == '4' || deliveryvo.req == '5') ? 'style="display:block;"' : ''}>
									        <textarea class="input__txt" id="xo_id_shipping_request" name="textarea_self" maxlength="50" placeholder="최대 50자 입력이 가능합니다.">
									            ${!(deliveryvo.req == 'selected' || deliveryvo.req == '1' || deliveryvo.req == '2' || deliveryvo.req == '3' || deliveryvo.req == '4' || deliveryvo.req == '5') ? deliveryvo.req : ''}
									        </textarea>
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
									<!-- 총합을 저장할 변수를 선언합니다. -->
									<c:set var="totalPrice" value="0" />
									<!-- 주문 상품 목록을 반복하며 총합 계산 -->
									<c:forEach var="payPageList" items="${payPageList}"
										varStatus="status">
										<input type="hidden" id="basket_id_${status.index}"
											value="${payPageList.basket_id}">
										<input type="hidden" id="userId" name="userId" value="${id}">
										<!-- 각 항목의 가격을 계산합니다. -->
										<c:set var="prodPrice"
											value="${payPageList.price * payPageList.count}" />
										<!-- 계산된 가격을 총합 변수에 더합니다. -->
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
																		data-price="${payPageList.price}"></span> <span
																	class="text__unit">원 / </span><span
																	class="text__amount"> <span class="button-group">
																		<span type="text__value text__num" class="item-count"
																		id="itemCount_${status.index}">${payPageList.count}개</span>
																</span>
																</span>
															</div>
															<div class="box__price">
																<span>수량에 따른 상품 금액 : </span>
																<span class="text__value text__num price"
																	data-price="${prodPrice}"
																	id="prodPrice_${status.index}"></span>
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
													</div></li>
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
	<!-- 기존 배송지 변경 팝업 -->
	<div class="box__layer" role="dialog">
		<div class="box__layer-header">
			<span class="title">배송지 변경</span>
			<button class="close-btn" onclick="closeDialog()">×</button>
		</div>
		<div class="box__iframe">
			<div class="box__address-add">
				<button type="button" id="add_address">배송지 추가</button>
			</div>
			<div class="box__address-list">
				<c:if test="${not empty deliveryList}">
					<c:forEach var="delivery" items="${deliveryList}">
						<!-- 예시 배송지 데이터 -->
						<div class="box__address-item"
							id="address-item-${delivery.address_id}"
							data-address='${delivery}'>
							<div class="box__address-header">
								<div class="box__address-title">
									<i class="fas fa-map-marker-alt"></i>
									<h3 class="sprite__checkout--before text__title-address home">${delivery.name}</h3>
									<c:if test="${delivery.defualt == 1}">
										<span class="default-label">기본</span>
										<!-- 기본 배송지 표시 -->
									</c:if>
								</div>
								<div class="box__address-actions">
									<button class="edit-btn" data-address='${delivery}'>수정</button>
									<button class="delete-btn"
										data-address-id="${delivery.address_id}">삭제</button>
								</div>
							</div>
							<div class="box__address-cont box__address--default">
								<div class="address_name">
									<span class="text__name">${delivery.recipent}</span> / <span
										class="text__tel">${delivery.tel}</span>
								</div>
								<div class="address_txt">${delivery.address}</div>
								<div class="box__address-header">
									<div class="box__address-detail">
										<span class="address_txt">${delivery.addressdetail}</span>
									</div>
									<div class="box__address-actions">
										<button class="select-btn" data-address='${delivery}'>선택</button>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${empty deliveryList}">
					<p>저장된 배송지가 없습니다. 배송지를 추가해주세요.</p>
				</c:if>
			</div>
		</div>
	</div>
	<!-- 새로운 배송지 추가 팝업 -->
	<div class="box__layer-add" role="dialog">
		<div class="box__layer-header">
			<span class="title">배송지 추가</span>
			<button class="close-btn" onclick="closeAddDialog()">×</button>
		</div>
		<div class="box__iframe">
			<!-- 배송지 추가 폼 -->
			<form id="add_address_form">
				<div class="form-group">
					<label for="name">배송지 이름</label> <input type="text" id="name"
						name="name" required>
				</div>
				<div class="form-group">
					<label for="recipent">수령인</label> <input type="text" id="recipent"
						name="recipent" required>
				</div>
				<div class="form-group">
					<label for="tel">전화번호</label> <input type="tel" id="tel" name="tel"
						required>
				</div>
				<div class="form-group">
					<label for="zipcode">우편번호</label>
					<div class="zipcode-container">
						<input type="text" id="zipcode" name="zipcode" required> <input
							type="button" onclick="execDaumZipcode()" value="우편번호 찾기">
					</div>
				</div>
				<div class="form-group">
					<label for="address">주소</label> <input type="text" id="address"
						name="address" required>
				</div>
				<div class="form-group">
					<label for="addressdetail">상세 주소</label> <input type="text"
						id="addressdetail" name="addressdetail" required>
				</div>
				<div class="form-group">
					<label for="deliveryRequest">배송시 요청사항</label> <select
						id="deliveryRequest" name="deliveryRequest"
						onchange="handleDeliveryRequestChange()" required>
						<option value="selected">배송시 요청사항을 선택해 주세요.</option>
						<option value="1">직접 수령하겠습니다.</option>
						<option value="2">배송 전 연락바랍니다.</option>
						<option value="3">부재 시 경비실에 맡겨주세요.</option>
						<option value="4">부재 시 문 앞에 놓아주세요.</option>
						<option value="5">부재 시 택배함에 넣어주세요.</option>
						<option value="6">직접 입력</option>
					</select>
					<textarea id="customRequest" name="customRequest" maxlength="50"
						style="display: none;" placeholder="50자내로 요청사항을 입력하세요."></textarea>
				</div>
				<div class="form-group">
					<label for="defualt">기본 배송지 여부</label> <input type="checkbox"
						id="defualt" name="defualt" value="1"> <input
						type="hidden" name="defualt" value="0">
				</div>
				<input type="button" value="추가" onclick="addDeliveryAddress()">
			</form>
		</div>
	</div>
	<!-- 기존 배송지 수정 팝업 -->
	<div class="box__layer-edit" role="dialog">
		<div class="box__layer-header">
			<span class="title">배송지 수정</span>
			<button class="close-btn" onclick="closeEditDialog()">×</button>
		</div>
		<div class="box__iframe">
			<!-- 배송지 수정 폼 -->
			<form id="edit_address_form">
				<input type="hidden" id="edit_address_id" name="address_id">
				<div class="form-group">
					<label for="edit_name">배송지 이름</label> <input type="text"
						id="edit_name" name="name" required>
				</div>
				<div class="form-group">
					<label for="edit_recipent">수령인</label> <input type="text"
						id="edit_recipent" name="recipent" required>
				</div>
				<div class="form-group">
					<label for="edit_tel">전화번호</label> <input type="tel" id="edit_tel"
						name="tel" required>
				</div>
				<div class="form-group">
					<label for="edit_zipcode">우편번호</label>
					<div class="zipcode-container">
						<input type="text" id="edit_zipcode" name="zipcode" required>
						<input type="button" onclick="execDaumZipcodeEdit()"
							value="우편번호 찾기">
					</div>
				</div>
				<div class="form-group">
					<label for="edit_address">주소</label> <input type="text"
						id="edit_address" name="address" required>
				</div>
				<div class="form-group">
					<label for="edit_addressdetail">상세 주소</label> <input type="text"
						id="edit_addressdetail" name="addressdetail" required>
				</div>
				<div class="form-group">
					<label for="edit_deliveryRequest">배송시 요청사항</label> <select
						id="edit_deliveryRequest" name="deliveryRequest"
						onchange="handleDeliveryRequestChangeEdit()" required>
						<option value="selected">배송시 요청사항을 선택해 주세요.</option>
						<option value="1">직접 수령하겠습니다.</option>
						<option value="2">배송 전 연락바랍니다.</option>
						<option value="3">부재 시 경비실에 맡겨주세요.</option>
						<option value="4">부재 시 문 앞에 놓아주세요.</option>
						<option value="5">부재 시 택배함에 넣어주세요.</option>
						<option value="6">직접 입력</option>
					</select>
					<textarea id="edit_customRequest" name="customRequest"
						maxlength="50" style="display: none;"
						placeholder="50자내로 요청사항을 입력하세요."></textarea>
				</div>
				<div class="form-group">
					<label for="edit_defualt">기본 배송지 여부</label> <input type="checkbox"
						id="edit_defualt" name="defualt">
				</div>
				<input type="button" value="수정" onclick="editDeliveryAddress()">
			</form>
		</div>
	</div>
	<div class="dimmed"></div>
</body>
<!-- 스크립트 로드 -->
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
// 3자리 수마다 콤마 추가
document.addEventListener('DOMContentLoaded', function () {
    const priceElements = document.querySelectorAll('.text__num');
    priceElements.forEach(priceElement => {
        const price = priceElement.getAttribute('data-price');
        const formattedPrice = Number(price).toLocaleString('ko-KR');
        priceElement.textContent = formattedPrice;
    });
});
</script>
<script>
// 할인 금액 세부 항목 표시/숨김
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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
// 배송지 변경 팝업 열기
document.getElementById('xo_id_open_address_book').addEventListener('click', function() {
    document.querySelector('.box__layer').style.display = 'block';
    document.querySelector('.dimmed').style.display = 'block';
});

// 배송지 변경 팝업 닫기
function closeDialog() {
    document.querySelector('.box__layer').style.display = 'none';
    document.querySelector('.dimmed').style.display = 'none';
}

// 배송지 추가 팝업 열기
document.getElementById('add_address').addEventListener('click', function() {
    document.querySelector('.box__layer-add').style.display = 'block';
});

// 배송지 추가 팝업 닫기
function closeAddDialog() {
    document.querySelector('.box__layer-add').style.display = 'none';
}

// 우편번호 찾기
function execDaumZipcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; // 주소 변수
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            document.getElementById("addressdetail").focus();
        }
    }).open();
}

// 요청사항 변경 시 라벨 텍스트 및 입력란 표시 여부 설정
function handleDeliveryRequestChange() {
    const deliveryRequestSelect = document.getElementById('deliveryRequest');
    const customRequestTextarea = document.getElementById('customRequest');
    
    if (deliveryRequestSelect.value === '6') {
        customRequestTextarea.style.display = 'block';
    } else {
        customRequestTextarea.style.display = 'none';
    }
}

// 배송지 추가
function addDeliveryAddress() {
    const formData = new FormData(document.getElementById('add_address_form'));

    if (formData.get('deliveryRequest') === '6') {
        formData.set('deliveryRequest', formData.get('customRequest'));
    } else {
        formData.delete('customRequest');
    }

    fetch('/Pay/addDeliveryAddress', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            document.getElementById('add_address_form').reset();
            closeAddDialog();
            fetchDeliveryList();
        } else {
            alert('배송지 추가에 실패했습니다.');
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });
}

// 주소 항목 생성
function createElement(tag, classNames = '', textContent = '') {
    const element = document.createElement(tag);
    if (classNames) element.className = classNames;
    if (textContent) element.textContent = textContent;
    return element;
}

function createAddressItem(delivery) {
    const addressItem = createElement('div', 'box__address-item');
    addressItem.id = `address-item-${delivery.address_id}`;

    const addressHeader = createElement('div', 'box__address-header');
    const addressTitle = createElement('div', 'box__address-title');
    addressTitle.appendChild(createElement('i', 'fas fa-map-marker-alt'));
    addressTitle.appendChild(createElement('h3', 'sprite__checkout--before text__title-address home', delivery.name));

    if (delivery.defualt) {
        addressTitle.appendChild(createElement('span', 'default-label', '기본'));
    }

    const addressActions = createElement('div', 'box__address-actions');
    const editButton = createElement('button', 'edit-btn', '수정');
    editButton.addEventListener('click', () => openEditDialog(delivery));
    const deleteButton = createElement('button', 'delete-btn', '삭제');
    deleteButton.setAttribute('data-address-id', delivery.address_id);
    deleteButton.addEventListener('click', function() {
        const addressId = this.getAttribute('data-address-id');
        deleteAddress(addressId);
    });

    addressActions.appendChild(editButton);
    addressActions.appendChild(deleteButton);

    addressHeader.appendChild(addressTitle);
    addressHeader.appendChild(addressActions);

    const addressCont = createElement('div', 'box__address-cont box__address--default');
    const addressName = createElement('div', 'address_name');
    addressName.appendChild(createElement('span', 'text__name', delivery.recipent));
    addressName.appendChild(createElement('span', '', ' / '));
    addressName.appendChild(createElement('span', 'text__tel', delivery.tel));

    addressCont.appendChild(addressName);
    addressCont.appendChild(createElement('div', 'address_txt', delivery.address));

    const addressDetailHeader = createElement('div', 'box__address-header');
    const addressDetail = createElement('div', 'box__address-detail');
    addressDetail.appendChild(createElement('span', 'address_txt', delivery.addressdetail));
    addressDetailHeader.appendChild(addressDetail);

    const selectButtonContainer = createElement('div', 'box__address-actions');
    const selectButton = createElement('button', 'select-btn', '선택');
    selectButton.setAttribute('data-address', JSON.stringify(delivery));
    selectButton.addEventListener('click', function() {
        const delivery = JSON.parse(this.getAttribute('data-address'));
        selectDeliveryAddress(delivery);
    });
    selectButtonContainer.appendChild(selectButton);
    addressDetailHeader.appendChild(selectButtonContainer);

    addressCont.appendChild(addressDetailHeader);
    addressItem.appendChild(addressHeader);
    addressItem.appendChild(addressCont);

    return addressItem;
}

function fetchDeliveryList() {
    fetch('/Pay/getDeliveryList')
        .then(response => response.json())
        .then(data => {
            const addressListContainer = document.querySelector('.box__address-list');
            if (!addressListContainer) {
                console.error('Address list container not found');
                return;
            }

            addressListContainer.innerHTML = '';

            if (data.deliveryList && data.deliveryList.length > 0) {
                data.deliveryList.forEach(delivery => {
                    const addressItem = createAddressItem(delivery);
                    addressListContainer.appendChild(addressItem);
                });

                // 수정 및 삭제 버튼 이벤트 리스너 다시 추가
                addEventListenersToButtons();
            } else {
                addressListContainer.innerHTML = '<p>저장된 배송지가 없습니다. 배송지를 추가해주세요.</p>';
            }
        })
        .catch(error => {
            console.error('Error fetching delivery list:', error);
        });
}

// 버튼에 이벤트 리스너 추가
function addEventListenersToButtons() {
    document.querySelectorAll('.edit-btn').forEach(button => {
        button.addEventListener('click', function() {
            const delivery = JSON.parse(this.getAttribute('data-address'));
            openEditDialog(delivery);
        });
    });

    document.querySelectorAll('.delete-btn').forEach(button => {
        button.addEventListener('click', function() {
            const addressId = this.getAttribute('data-address-id');
            deleteAddress(addressId);
        });
    });
    
 	// 배송지 선택 버튼 클릭 이벤트 리스너 추가
    document.querySelectorAll('.select-btn').forEach(button => {
        button.addEventListener('click', function() {
            const delivery = JSON.parse(this.getAttribute('data-address'));
            selectDeliveryAddress(delivery);
        });
    });
}

//수정 팝업 열기
function openEditDialog(delivery) {
    document.getElementById('edit_address_id').value = delivery.address_id;
    document.getElementById('edit_name').value = delivery.name;
    document.getElementById('edit_recipent').value = delivery.recipent;
    document.getElementById('edit_tel').value = delivery.tel;
    document.getElementById('edit_zipcode').value = delivery.zipcode;
    document.getElementById('edit_address').value = delivery.address;
    document.getElementById('edit_addressdetail').value = delivery.addressdetail;

    const deliveryRequestSelect = document.getElementById('edit_deliveryRequest');
    const customRequestTextarea = document.getElementById('edit_customRequest');

    // 배송 요청사항 설정
    if (['selected', '1', '2', '3', '4', '5'].includes(delivery.req)) {
        deliveryRequestSelect.value = delivery.req;
        customRequestTextarea.style.display = 'none';
        customRequestTextarea.value = '';
    } else {
        deliveryRequestSelect.value = '6';
        customRequestTextarea.style.display = 'block';
        customRequestTextarea.value = delivery.req;
    }

    document.getElementById('edit_defualt').checked = delivery.defualt === 1;

    document.querySelector('.box__layer-edit').style.display = 'block';
    document.querySelector('.dimmed').style.display = 'block';
}

// 수정 팝업 닫기
function closeEditDialog() {
    document.querySelector('.box__layer-edit').style.display = 'none';
}

// 우편번호 찾기 (수정 팝업)
function execDaumZipcodeEdit() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = data.userSelectedType === 'R' ? data.roadAddress : data.jibunAddress;
            document.getElementById('edit_zipcode').value = data.zonecode;
            document.getElementById("edit_address").value = addr;
            document.getElementById("edit_addressdetail").focus();
        }
    }).open();
}

function handleDeliveryRequestChangeEdit() {
    const deliveryRequestSelect = document.getElementById('edit_deliveryRequest');
    const customRequestTextarea = document.getElementById('edit_customRequest');
    if (deliveryRequestSelect.value === '6') {
        customRequestTextarea.style.display = 'block';
    } else {
        customRequestTextarea.style.display = 'none';
    }
}

function editDeliveryAddress() {
    const formElement = document.getElementById('edit_address_form');
    const formData = new FormData(formElement);

    // 체크박스 값을 직접 설정
    const checkbox = document.getElementById('edit_defualt');
    formData.set('defualt', checkbox.checked ? '1' : '0');

    const data = {};
    formData.forEach((value, key) => {
        data[key] = value;
    });

    if (data.deliveryRequest === '6') {
        data.deliveryRequest = data.customRequest;
    }
    delete data.customRequest;

    fetch('/Pay/updateDeliveryAddress', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            formElement.reset();
            closeEditDialog();
            fetchDeliveryList();
        } else {
            alert('배송지 수정에 실패했습니다.');
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });
}

// 배송지 삭제
function deleteAddress(addressId) {
    const url = '/Pay/deleteDeliveryAddress';
    const data = { address_id: addressId };

    fetch(url, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            fetchDeliveryList();
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });
}

//선택한 배송지 정보를 메인 화면에 업데이트하는 함수
function selectDeliveryAddress(delivery) {
    document.querySelector('.text__title-address').textContent = delivery.name;
    document.querySelector('.text__name').textContent = delivery.recipent;
    document.querySelector('.text__tel').textContent = delivery.tel;
    document.querySelector('.address_txt').textContent = delivery.address + ' ' + delivery.addressdetail;

    const deliveryRequestSelect = document.getElementById('delivery-request');
    const customRequestTextarea = document.getElementById('xo_id_shipping_request');
    const deliveryLabel = document.getElementById('delivery-label');

    if (['selected', '1', '2', '3', '4', '5'].includes(delivery.req)) {
        deliveryRequestSelect.value = delivery.req;
        customRequestTextarea.style.display = 'none';
        customRequestTextarea.value = '';
    } else {
        deliveryRequestSelect.value = '6';
        customRequestTextarea.style.display = 'block';
        customRequestTextarea.value = delivery.req;
    }

    deliveryLabel.textContent = deliveryRequestSelect.options[deliveryRequestSelect.selectedIndex].text;

    // 팝업창 닫기
    closeDialog();
}

//페이지 로드 시 초기화(나중에 팝업창 html에 수정이 생기면 이것도 지우고 수정할것)
document.addEventListener('DOMContentLoaded', function() {
    fetchDeliveryList();
});
</script>
<!-- 포트원 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
IMP.init("imp03323882");

function getTodayDate() {
    const today = new Date();
    const year = today.getFullYear();
    const month = ('0' + (today.getMonth() + 1)).slice(-2);
    const day = ('0' + today.getDate()).slice(-2);
    return year + month + day;
}

function generateRandomNumber(length) {
    let result = '';
    const characters = '0123456789';
    for (let i = 0; i < length; i++) {
        result += characters.charAt(Math.floor(Math.random() * characters.length));
    }
    return result;
}

function generateMerchantUid() {
    const todayDate = getTodayDate();
    const uniqueNumber = generateRandomNumber(12); // 12자리 랜덤 숫자 생성
    const merchantUid = 'order_no_' + todayDate + uniqueNumber;
    return merchantUid;
}

function requestPay() {
    // 결제 상품명 설정
    let productNames = [];
    let productCount = 0;
    document.querySelectorAll('.text__goods-name').forEach((element, index) => {
        if (index === 0) {
            productNames.push(element.textContent);
        }
        productCount++;
    });
    var productName;
    if (productCount > 1) {
        productName = productNames[0] + ' 외 ' + (productCount - 1) + '건';
    } else {
        productName = productNames[0];
    }
    console.log("productName:", productName);

    // 총 결제 금액 설정
    const totalPrice = document.querySelector('.list__total-price .text__num.price').dataset.price;
    console.log("totalPrice:", totalPrice);
    
    // 구매자 ID 설정
    const buyer_id = document.querySelector('input[name="userId"]').value;
    console.log("buyer_id:", buyer_id);

    // 배송지 주소 설정
    const address_id = document.querySelector('input[name="address_id"]').value;
    console.log("address_id:", address_id);

    // 배송 요청사항 설정
    const delivery_request_select = document.getElementById('delivery-request');
    const delivery_request_value = delivery_request_select.value === '6' ? document.getElementById('xo_id_shipping_request').value : delivery_request_select.options[delivery_request_select.selectedIndex].text;
    console.log("delivery_request:", delivery_request_value);

    // basket_id 가져오기
    const basket_ids = [];
    document.querySelectorAll('input[id^="basket_id_"]').forEach(input => {
        basket_ids.push(input.value);
    });
    console.log("basket_ids:", basket_ids);

    // 결제 방법 설정
    const pay_method = "card"; // 예시로 카드 결제 방식 사용
    console.log("pay_method:", pay_method);

    IMP.request_pay({
        pg: "uplus.tlgdacomxpay",
        pay_method: pay_method,
        merchant_uid: generateMerchantUid(), // 고유 주문번호 생성
        name: productName,
        amount: totalPrice,
        buyer_name: buyer_id,
        buyer_addr: address_id,
        appCard: true, // 설정시 신용카드 결제모듈에서 앱카드 결제만 활성화됩니다.
        custom_data: {
            basket_ids: basket_ids,
            delivery_request: delivery_request_value,
            pay_method: pay_method,
            total_price: totalPrice
        }
    }, function (rsp) { // callback
        if (rsp.success) {
            console.log(rsp);
            // 결제가 성공하면 서버로 결제 결과를 전송합니다.
            sendPaymentResult(rsp);
        } else {
            console.log(rsp);
            // 결제가 실패하면 사용자에게 알립니다.
            alert('결제에 실패하였습니다. 다시 시도해 주세요.');
        }
    });
}

function sendPaymentResult(paymentResult) {
    console.log("Payment Result:", paymentResult); // 전송할 데이터 로그로 출력
    fetch('/Pay/Pay', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(paymentResult)
    })
    .then(response => {
        if (response.ok) {
            return response.json();
        } else {
            return response.text().then(text => {
                throw new Error(`Network response was not ok: ${text}`);
            });
        }
    })
    .then(data => {
        if (data.success) {
            alert('결제가 성공적으로 완료되었습니다.');
            window.location.href = '/Pay/Success';
        } else {
            alert('결제 결과 전송에 실패했습니다. 관리자에게 문의해 주세요.');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('결제 처리 중 오류가 발생했습니다. 다시 시도해 주세요.');
    });
}
</script>
</html>
