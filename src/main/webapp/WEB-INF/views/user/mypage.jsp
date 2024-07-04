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
.box__layer, .box__layer-add, .box__layer-edit, .box__layer-refund {
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

.box__layer-add, .box__layer-edit, .box__layer-refund {
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

.form-group input, .form-group button, .form-group textarea {
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

/* 환불버튼 */
.refund-button {
    border: 2px solid red;
    border-radius: 5px;
    background-color: white;
    color: red;
    padding: 5px 10px;
    cursor: pointer;
}
.refund-button:hover {
    background-color: red;
    color: white;
}

.form-group textarea {
    width: 70%;
    height: 150px; /* 높이를 늘림 */
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/include/Header.jsp"%>
	<div id="container">
		<div class="box__checkout-title">
			<h2 class="text__main-title">마이페이지</h2>
		</div>
		<div id="content" class="checkout__wrap">
			<div class="box__contents">
				<div class="section__left">
					<div class="section__checkout-info section__delivery-info">
						<div class="box__card box__card-address box__card-address--default">
							<div class="box__inner">
								<div class="text__title">
									기본 배송지 <span class="text__count"></span>
								</div>
								<input type="hidden" id="address_id" name="address_id" value="${deliveryvo.address_id}">
								<div class="box__address-title">
									<h3 class="sprite__checkout--before text__title-address">${deliveryvo.name}</h3>
								</div>
								<div class="box__address-cont box__address--default">
									<div class="address_name">
										<span class="text__name">${deliveryvo.recipent}</span><span class="text__tel">${deliveryvo.tel}</span>
									</div>
									<div class="address_txt">${deliveryvo.address} ${deliveryvo.addressdetail}</div>
									<!-- 배송 요청사항 선택 및 입력란 -->
									<div class="box__form-group">
										<div class="box__control-select sprite__checkout--after box__form-control box__form--active">
											<label for="delivery-request" class="text__label" id="delivery-label" style="color: rgb(0, 0, 0);">
												배송시 요청사항을 선택해 주세요.
											</label>
											<select id="delivery-request" class="form__select js-form__select" disabled>
												<option value="selected" ${deliveryvo.req == 'selected' ? 'selected' : ''}>배송시 요청사항을 선택해 주세요.</option>
												<option value="1" ${deliveryvo.req == '1' ? 'selected' : ''}>직접 수령하겠습니다.</option>
												<option value="2" ${deliveryvo.req == '2' ? 'selected' : ''}>배송 전 연락바랍니다.</option>
												<option value="3" ${deliveryvo.req == '3' ? 'selected' : ''}>부재 시 경비실에 맡겨주세요.</option>
												<option value="4" ${deliveryvo.req == '4' ? 'selected' : ''}>부재 시 문 앞에 놓아주세요.</option>
												<option value="5" ${deliveryvo.req == '5' ? 'selected' : ''}>부재 시 택배함에 넣어주세요.</option>
												<option value="6" ${!(deliveryvo.req == 'selected' || deliveryvo.req == '1' || deliveryvo.req == '2' || deliveryvo.req == '3' || deliveryvo.req == '4' || deliveryvo.req == '5') ? 'selected' : ''}>직접 입력</option>
											</select>
										</div>
										<div class="box__self-input box__text-area" ${!(deliveryvo.req == 'selected' || deliveryvo.req == '1' || deliveryvo.req == '2' || deliveryvo.req == '3' || deliveryvo.req == '4' || deliveryvo.req == '5') ? 'style="display:block;"' : ''}>
											<textarea readonly class="input__txt" id="xo_id_shipping_request" name="textarea_self" maxlength="50" placeholder="최대 50자 입력이 가능합니다.">${!(deliveryvo.req == 'selected' || deliveryvo.req == '1' || deliveryvo.req == '2' || deliveryvo.req == '3' || deliveryvo.req == '4' || deliveryvo.req == '5') ? deliveryvo.req : ''}</textarea>
										</div>
									</div>
									<div class="box__button-group">
										<button id="xo_id_open_address_book" type="button" class="button button__modify" data-montelena-acode="200007086">배송지 변경</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<section class="section__checkout-info section__paycase-info">
						<div class="section__checkout-info section__order-info">
							<div class="box__card box__order-info">
<c:forEach var="pay" items="${payList}" varStatus="status">
    <br>
    <div class="box__inner">
        <div class="text__title" style="display: flex; justify-content: space-between; align-items: center;">
            주문상품
            <c:choose>
                <c:when test="${pay.refundRequested}">
                    <button type="button" class="refund-button" disabled style="cursor: default; background-color: gray;">환불신청완료</button>
                </c:when>
                <c:otherwise>
                    <button type="button" class="refund-button" data-pay-id="${pay.pay_id}">환불신청</button>
                </c:otherwise>
            </c:choose>
        </div>
        <input type="hidden" id="pay_id" name="pay_id" value="${pay.pay_id}">
        <div id="identity" name="identity" style="font-size: 18px;">결제번호 : ${pay.identity}</div>
        <div id="sum" name="sum" style="font-size: 18px;">결제금액 : ${pay.sum}원</div>
        <div id="way" name="way" style="font-size: 18px;">결제수단 : ${pay.way}</div>
        <div id="req" name="req" style="font-size: 18px;">요청사항 : ${pay.req}</div>
        <hr>
        <c:forEach var="payResult" items="${payResultList}" varStatus="status">
            <c:if test="${pay.identity == payResult.identity}">
                <input type="hidden" id="goods_id_${status.index}" value="${payResult.goods_id}">
                <input type="hidden" id="userId" name="userId" value="${id}">
                <input type="hidden" id="identity" name="identity" value="${payResult.identity}">
                <div class="box__goods js-goods-space" data-index="${status.index}">
                    <ul class="list__goods-view">
                        <li class="list-item"><br>
                            <div class="box__goods-info">
                                <div class="box__thmb">
                                    <a class="link__goods" href="https://${payResult.url}" target="_blank">
                                        <img src="/img/${payResult.img}.jpg" width="86" height="86" alt="제품사진" class="image__goods">
                                    </a>
                                </div>
                                <div class="box__info">
                                    <div class="box__goods-name">
                                        <a href="https://${payResult.url}" class="text__goods-name" target="_blank">${payResult.name}</a>
                                    </div>
                                    <div class="box__price">
                                        <span class="text__value text__num price" data-price="${payResult.price}"></span>
                                        <span class="text__unit">원 / </span>
                                        <span class="text__amount">
                                            <span class="button-group">
                                                <span type="text__value text__num" class="item-count" id="itemCount_${status.index}">${payResult.count}개</span>
                                            </span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </c:if>
        </c:forEach>
    </div>
</c:forEach>
							</div>
						</div>
					</section>
				</div>
				<div class="section__right">
					<div class="section__right-inner">
						<div class="section__checkout-info section__payment-info">
							<div class="box__card box__payment-info">
								<div class="box__inner">
									<button type="button" class="button__total-price" data-montelena-acode="200007077">내 정보</button>
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
	<!-- 환불 팝업 -->
	<div class="box__layer-refund" role="dialog">
		<div class="box__layer-header">
			<span class="title">환불 신청</span>
			<button class="close-btn" onclick="closeRefundPopup()">×</button>
		</div>
		<div class="box__iframe">
			<!-- 환불사유 폼 -->
			<form id="refund_form">
				<input type="hidden" id="refund_pay_id" name="pay_id">
				<div class="form-group">
					<label for="refund_reason">환불 사유</label>
					<textarea id="refund_reason" name="refund_reason" maxlength="50" placeholder="50자 내로 환불사유를 입력하세요."></textarea>
				</div>
				<input type="button" value="환불신청" onclick="refundPay()">
			</form>
		</div>
	</div>
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

//페이지 로드 시 초기화
document.addEventListener('DOMContentLoaded', function() {
    fetchDeliveryList();
});

//환불 스크립트
document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.refund-button').forEach(button => {
        button.addEventListener('click', function() {
            const payId = this.dataset.payId;
            openRefundPopup(payId);
        });
    });
});

function openRefundPopup(payId) {
    document.getElementById('refund_pay_id').value = payId;
    document.querySelector('.box__layer-refund').style.display = 'block';
    document.querySelector('.dimmed').style.display = 'block';
}

function closeRefundPopup() {
    document.querySelector('.box__layer-refund').style.display = 'none';
    document.querySelector('.dimmed').style.display = 'none';
}

function refundPay() {
    const payId = document.getElementById('refund_pay_id').value;
    const refundReason = document.getElementById('refund_reason').value;

    if (!refundReason) {
        alert('환불 사유를 입력해주세요.');
        return;
    }

    const data = {
        pay_id: payId,
        refund_reason: refundReason
    };

    console.log('Sending data:', JSON.stringify(data)); // 요청 데이터를 콘솔에 출력하여 확인

    fetch('/Refund', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.text();
    })
    .then(result => {
        alert('환불 요청이 접수되었습니다. 결제 ID: ' + payId + '\n환불 사유: ' + refundReason);
        // 환불신청 버튼을 환불신청완료로 변경하고 비활성화
        const refundButton = document.querySelector('button[data-pay-id="' + payId + '"]');
        if (refundButton) {
            refundButton.textContent = '환불신청완료';
            refundButton.disabled = true;
            refundButton.onclick = null;
            refundButton.style.cursor = 'default';
            refundButton.style.backgroundColor = 'gray'; // 버튼 비활성화 시 스타일 변경
        }
        closeRefundPopup();
    })
    .catch(error => {
        console.error('Error:', error);
        alert('환불 요청 처리 중 오류가 발생했습니다.');
    });
}
</script>
</html>
