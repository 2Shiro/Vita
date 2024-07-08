<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
 #header{
 		background-color: white;
 		position: fixed;
	top: 0;
	z-index: 5;
	il,ul {
		list-style-type: none;
	}
 }
/* 질문하기 팝업창 */
.qnacontainer{
	margin : 150px 150px 0 150px; 
}
.container {
	width: 760px;
	justify-content: center;
	z-index:1000000;
	.tbl tr {
		margin: 10px;
		width: 100%;
		}
	}
#prodImg{
	 height : 80px;
	 width : 80px;
}
#link {
		font-size : 20px;
		color: black;
		text-decoration-line: none;
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
		z-index :15000;
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


/*offcanvas*/
#addToCart {
	text-align : right;
	margin : 30px;
}

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
/**/
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
/*검색*/
#search{
	float: right;
	margin-bottom : 0px;
	height : 36px;
	
}
#popBtn {
	float: left;
	margin: 20px;
	height: 36px;
}

/**/
  #header{
   		background-color: white;
   		position: fixed;
			top: 0;
			z-index: 1000;
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
	}
	.buttons{
		display : flex;
		justify-content: space-between;
	}
	.starContainer {
	width : 100%;
	display: flex;
	align-items: center;
	justify-content : center;
}
.dropdown {
    position: relative;
}

.select-label {
    position: absolute;
    top: -8px;
    left: 10px;
    background-color: white;
    padding: 0 5px;
    font-size: 12px;
    color: #666;
}

.styled-select {
    padding: 10px 10px 10px 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 14px;
    background-color: #fff;
    appearance: none;
    -moz-appearance: none;
    -webkit-appearance: none;
}
</style>
</head>
<body>
<div id="header"><%@include file="/WEB-INF/include/Header.jsp" %></div>
	<div class="navbar">
	<span><a href="/Detail?pro_id=${prod.pro_id}&nowpage=1"><img id="prodImg" src="img/${ prod.image }.jpg" alt="prodImg"><span id="link">${ prod.name }</span></a></span>
	<span><button id="addToCart" class="btn btn-outline-dark btn-lg" type="button" data-bs-toggle="offcanvas"
								data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">장바구니에 담기</button></span>
				<input type="hidden" name="id" id="id" value="${id}">
				<input type="hidden" name="pro_id" id="pro_id" value="${prod.pro_id}">
				<input type="hidden" name="state" id="state" value="1"> 
				<input type="hidden" name="price" id="price" value="${prod.pro_price}"> 
				<input type="hidden" name="delivery_charge" id="delivery_charge" value="">
				<input type="hidden" name="count" id="count" value="1">
	</div>
	<div class="qnacontainer">
			<div class="buttons">
					<!-- 팝업창 문의 버튼 -->
				<input type="button" href="javascript:" onClick="imagePopup('open')"
							class="btn btn-outline-secondary btn-lg" value="상품 문의하기" id="popBtn" />
					
				<div id="layer" style="display: none">
					<!-- visibility:hidden 으로 설정하여 해당 div안의 모든 것들을 가려둔다. -->
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
												<col style="width: 30%">
												<col style="width: 70%">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row" class="first alignL">문의 유형</th>
													<td class="alignL">
														<div class="select_wrap">
															<label for="type1"><input type="radio"
																name="q_type" id="type1" value="1">상품</label>
																<label for="type2"><input type="radio" name="q_type" id="type2" value="2">배송</label> 
																<label for="type3"><input type="radio" name="q_type" id="type3" value="3">반품/취소</label>
															<label for="type4"><input type="radio"
																name="q_type" id="type4" value="4">교환/변경</label>
															<label for="type5"><input type="radio" name="q_type"
																id="type5" value="5">기타</label>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row" class="first alignL"><label	for="brdInfoCont">내용</label></th>
													<td class="alignL"><textarea name="question" id="question" rows="10" cols="80"
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
			  <!-- 검색 -->
				<form class="d-flex justify-content-end mt-3" role="search"  id="search"
					    action="/QnA?nowpage=1&pro_id=${prod.pro_id}" method="POST">
					<c:choose>
						<c:when test="${q_type eq 'none'}">
							<label for="category">카테고리</label>
	            <select id="category" name="q_type" class="form-select" aria-label="Default select example" style="width:150px; margin-right :20px;">
	                <option selected>전체</option>
	                <option value="1">상품</option>
	                <option value="2">배송</option>
	                <option value="3">반품/취소</option>
	                <option value="4">교환/변경</option>
	                <option value="5">기타</option>
	            </select>
		         </c:when>
		         <c:otherwise>
		            <select id="category"  name="q_type" class="form-select" aria-label="Default select example" style="width:150px; margin-right :20px;">
	                <option selected value="0">문의유형</option>
	                <option value="0">------------</option>
	                <option value="1">상품</option>
	                <option value="2">배송</option>
	                <option value="3">반품/취소</option>
	                <option value="4">교환/변경</option>
	                <option value="5">기타</option>
		            </select>
		         </c:otherwise>
		      </c:choose>
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
			</div>
			<!-- 검색 끝 -->
			<!-- qna 리스트 -->		
					<table>
						<tr>
							<th>문의유형</th>
							<th></th>
							<th>문의/답변</th>
							<th>작성자</th>
							<th>작성일</th>
							<th></th>
						</tr>
						<c:forEach var="qna" items="${response.list}">
							<tr>
								<td>
									<!--1 = 상품, 2 = 배송, 3 = 반품/취소, 4 = 교환/변경, 5 = 기타 --> 
									<c:choose>
										<c:when test="${qna.q_type eq 1}"> 상품 </c:when>
										<c:when test="${qna.q_type eq 2}"> 배송 </c:when>
										<c:when test="${qna.q_type eq 3}"> 반품/취소 </c:when>
										<c:when test="${qna.q_type eq 4}"> 교환/변경 </c:when>
										<c:when test="${qna.q_type eq 5}"> 기타 </c:when>
									</c:choose>
								</td>
								<td>
								<!-- 	1 - 대기중, 2 - 답변완료  -->
									<c:choose>
										<c:when test="${qna.status eq 1}"> 대기중 </c:when>
										<c:when test="${qna.status eq 2}"> 답변완료 </c:when>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${qna.secret == 'N'}">
											<button type="button" class="qnaBtn" style="border: none; background-color: white;">${qna.question}</button>
										</c:when>
										<c:when test="${qna.secret == 'Y'}">
											<c:choose>
												<c:when test="${qna.id != id}">🔒비밀글입니다.</c:when>
												<c:otherwise> 
													<button type="button" class="qnaBtn" style="border: none; background-color: white;">🔒${qna.question}</button>
												</c:otherwise>
											</c:choose>
										</c:when>
									</c:choose>
								</td>
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
								</td>
							</tr>
							<tr class="panel">
								<td>답변</td>
								<td colspan="3"><p>${qna.answer}</p></td>
								<td>${qna.a_created }</td>
							</tr>
						</c:forEach>
					</table>
				<div class="d-flex justify-content-center paging-bottom-container">
					<%@include file="/WEB-INF/pagination/qnaPaging.jsp"%>
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
					                        <label class="form-check-label" for="modifySerect"> 비밀글로 문의하기 </label>
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
							<!-- Q&A 리스트 -->
		<script src="/js/header.js"></script>
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
		<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
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
		      document.getElementById('modifylayer').style.display = 'block';
		      document.getElementById('overlay').style.display = 'block';
		    } else if (type === 'close') {
		      document.getElementById('modifylayer').style.display = 'none';
		      document.getElementById('overlay').style.display = 'none';
		    }
		  }

		  document.addEventListener('DOMContentLoaded', function () {
		    document.querySelectorAll('.modifyQ').forEach(function(button) {
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
		    
		    
		    document.getElementById('buttonClose').addEventListener('click', function() {
		      modify('close');
		    });

		    document.getElementById('buttonSave').addEventListener('click', function() {
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

		      console.dir("qna_id" + qna_id);

		      fetch('/modifyQnA', {
		        method: 'POST',
		        headers: {
		          'Content-Type': 'application/json'
		        },
		        body: JSON.stringify({ question, secret, qna_id })
		      })
		      .then(response => {
		        if (response.ok) {
		        	console.dir("돼라")
		          alert("질문 수정이 완료되었습니다.");
		          modify('close');
		        } else {
		        	console.dir("안돼냐?")
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