<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<title>장바구니</title>
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
#header {
	position: fixed;
	top: 0;
	z-index: 1000;
}
/* 사이드바 */
.sidenav {
	background-color: white;
	border-left: 1px solid #ECEFF7;
	position: fixed;
	width: 333px;
	height: 100%;
	margin-left: 75%;
	margin-top: 100px;
	display: inline-block;
	justify-content: flex-end;
	padding: 25px;
	z-index: 51;
	form { height : 80%;
			position: relative;
			font-size: 20px;
			input ,div{ margin-top: 5%; }
			}
	}
#cartForm button {
	width: 300px;
	font-size: 20px;
	margin: 5px;
	position: absolute;
}

#addToCart {
	border: 2px solid #ED7802;
	background-color: white;
	color: #ED7802;
	bottom: 70px;
}

#addToCart:hover {
	background-color: #ED7802;
	color: white;
}

#buy {
	bottom: 15px;
	color: white;
	background-color: #ED7802;
	border: 2px solid #ED7802;
}

#totalprice {
	width: 100%;
	position: absolute;
	bottom: 150px;
	font-size: 23px; 
	#plus {font-size: 14px;}
}
/* 본문 */
.body {
	margin: 0;
	font-size: 18px;
	list-style-type: none;
}

#intro {
	margin-top: 320px;
	margin-right: 300px;
	height: 700px;
	font-size: 23px;
}

#section1 {
	padding-top: 180px;
	margin-right: 400px;
	margin-left: 66px;
  color: #666;
  .container {
      width: 90%;
      margin: 20px auto;
      background: #fff;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      display: flex;
      flex-wrap: nowrap;
      justify-content: space-between;
  }
  .section {
      width: 48%;
  }
  h1 {
      font-size: 24px;
      color: #333;
      width: 100%;
  }
  h2 {
      font-size: 20px;
      color: #555;
      margin-bottom: 10px;
  }
  p, ul {
      font-size: 14px;
      color: #666;
      line-height: 1.6;
  }
  ul {
      padding-left: 20px;
  }
  ul li {
      margin-bottom: 10px;
  }
  .table-container {
      overflow-x: auto;
  }
  table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
  }
  table, th, td {
      border: 1px solid #ddd;
  }
  th, td {
      padding: 12px;
      text-align: left;
  }
  th {
      background-color: #f2f2f2;
  }
  .note {
      font-size: 12px;
      color: #999;
  }
}

#section2, #section3, #section4 {
	padding-top: 190px;
	margin-right: 400px;
	margin-left: 66px;
}

#navbar {
	margin: 200px 100px 0px 50px;
	display: flex;
	justify-content: center;
	padding: 10px 0;
	background-color: #ED7802;
	color: #fff;
	width: 1069px; 
				ul { list-style-type : none;
						 padding: 0;
						 display: flex;
						 li { list-style-type : none;
									margin: 0 15px; 
									a { list-style-type : none;
											color: #fff;
											text-decoration: none;}
								}
						}
				}
.sticky {
	position: fixed;
	top: -100px;
	width: 100%;
	z-index: 2;
}

#images {
	float: left;
}

.content {
	padding: 20px;
}

#intro {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 50px 20px;
	height: 200px;
	margin-bottom: 200px;
}

.left, .right {
	flex: 1;
}

.left {
	padding-right: 20px;
	text-align: center;
}

.right {
	padding-left: 20px;
	text-align: left;
}

form {
	font-size: 16px;
}

.exapnd {
	width: 100%;
	height: 400px;
	display: flex;
	align-items: center;
	justify-content: center;
	margin-bottom: 20px;
}

.big  img {
	width: 400px;
	height: 400px;
}

.mini  span  img {
	display: inline-block;
	width: 60px;
	height: 60px;
	margin: 10px;
	cursor: pointer;
}

/* 별 평점 구현 */
.rating-container {
	background: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	display: flex;
	width: 600px;
	margin-left: 20%;
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

/* 리뷰 */
#reviews {
		width:1050px;
	  table { 
	  		width: 100%;
				margin: 0 auto;
				}
	}

.reviewTable {
	width:100%;
	font-size: 13px;
	margin-right: 300px;
	td:nth-child(2):not(.modal-content){
			    text-align: right;
					padding-right: 5%;
					}
	}
.reviewTable>table>tr>td {
	border-bottom: 1px solid #ccc;
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

/*찜하기*/
.wish_btn {
	font-size: 30px;
	background-color: white;
	color: grey;
	border: none;
	border-radius: 20px;
}

.unfilled {
	color: grey;
}

.filled {
	color: red;
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
/* section3 */
/* 질문하기 팝업창 */
.container {
	width: 760px;
	justify-content: center;
}

.tbl tr {
	margin: 10px;
}

#form {
	background-color: white;
	padding: 20px;
	margin: 30px;
	font-size: 14px;
}
#main { z-index:1; }

#layer {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 1000;
	padding:20px;
}

#popup {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

#popBtn {
	float: right;
	margin: 20px;
}

#close {  z-index: 4;
					float : right; }

.notice_box {
	border: 1px solid black;
	margin-top: 20px;
	margin-bottom: 50px;
	padding: 10px;
	li { font-size :	11px;}
}
.btn_wrap {
	text-align: center; 
	button { background-color : #ED7802;
					width: 150px;
					height: 40px;
					font-size: 17px;
					border: none;
				}
}
/* 질문수정 팝업 */
.popcontainer{
		width: 760px;
		justify-content: center;
}
  #modifylayer {
      display: none;
      position: fixed;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      z-index: 1000;
      background-color: white;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
  }

  .overlay {
      display: none;
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(0, 0, 0, 0.7);
      z-index: 999;
  }

/* QnA List */
.qnacontainer table {
	width: 100%;
	border-collapse: collapse;
	border: 1px solid #ddd; 
	tr { width : 1030px; }
	td ,th { border-bottom : 1px solid #ddd;
						padding: 8px;
						font-size: 13px;
					}
		th {
			background-color: #f1f1f1;
		}
		button {
			margin-right : 20%;
			cursor: pointer;
			text-align: left;
			width: 100%;
		}
}
.accordion {
	background-color: #f1f1f1;
	color: #444;
	cursor: pointer;
	padding: 10px;
	width: 100%;
	border: none;
	text-align: left;
	outline: none;
	font-size: 13px;
	transition: 0.4s;
}

.active, .accordion:hover {
	background-color: #ccc;
}

.panel {
	display: none;
	background-color: #f1f1f1;
	padding: 10px;
	border: 1px solid #ccc;
}

.panel.show {
	display: table-row;
	}
.buttonQnA{
    display: flex;
}
#modifyQ,#deleteQ{
		top : 30%;
		height : 27px;
		width : 50px;
    border-radius:10px; 
    padding:8px;
    background-color: white;
/*     background-color: #0facbb; */
		margin : 3px;
		text-align: center;
		display: flex;
		align-items: center;
}
#modifyQ{
    color: #0facbb;
    border : 2px solid #0facbb;
}
#modifyQ:hover{
    color: white;
    background-color: #0facbb;
    border : 2px solid #0facbb;
}
#deleteQ{
    color: #f57b00;
    border : 2px solid #f57b00;
}
#deleteQ:hover{
    color: white;
    background-color: #f57b00;
    border : 2px solid #f57b00;
}

/*section4*/
.return {
	margin: auto;
	overflow: hidden;
	font-size: 13px;
	width: 1030px; 
	h2 { background : #f4f4f4;
			padding: 10px;
			border: 1px solid #ccc;
			margin-top: 20px;
		}
	table {
 		width: 100%; 
		border-collapse: collapse;
		margin-bottom: 20px;
	}
	table, th, td {
		border: 1px solid #ddd;
	}
	th, td {
		padding: 10px;
		text-align: left;
	}
	.criteria {
		background: #f9f9f9;
		padding: 10px;
		border: 1px solid #ddd;
	}
}
.seller {
	margin: auto;
	overflow: hidden;
	font-size: 13px;
	width: 1030px; 
	
	h2{ 
		font-size : 1.5em;
		margin-top: 20px;
		margin-bottom: 10px;
	}
	table {
		width: 100%;
		border-collapse: collapse;
		margin-bottom: 20px;
	}
	table, th, td {
		border: 1px solid #ddd;
	}
	th, td {
		padding: 10px;
		text-align: left;
	}
	th {
		background: #f4f4f4;
	}
}

/* 평균 별 */
.starContainer {
	display: flex;
	align-items: center;
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

/* 장바구니 추천상품 별*/
.recoContainer {
	display: flex;
	align-items: center;
}

.recoStar {
	width: 24px;
	height: 24px;
	background-color: lightgray;
	clip-path: polygon(50% 0%, 61% 35%, 98% 35%, 68% 57%, 79% 91%, 50% 70%, 21% 91%,
		32% 57%, 2% 35%, 39% 35%);
	margin-right: 4px;
	position: relative;
}

.recoStar.full {
	background-color: gold;
}

.recoStar .fill {
	background-color: gold;
	height: 100%;
	position: absolute;
	top: 0;
	left: 0;
}
</style>
</head>
<body>
	<div class="body">
		<div class="header"><%@include file="/WEB-INF/include/Header.jsp"%></div>
		<!-- 어사이드의 구매창 -->
		<div class="sidenav">
			<p class="sub-title"></p>
			<form id="cartForm" method="POST">
				<input type="hidden" name="id" id="id" value="${id}">
				<input type="hidden" name="pro_id" id="pro_id" value="${prod.pro_id}">
				<input type="hidden" name="state" id="state" value="1"> 
				<input type="hidden" name="price" id="price" value=""> 
				<input type="hidden" name="delivery_charge" id="delivery_charge" value="">
				<input type="hidden" name="count" id="count" value="1">
				<div id="name">${prod.name}</div>
				<div style="font-size: 13px;">최대 구매 수량 ${prod.stock_count}</div>
				<input type="hidden" value="${prod.stock_count}" id="prod_count">
				<input type='button' class="minus" value='-' /> <span id='result'>1</span>
				<input type='button' class="plus" value='+' /> <input type="hidden"
					id="pro_price" value="${prod.pro_price}">
				<div id="finalprice"></div>

				<div id="totalprice">
					<span> 총 금액 </span> <span class="totalcost"
						style="margin-left: 25%;"></span>
					<hr>
					<div id="plus">
						<div id="delivery"></div>
						<div id="finprice"></div>
					</div>
				</div>
				<div>
					<button id="addToCart" class="btn btn-outline-dark btn-lg"
						type="button" data-bs-toggle="offcanvas"
						data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">장바구니에
						담기</button>
				</div>
				<div>
					<button id="buy" class="btn btn-outline-dark btn-lg" type="button"
						onclick="location.href='/Pay/PayForm'">바로 구매하기</button>
				</div>
			</form>
		</div>
		<!-- 어사이드의 구매창 끝 -->

		<!-- offcanvas -->
		<div class="offcanvas offcanvas-end  tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
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
							<td><input type="hidden" class="recoAvg" data-reco-rating="${ reco.avg_rating }"> <span>
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

		<!-- 상세페이지 -->
		<!-- 맨 위 요약페이지 -->
		<div class="content">
			<section id="intro">
				<div class="left">
					<div class="big" id="bigImageContainer">
						<img id="bigImage" src="img/${prod.img}.jpg" alt="bigimage">
					</div>
					<div class="mini">
						<span data-image="img/${prod.img}.jpg"><img	src="img/${prod.img}.jpg" alt="1"></span>
						 <span data-image="img/영양제1.png"><img src="img/영양제1.png" alt="2"></span>
						 <span data-image="img/영양제2.png"><img src="img/영양제2.png" alt="3"></span> 
						 <span data-image="img/영양제2.png"><img src="img/영양제2.png" alt="4"></span>
						 <span data-image="img/영양제2.png"><img src="img/영양제2.png" alt="5"></span>
					</div>
				</div>
				<div class="right">
					<div id="starRating" class="starContainer">
						<div class="avgStar"></div>
						<div class="avgStar"></div>
						<div class="avgStar"></div>
						<div class="avgStar"></div>
						<div class="avgStar"></div>
					</div>
					<div>제조사 : ${ prod.brand_name }</div>
					<div>${ prod.name }</div>
					<div id="pro_price">${f_Price}원</div>
					<button type="button" class="wish_btn" id="wishBtn">
						<ion-icon name="heart"></ion-icon>
					</button>
				</div>
			</section>
			<!-- 맨 위 요약페이지 끝 -->

			<!-- nav-bar -->
			<nav id="navbar">
				<ul>
					<li><a href="#section1">상품정보</a></li>
					<li><a href="#section2">리뷰(${recount})</a></li>
					<li><a href="#section3">상품 Q&A</a></li>
					<li><a href="#section4">판매자 정보</a></li>
				</ul>
			</nav>
			
			<!-- section1 -->
			<section id="section1">
			
			 <div class="section">
				<h1>상품정보</h1>
				<p><br><br>
					<div>${ prod.name }</div><br>
					<div>
						<a href="https://${ prod.url }">${ prod.url }</a>
					</div><br>
					<div>${ prod.explain }</div><br>
					<h2>포함된 성분들</h2>
					<div>${ prod.ingredients }</div><br><br>
					
					<h2>주의사항</h2>
	        <ul>
	            <li>어린이의 손이 닿지 않는 곳에 보관하십시오.</li>
	            <li>외부 안전 봉인이 손상된 경우에는 구매하지 마십시오.</li>
	            <li>질병 치료를 받고 있거나 임신 또는 수유 중인 경우에는 복용하기 전에 의사와 상의하십시오.</li>
	            <li>뚜껑을 꼭 닫아 놓으며 건조한 곳에 보관하십시오.</li>
	            <li>${ prod.caution }</li>
	        </ul><br><br>
		      <h2>상품 사용법</h2>
		      	<ul>
			        <li>설명서를 구입 길게 읽고 지침을 따르십시오.</li>
			        <li>권장 섭취량을 초과하지 마십시오.</li>
			      </ul><br><br>
			      
			    <h2>면책사항</h2>
        <p>저희는 상품의 사진과 자료를 홈페이지에 반영하기 위해 노력하고 있습니다. 하지만 제조사가 포장이나 성분을 업데이트하는 경우 사이트에 반영되기까지 시간이 소요될 수 있습니다. 상품의 패키지는 다를 수 있으며 이는 검증된 번역으로 다를 수 있습니다. 일부 상품의 정보는 고객님의 편의를 위해 기계 번역되었습니다. 이는 검증된 번역으로 이틀 시일 내에 수정될 예정입니다.</p>
				</p>
				</div>
				<!-- 성분테이블 -->
            <div class="table-container">
                <h2>영양 성분 정보</h2>
                <table>
                    <thead>
                        <tr>
                            <th>1회 제공량: 캡슐 2정</th>
                            <th>용기당 제공 횟수: 60회</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>비타민A(베타카로틴, 아세테이트)(5,000IU)</td>
                            <td>1,500mcg^</td>
                            <td>167%</td>
                        </tr>
                        <tr>
                            <td>비타민C(아스코르브산, 칼슘, 나이아신아미드 아스코베이트)</td>
                            <td>470mg</td>
                            <td>522%</td>
                        </tr>
                        <tr>
                            <td>비타민D3(콜레칼시페롤)(2,000IU)</td>
                            <td>50mcg</td>
                            <td>250%</td>
                        </tr>
                        <tr>
                            <td>비타민E(d-알파토코페릴플록사실염, d-알파토코페롤)</td>
                            <td>67mg</td>
                            <td>447%</td>
                        </tr>
                        <tr>
                            <td>티아민(비타민B1)(티아민HCI)</td>
                            <td>75mg</td>
                            <td>6,250%</td>
                        </tr>
                        <tr>
                            <td>리보플라빈(비타민B2)(리보플라빈, 리보플라빈5'-인산염)</td>
                            <td>50mg</td>
                            <td>3,846%</td>
                        </tr>
                        <tr>
                            <td>니아신(나이아신아미드, 나이아신아미드 아스코베이트)</td>
                            <td>50mg*</td>
                            <td>313%</td>
                        </tr>
                        <tr>
                            <td>비타민B6(피리독신HCI, 피리독살5'-포스페이트)</td>
                            <td>75mg</td>
                            <td>4,412%</td>
                        </tr>
                        <tr>
                            <td>엽산(L-5-메틸테트라하이드로폴레이트 칼슘염)</td>
                            <td>680mcg^</td>
                            <td>170%</td>
                        </tr>
                        <tr>
                            <td>비오틴</td>
                            <td>300mcg</td>
                            <td>1,000%</td>
                        </tr>
                        <tr>
                            <td>판토텐산(칼슘 판토텐산염)</td>
                            <td>100mg</td>
                            <td>2,000%</td>
                        </tr>
                        <tr>
                            <td>마그네슘(산화마그네슘)</td>
                            <td>100mg</td>
                            <td>24%</td>
                        </tr>
                        <tr>
                            <td>아연(아연 시트레이트, L-OptiZinc® 아연모노-L-메티오닌 설레이트)</td>
                            <td>25mg</td>
                            <td>227%</td>
                        </tr>
                        <!-- 다른 행 추가 가능 -->
                    </tbody>
                </table>
            </div>
        
			</section>
			<section id="section2">
				<h1 style="border-bottom: 1px solid #ccc;">상품리뷰(${recount})</h1>

				<!-- 평점 -->
				<div class="rating-container">
					<div class="left-section">
						<div class="average-score">구매만족도</div>
						<div id="num" style="font-size: 50px;">${avgstar}</div>
						<input type="hidden" id="avgStar" value="${avgstar}">
						<!-- 별 색칠 -->
						<div id="starRating2" class="starContainer"
							style="margin-left: 20%;">
							<div class="avgStar"></div>
							<div class="avgStar"></div>
							<div class="avgStar"></div>
							<div class="avgStar"></div>
							<div class="avgStar"></div>
						</div>
						<div style="font-size: 12px;">(구매후기 ${ recount }건 기준)</div>
						<!-- 별 색칠 끝 -->
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
				</div>
				<!-- 막대바 끝 -->

				<!-- 사람들 리뷰 시작 -->
				<div id="reviews">
					<div class="reviewTable">
						<table>
							<c:forEach var="re" items="${ bestReviewList }">
								<tr>
									<td>id : ${ re.nick }</td>
									<td>${ re.created }</td>
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
									<td>
										<c:if test="${not empty review.img}">
		                    <div class="review-images">
		                        <c:forEach var="image" items="${re.img}">
		                           <img src="${re.img}" alt="Review Image" width="100" height="100">
		                        </c:forEach>
		                    </div>
		                </c:if>
									</td>
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
									<td>
										<!-- 리뷰 신고 버튼 --> <span class="notify-button-container">
											<button type="button" class="notify-button"
												data-rev-id="${re.rev_id}" data-id=""
												class="btn btn-primary" data-bs-toggle="modal"
												data-bs-target="#exampleModal" data-bs-whatever="@mdo"
												style="text-align: center;">신고하기</button>
									</span> <!-- 리뷰 신고 버튼 끝 --> <!-- 리뷰 신고창 -->
										<div class="modal fade" id="exampleModal" tabindex="-1"
											aria-labelledby="exampleModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content" style="text-align: left;">
													<div class="modal-header">
														<h1 class="modal-title fs-5" id="exampleModalLabel">신고하기</h1>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
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
											<!-- 리뷰 신고창 끝 -->
										</div>
									</td>
								</tr>
							</c:forEach>
						</table>
						
					<div style="text-align: center; font-size:17px; margin: 10px;"><a href="reviews?pro_id=${pro_id}&nowpage=1">${recount}건의 후기 모두 보기 ></a></div>

			</section>

			<!-- Q&A -->
			<section id="section3">
				<div class="qnacontainer">
				<!-- 팝업창 열기 버튼 -->
				<input type="button" href="javascript:" onClick="imagePopup('open')"
					class="btn btn-outline-secondary btn-lg" value="상품 문의하기" id="popBtn" />
				<div id="layer" style="display: none">
					<!-- visibility:hidden 으로 설정하여 해당 div안의 모든것들을 가려둔다. -->
					<div class="container">
						<form name="frmMain" method="post"
							onsubmit="return handleSubmit();" id="form">
							<div id="popHead">
								<div class="popHeadEnd">
									<h1>상품 문의하기</h1>
								</div>
							</div>
							<br>
							<div class="popbody_con">
								<div class="prdc_qna_wrap">
									<div class="tblwrap">
										<table class="tbl">
											<colgroup>
												<col style="width: 15%">
												<col style="width: 85%">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row" class="first alignL">문의 유형</th>
													<td class="alignL">
														<div class="select_wrap">
															<label for="type1"><input type="radio"
																name="q_type" id="type1" value="1">상품</label> <label
																for="type2"><input type="radio" name="q_type"
																id="type2" value="2">배송</label> <label for="type3"><input
																type="radio" name="q_type" id="type3" value="3">반품/취소</label>
															<label for="type4"><input type="radio"
																name="q_type" id="type4" value="4">교환/변경</label> <label
																for="type5"><input type="radio" name="q_type"
																id="type5" value="5">기타</label>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row" class="first alignL"><label
														for="brdInfoCont">내용</label></th>
													<td class="alignL"><textarea name="question"
															id="question" rows="10" cols="80"
															placeholder="문의 유형을 선택해주시고 궁금하신 내용을 적어주세요.&#13;&#10;*개인정보가 포함된 글은 비밀글로 등록됩니다."></textarea>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											name="serect" id="serect"> <label
											class="form-check-label" for="serect"> 비밀글로 문의하기 </label>
									</div>
									<p class="text_secret" id="paraSecretYn" style="display: none">비밀글로
										등록됩니다.</p>
									<div class="notice_box">
										<h2 class="tit">문의 시 유의사항</h2>
										<ul>
											<li>개인정보가 포함된 글은 비밀글로 등록됩니다.(예: 전화번호, 이메일 등)</li>
											<li>부적절한 게시물 등록 시 ID이용 제한 및 게시물이 삭제될 수 있습니다.(예: 할인/직거래
												유도, 비방/욕설/명예훼손, 가격비교, 광고 등)</li>
											<li>상품에 대한 단순 불만이나 판매자에게 불리한 내용이라는 이유로는 삭제되지 않습니다.</li>
										</ul>
									</div>
								</div>
								<div class="btn_wrap">
									<input type="hidden" name="pro_id" value="${pro_id}"
										id="pro_id"> <input type="hidden" name="id"
										value="${id}" id="id">
									<button type="submit" id="btnSave" class="btn btn-secondary">
										<span>등록</span>
									</button>
									<button type="button" id="btnClose" class="btn btn-secondary">
										<span>취소</span>
									</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- QnA 팝업창 끝 -->
					<table>
						<tr>
							<th>문의유형</th>
							<th></th>
							<th>문의/답변</th>
							<th>작성자</th>
							<th>작성일</th>
							<th></th>
						</tr>
						<c:forEach var="qna" items="${qnaList}">
							<tr>
								<td>
									<!--1 = 상품, 2 = 배송, 3 = 반품/취소, 4 = 교환/변경, 5 = 기타 --> <c:choose>
										<c:when test="${qna.q_type eq 1}"> 상품 </c:when>
										<c:when test="${qna.q_type eq 2}"> 배송 </c:when>
										<c:when test="${qna.q_type eq 3}"> 반품/취소 </c:when>
										<c:when test="${qna.q_type eq 4}"> 교환/변경 </c:when>
										<c:when test="${qna.q_type eq 5}"> 기타 </c:when>
									</c:choose>
								</td>
								<td>
									<!-- 1 - 대기중, 2 - 답변완료 --> <c:choose>
										<c:when test="${qna.status eq 1}"> 대기중 </c:when>
										<c:when test="${qna.status eq 2}"> 답변완료 </c:when>
									</c:choose>
								</td>
								<td><c:choose>
										<c:when test="${qna.secret == 'N'}">
											<button type="button" class="qnaBtn"
												style="border: none; background-color: white;">${qna.question}</button>
										</c:when>
										<c:when test="${qna.secret == 'Y'}">
											<c:choose>
												<c:when test="${qna.id != id}">
									                🔒비밀글입니다.
									            </c:when>
												<c:otherwise>
													<button type="button" class="qnaBtn"
														style="border: none; background-color: white;">🔒${qna.question}</button>
												</c:otherwise>
											</c:choose>
										</c:when>
									</c:choose></td>
								<td>${qna.nickname}</td>
								<td>${qna.q_created}</td>
								<td><c:choose>
										<c:when test="${qna.id == id}">
										 <div class="buttonQnA">
											<input type="hidden" class="qna_id" value="${qna.qna_id}">
											<button type="button" id="modifyQ" href="javascript:"
												onClick="modify('open')" class="modifyQ">수정</button>
											<button type="button" id="deleteQ" class="deleteQ">삭제</button>
											</div>
										</c:when>
									</c:choose>
								<td>
							</tr>
							<tr class="panel">
								<td>답변</td>
								<td colspan="3"><p>${qna.answer}</p></td>
								<td>${qna.a_created }</td>
							</tr>
						</c:forEach>
					</table>
				 <div style="text-align: center; font-size:17px; margin: 10px;"><a href="/QnA?pro_id=${pro_id}&nowpage=1">${qnaCount}건의 질문 모두 보기 ></a></div>
				</div>
				
				<!-- QnA 수정 팝업창 -->
					<div class="overlay" id="overlay"></div>
					<div id="modifylayer">
					    <!-- visibility:hidden 으로 설정하여 해당 div안의 모든것들을 가려둔다. -->
					    <div class="popcontainer">
					        <form name="frmMain" method="post" id="form">
					            <div id="popHead">
					                <div class="popHeadEnd">
					                    <h1>상품문의 수정하기</h1>
					                </div>
					            </div>
					            <br>
					            <div class="popbody_con">
					                <div class="prdc_qna_wrap">
					                    <div class="tblwrap">
					                        <table class="tbl">
					                            <colgroup>
					                                <col style="width: 15%">
					                                <col style="width: 85%">
					                            </colgroup>
					                            <tbody>
					                                <tr>
					                                    <th scope="row" class="first alignL">문의 유형</th>
					                                    <td class="alignL">
					                                        <div class="select">
					                                            <label for="type1"><input type="radio" name="q_type" id="type1" value="1" disabled>상품</label>
					                                            <label for="type2"><input type="radio" name="q_type" id="type2" value="2" disabled>배송</label>
					                                            <label for="type3"><input type="radio" name="q_type" id="type3" value="3" disabled>반품/취소</label>
					                                            <label for="type4"><input type="radio" name="q_type" id="type4" value="4" disabled>교환/변경</label>
					                                            <label for="type5"><input type="radio" name="q_type" id="type5" value="5" disabled>기타</label>
					                                        </div>
					                                    </td>
					                                </tr>
					                                <tr>
					                                    <th scope="row" class="first alignL"><label for="brdInfoCont">내용</label></th>
					                                    <td class="alignL"><textarea name="question" id="modifyQuestion" rows="10" cols="80" placeholder=""></textarea></td>
					                                </tr>
					                            </tbody>
					                        </table>
					                    </div>
					                    <div class="form-check">
					                        <input class="form-check-input" type="checkbox" value="" name="serect" id="modifySerect">
					                        <label class="form-check-label" for="serect"> 비밀글로 문의하기 </label>
					                    </div>
					                    <p class="text_secret" id="paraSecretYn" style="display: none">비밀글로 등록됩니다.</p>
					                    <div class="notice_box">
					                        <h2 class="tit">문의 시 유의사항</h2>
					                        <ul>
					                            <li>개인정보가 포함된 글은 비밀글로 등록됩니다.(예: 전화번호, 이메일 등)</li>
					                            <li>부적절한 게시물 등록 시 ID이용 제한 및 게시물이 삭제될 수 있습니다.(예: 할인/직거래 유도, 비방/욕설/명예훼손, 가격비교, 광고 등)</li>
					                            <li>상품에 대한 단순 불만이나 판매자에게 불리한 내용이라는 이유로는 삭제되지 않습니다.</li>
					                        </ul>
					                    </div>
					                </div>
					                <div class="btn_wrap">
					                    <input type="hidden" name="qna_id" id="qna_id">
					                    <button type="submit" id="buttonSave" class="btn btn-secondary">
					                        <span>등록</span>
					                    </button>
					                    <button type="button" id="buttonClose" class="btn btn-secondary">
					                        <span>취소</span>
					                    </button>
					                </div>
					            </div>
					        </form>
					    </div>
					</div>
				<!-- QnA 수정 팝업창 끝 -->
			</section>
			<!-- Q&A 끝 -->

			<section id="section4">
				<div class="return">
					<h2>반품/교환 정보</h2>
					<table>
						<tr>
							<th>반품/교환 배송비</th>
							<td>(구매자귀책) 3,000원/6,000원 초기배송비 무료시 반품배송비 부과방법 : 왕복(편도x2)</td>
						</tr>
						<tr>
							<th>반품/교환지 주소</th>
							<td>${address}</td>
						</tr>
						<tr>
							<th>반품/교환 안내</th>
							<td>${tel}로문의요망</td>
						</tr>
					</table>

					<h2>반품/교환 기준</h2>
					<div class="criteria">
						상품 수령 후 7일 이내에 신청하실 수 있습니다. 단, 제품이 표시·광고 내용과 다르거나, 계약과 다르게 이행된 경우는
						제품 수령일로부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 교환/반품이 가능합니다. <br>
						<br> 추가적으로 다음의 경우 해당하는 반품/교환은 신청이 불가능할 수 있습니다:
						<ul>
							<li>소비자의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우 (단지, 상품 확인을 위한 포장 훼손은
								제외)</li>
							<li>소비자의 사용 또는 일부 소비에 의해 상품의 가치가 현저히 감소한 경우</li>
							<li>시간의 경과에 의해 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우</li>
							<li>복제가 가능한 상품 등의 포장을 훼손한 경우</li>
							<li>소비자의 주문에 따라 개별적으로 생산되는 상품이 제작에 들어간 경우</li>
						</ul>
					</div>
				</div>
				
				<div class="seller">
					<h2>판매자 정보</h2>
					<table>
						<tr>
							<th>판매자</th>
							<td>${ bname }</td>
							<th>사업자구분</th>
							<td>법인사업자</td>
						</tr>
						<tr>
							<th>고객문의 대표번호</th>
							<td>${ tel }</td>
							<th>고객 문의 가능시간</th>
							<td>10시 ~ 16시 (점심시간, 토요일, 일요일, 공휴일 제외)</td>
						</tr>
						<tr>
							<th>영업소재지</th>
							<td colspan="3">${address}</td>
						</tr>
					</table>
				</div>
			</section>
		</div>
		<!-- 상세페이지 끝 -->

		<!--															 스크립트들 시작															 -->

		<!-- 상세페이지 스크립트 -->
		<script src="/js/header.js"></script>
		<script type="text/javascript">
	  window.onscroll = function() {makeSticky()};
	  var navbar = document.getElementById("navbar");
	  var sticky = navbar.offsetTop;
	
	  function makeSticky() {
	      if (window.pageYOffset >= sticky) {
	          navbar.classList.add("sticky");
	      } else {
	          navbar.classList.remove("sticky");
	      }
	  }
	 </script>

		<!-- 이미지 클릭시 확대 -->
		<script>
        document.querySelectorAll('.mini span').forEach(span => {
            span.addEventListener('click', function() {
                var bigImage = document.getElementById('bigImage');
                var newSrc = this.getAttribute('data-image');
                bigImage.setAttribute('src', newSrc);
            });
        });
    </script>


		<!-- +/- 버튼과 총 금액 -->
		<script>
		document.addEventListener("DOMContentLoaded", () => {
		    let addToCartButton = document.querySelector("#addToCart");
		    let buyBtn = document.querySelector("#buy");
		    let plus = document.querySelector(".plus");
		    let minus = document.querySelector(".minus");
		    let result = document.querySelector("#result");
		    let price = parseInt(document.querySelector('#pro_price').value);
//		    let price = parseInt(document.querySelector("#pro_price").textContent);  // 가격을 숫자로 변환
		    let totalcost = document.querySelector(".totalcost");
		    let maxCount = parseInt(document.querySelector('#prod_count').value);
		    let hiddenPriceInput = document.querySelector("#price");
		    let deliveryChargeInput = document.querySelector("#delivery_charge");
		    let countInput = document.querySelector("#count");
		    let i = 1;
		
		    function updateTotalCost() {
		        let totalcostNum = i * price;
		        let deliveryCharge = 0;
		        
		
		        if (totalcostNum < 25000) {
		            deliveryCharge = 3000;
		            document.getElementById("delivery").innerHTML = "└ 배송비 ₩3,000 (₩25,000이상 무료배송)"
		            fcost = totalcostNum.toLocaleString();
		            document.getElementById("finprice").innerHTML = "└ 총 상품금액 ₩"+fcost;
		            document.getElementById("finalprice").innerHTML = "₩"+fcost;
		        }else {
		        		deliveryCharge = 0;
		        		document.getElementById("delivery").innerHTML = "└ 무료배송 (₩25,000이상 무료배송)"
		        		fcost = totalcostNum.toLocaleString();
		        		document.getElementById("finprice").innerHTML = "└ 총 상품금액 ₩"+fcost;
		        		document.getElementById("finalprice").innerHTML = "₩"+fcost;
		        }
		        
		        let finalCost = totalcostNum + deliveryCharge;
		        totalcost.textContent = "₩" + finalCost.toLocaleString();
		        hiddenPriceInput.value = totalcostNum;
		        deliveryChargeInput.value = deliveryCharge;
		    }
		    		
		    function updateCount(action) {
		        if (action === "plus" && i < maxCount) {
		            i++;
		        } else if (action === "minus" && i > 1) {
		            i--;
		        }
		        countInput.value = i;
		        result.textContent = i;
		        updateTotalCost();
		    }
		    
		    plus.addEventListener("click", () => updateCount("plus"));
		    minus.addEventListener("click", () => updateCount("minus"));
		
		    updateTotalCost();
		    
		    
				// 장바구니
	      addToCartButton.addEventListener("click", (event) => {
	              
	              
          // 필요한 필드들 가져오기
          let id = parseInt(document.querySelector("#id").value);
          let pro_id = parseInt(document.querySelector("#pro_id").value);
          let count = parseInt(document.querySelector("#count").value);
          let price = parseInt(document.querySelector("#price").value);
          let delivery_charge = parseInt(document.querySelector("#delivery_charge").value);
  
          console.log("데이터:", { id, pro_id, count, price, delivery_charge });
          
          const basketData = {
              id: id,
              pro_id: pro_id,
              count: count,
              price: price,
              delivery_charge: delivery_charge
          };

          const basketJSON = JSON.stringify(basketData);

          fetch('/cart', {
              method: 'POST',
              headers: {
                  'Content-Type': 'application/json'
              },
              body: basketJSON
          })
            .then(response => response.json())
	          .then(data => {
	              console.log("응답 데이터:", data); // 디버깅용 로그
	              const notice = document.getElementById("offcanvasRightLabel");
	              if (data.status === 'new' || data.status === 'existing') {
	            	  notice.innerHTML = data.message;
	                  console.log("정상응답");
	              } else if (data.status === 'error') {
	            	  notice.innerHTML = data.message;
	                  console.log("에러응답");
	              }
	          })
	          .catch(error => {
	              console.error('Error:', error);
	          });
	      });
					
					// 바로 구매
			    buyBtn.addEventListener("click", (event) => {
		   	
		    	// 필요한 필드들 가져오기
		        let id = parseInt(document.querySelector("#id").value);
		        let pro_id = parseInt(document.querySelector("#pro_id").value);
		        let count = parseInt(document.querySelector("#count").value);
		        let price = parseInt(document.querySelector("#price").value);
		        let delivery_charge = parseInt(document.querySelector("#delivery_charge").value);
		
		        console.log("데이터:", { id, pro_id, count, price, delivery_charge });
		        
		        const basketData = {
		            id: id,
		            pro_id: pro_id,
		            count: count,
		            price: price,
		            delivery_charge: delivery_charge
		        };
		
		        const basketJSON = JSON.stringify(basketData);
		
		        fetch('/buy', {
		            method: 'POST',
		            headers: {
		                'Content-Type': 'application/json'
		            },
		            body: basketJSON
		        })
		         .then(response => response.json())
		        .then(data => {
		            console.log("응답 데이터:", data); // 디버깅용 로그      
		        })
		        .catch(error => {
		            console.error('Error:', error);
		        });
		
		    });
		
		});
	</script>

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
		<!-- 장바구니 추천상품 별 -->
		<script>
    document.addEventListener('DOMContentLoaded', function() {
        // 
        document.querySelectorAll('.recoAvg').forEach(starScoreElement => {
            // 데이터 속성에서 별점 값 가져오기
            const avgstar = parseFloat(starScoreElement.getAttribute('data-reco-rating'));
            
            const fullStars = Math.floor(avgstar);
            const partialStar = avgstar - fullStars;
            const percentage = Math.round(partialStar * 100)
            
            // 현재 리뷰의 별 요소들 가져오기
            const stars = starScoreElement.nextElementSibling.querySelectorAll('.recoStar');
            
            // 별 채우기
            stars.forEach((recoStar, index) => {
                if (index < fullStars) {
                		recoStar.classList.add('full');
                   } else if (index == fullStars) {
                	   recoStar.innerHTML = '<div class="fill" style="width: ' +  percentage + '%;"></div>';
                   }
            });
        });
    });
    </script>

		<!-- 별1 -->
		<script>
    document.addEventListener('DOMContentLoaded', function() {
			
       const avgstar = parseFloat(document.querySelector('#avgStar').value);

       // 정수 부분과 소수 부분 계산
       const fullStars = Math.floor(avgstar);
       const partialStar = avgstar - fullStars;
       const percentage = Math.round(partialStar * 100)
       
       // 현재 리뷰의 별 요소들 가져오기
       const stars = document.querySelectorAll('#starRating .avgStar');
       
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

		<!-- 별2 -->
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

		<!-- 위시리스트에 추가 -->
		<script type="text/javascript">
     document.addEventListener("DOMContentLoaded", (event) => {
         let id = parseInt(document.querySelector("#id").value);
         let pro_id = parseInt(document.querySelector("#pro_id").value);
         let wishBtn = document.querySelector("#wishBtn");        
         
         const checkData = {
             id: id,
             pro_id: pro_id
         };
         
         const checkJSON = JSON.stringify(checkData);

         fetch("/checkWishlist", {
             method: "POST",
             headers: {
                 'Content-Type': 'application/json'
             },
             body: checkJSON
         })
         .then(response => response.json())
         .then(data => {
             if (data.status === "existing") {
                 wishBtn.classList.add("filled");
		         }else{
		       	  wishBtn.classList.remove("filled");
		         }
         })
         .catch(error => {
             console.error("Error:", error);
         });
     });

            
      wishBtn.addEventListener("click", (event) => {
          let id = parseInt(document.querySelector("#id").value);
          let pro_id = parseInt(document.querySelector("#pro_id").value);
          
          const wishData = {
                  id: id,
                  pro_id: pro_id
              };
          
          const wishJSON = JSON.stringify(wishData);

          fetch("/addWishlist", {
              method: "POST",
              headers: {
                  'Content-Type': 'application/json'
              },
              body: wishJSON
          })
          .then(response => response.json())
          .then(data => {
              console.log(data);
              alert(data.msg);

              if (data.status === "new") {
                  wishBtn.classList.add("filled");
                  wishBtn.classList.remove("unfilled");
              } else if (data.status === "existing") {
                  wishBtn.classList.add("unfilled");
                  wishBtn.classList.remove("filled");
              }
          })
          .catch(error => {
              console.error("Error:", error);
          });
      });    
  </script>

		<!-- 추천에서 위시리스트에 추가 -->
	>

		<!-- 리뷰 페이징 -->
		<script type="text/javascript">
    $(document).ready(function() {
        $(document).on('click', '.page-link', function(e) {
            e.preventDefault();
            var page = $(this).attr('data-page');
            var pro_id = $('#pro_id').val();

            console.log('페이지 클릭됨:', page); // 디버깅용 로그

            $.ajax({
                url: '/Detail',
                type: 'GET',
                data: {
                    nowpage: page,
                    pro_id: pro_id
                },
                headers: {
                    'X-Requested-With': 'XMLHttpRequest'
                },
                success: function(response) {
                    console.log('AJAX 요청 성공:', response); // 디버깅용 로그
                    $('.reviewTable').html($(response).find('.reviewTable').html());
                    $('.paging-bottom-container').html($(response).find('.paging-bottom-container').html());
                },
                error: function(xhr) {
                    console.error('AJAX 요청 실패:', xhr); // 디버깅용 로그
                }
            });
        });
    });
	</script>
	
			<!-- Q&A 리스트 -->
		<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function () {
        let openAnswerRow = null;

        document.querySelectorAll('.qnaBtn').forEach(function(button){
            button.addEventListener('click', function() {
                var answerRow = this.parentElement.parentElement.nextElementSibling;
                if (openAnswerRow && openAnswerRow !== answerRow) {
                    openAnswerRow.style.display = "none";
                }
                if (answerRow.style.display === "table-row") {
                    answerRow.style.display = "none";
                    openAnswerRow = null;
                } else {
                    answerRow.style.display = "table-row";
                    openAnswerRow = answerRow;
                }
            });
        });
    })
  </script>

		<!-- Q&A -->
		<script type="text/JavaScript"
			src="http://code.jquery.com/jquery-1.7.min.js"></script>
		<script type="text/javascript">
    function imagePopup(type) {
        if (type === 'open') {
            jQuery('#layer').css('display', 'inline');
            jQuery('#layer').height(jQuery(document).height());
         } else if (type === 'close') {
            jQuery('#layer').css('display', 'none');
         }
	    }
	
	    $(document).ready(function() {
	        $('#btnClose').click(function() {
	            imagePopup('close');
	        });
	    });

	    function handleSubmit() {
	        const q_type = document.querySelector('input[name="q_type"]:checked').value;
	        const question = document.getElementById('question').value;
	        let secret = document.getElementById('serect').checked ? 'Y' : 'N';
	        const pro_id = document.getElementById('pro_id').value;
	        const id = document.getElementById('id').value;
	
	        if (question.includes('010') || question.includes('@')) {
	            secret = 'Y';
	            alert("개인정보가 포함되어 비밀글로 등록되었습니다.")
	        }
	
	        fetch('/qnaSubmit', {
	            method: 'POST',
	            headers: {
	                'Content-Type': 'application/json'
	            },
	            body: JSON.stringify({ q_type, question, secret, pro_id, id })
	        })
	        .then(response => {
	            if (response.ok) {
	                alert("질문 등록이 완료되었습니다.");
	                imagePopup('close');
	            } else {
	                alert("질문 등록에 실패했습니다.");
	            }
	        })
	        .catch(error => {
	            console.error('Error:', error);
	            alert("질문 등록 중 오류가 발생했습니다.");
	        });
	
	        return false; // 폼이 정상적으로 제출되지 않도록 false 반환
	    }
	</script>

	<!-- Q&A 수정하기 -->
	<script type="text/javascript">
	  function modify(type) {
	      if (type === 'open') {
	          jQuery('#modifylayer').css('display', 'block');
	          jQuery('#overlay').css('display', 'block');
	      } else if (type === 'close') {
	          jQuery('#modifylayer').css('display', 'none');
	          jQuery('#overlay').css('display', 'none');
	      }
	  }

	  document.addEventListener('DOMContentLoaded', function () {
	      document.querySelectorAll('.modifyQ').forEach(function(button){
	          button.addEventListener('click', function() {
	              // 버튼과 같은 행(row)을 찾음
	              let row = button.closest('tr');
	              // 같은 행에 있는 숨겨진 qna_id 값을 찾음
	              let qna_id = parseInt(row.querySelector('.qna_id').value);
	              console.dir(qna_id);

	              // 팝업을 열기 위한 코드
	              modify('open');

	              // 팝업에 qna_id 값 설정
	              let qna_id_input = document.getElementById('qna_id');
	              if (qna_id_input) {
	                  qna_id_input.value = qna_id;
	              } else {
	                  console.error("qna_id input element not found");
	              }
	          });
	      });

	      $('#buttonClose').click(function() {
	          modify('close');
	      });

	      $('#buttonSave').click(function() {
	          handleSubmit();
	      });

	      function handleSubmit() {
	    	    let q_type = document.querySelector('input[name="q_type"]:checked').value;
	          let question = document.getElementById('modifyQuestion').value;
	          let secret = document.getElementById('modifySerect').checked ? 'Y' : 'N';
	          let qna_id = document.getElementById('qna_id').value;

	          if (question.includes('010') || question.includes('@')) {
	              secret = 'Y';
	              alert("개인정보가 포함되어 비밀글로 등록되었습니다.");
	          }

	        	console.dir("qna_id"+qna_id)

	          fetch('/modifyQnA', {
	              method: 'POST',
	              headers: {
	                  'Content-Type': 'application/json'
	              },
	              body: JSON.stringify({ question, secret, qna_id })
	          })
	          .then(response => {
	              if (response.ok) {
	                  alert("질문 수정이 완료되었습니다.");
	                  modify('close');
	              } else {
	                  alert("질문 수정에 실패했습니다.");
	              }
	          })
	          .catch(error => {
	              console.error('Error:', error);
	              alert("질문 수정 중 오류가 발생했습니다.");
	          });
	      }
	  });
	</script>




	<!-- QnA 삭제  -->
	<script type="text/javascript">
  document.addEventListener('DOMContentLoaded', function () {
      document.querySelectorAll('.deleteQ').forEach(function(button){
          button.addEventListener('click', function() {
              // 버튼과 같은 행(row)을 찾음
              let row = button.closest('tr');
              // 같은 행에 있는 숨겨진 qna_id 값을 찾음
              let qna_id = row.querySelector('.qna_id').value
              console.dir(qna_id);
              
              let data = { qna_id: qna_id };
              let insertdata = JSON.stringify(data)
              
              fetch("/deleteQnA", {
                  method: "POST",
                  headers: {
                      'Content-Type': 'application/json'
                  },
                  body: insertdata
              })
              .then(response => response.json())
              .then(data => {
                  console.log('Success:', data);
                  alert("질문이 삭제되었습니다.");
                  row.remove();
              })
              .catch(error => {
                  console.error("Error:", error);
                  alert("질문 삭제에 실패했습니다. 다시 시도해주세요.");
              });
          });
      });
  });
  </script>


		<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
		<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>