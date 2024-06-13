<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

		#header {
		    position: fixed;
		    top: 0;
		    width: 100%;
		    z-index: 1000;
		    background-color: white; 
		    padding : 100px ;
		}

    /* 사이드바 */
    .sidenav {
      background-color: #f1f1f1;
      position: fixed;
      width: 333px;
      height: 100%;
      margin-left: 75%;
      margin-top:200px;
      display:inline-block; 
      justify-content : flex-end; 
      font-size:20px;
    }
    
    /* 본문 */
		.body { 
		     margin: 0; 
		     font-size:20px;
		     list-style-type: none;
		 }
		
		#intro {
				margin-top:350px ;
				margin-right : 300px;
		    height: 700px;
		}
		
		#section1{
				margin:0;
/* 				height: 1200px; */
 				margin-right: 400px;
 		    margin-left : 66px; 
		}
		#section2,#section3 {
		/* 		margin-top:250px; */
		    padding-top : 290px;
/* 		    height: 1200px; */
/* 		    border-bottom: 1px solid #ccc; */
		    margin-right: 400px;
		    margin-left : 66px;
		}
		
		#navbar {
				margin: 200px 30px 0px 50px;
		    display: flex;
		    justify-content: center;
		    padding: 10px 0;
		    background-color: #ED7802;
		    color: #fff;
		    width :1150px;
		}
		
		#navbar ul {
		    list-style-type: none;
		    padding: 0;
		    display: flex;
		}
		
		#navbar ul li {
				list-style-type: none;
		    margin: 0 15px;
		    
		}
		
		#navbar ul li a {
				list-style-type: none;
		    color: #fff;
		    text-decoration: none;
		}
		
		.sticky {
		    position: fixed;
		    top: 0;
		    width: 100%;
		    z-index: 1000;
		}
		#images{
				float:left;
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
		}
		.left, .right {
		    flex: 1;
		}
		
		.left {
		    padding-right: 20px;
		    text-align:center;
		}
		
		.right {
		    padding-left: 20px;
 		    text-align:left;
		}

		form {
				font-size: 20px;
		}
		.exapnd {
				width : 100%;
				height : 400px;
				display : flex;
				align-items: center;
				justify-content: center;
				margin-bottom: 20px;
		}
		.big  img {
				max-width:400px;
				max-height:400px;
		}
		.mini  span  img {
				display : inline-block;
				width : 60px;
				height : 60px;
				margin :10px;
				cursor: pointer;
		}
		
		/* 별 평점 구현 */
/* {
    font-family: Arial, sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    background-color: #f4f4f4;
}*/

.rating-container {
    background: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    display: flex;
    width: 600px;
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

.star-container {
      font-size: 36px;
      display: flex;
      align-items: center;
      gap: 10px;
    }

    .star {
      background: linear-gradient(to right, #EAB838, #EAB838 50%, #E0E2E7 50%);
      color: transparent;
      -webkit-background-clip: text;
    }

    .star-container .star-grade {
      font-weight: 700;
    }

.total-reviews {
    font-size: 14px;
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
    font-size: 14px;
}

.bar-container {
    display: flex;
    align-items: center;
    flex: 1;
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
    font-size: 14px;
    text-align: right;
}

.review-count {
    font-size: 12px;
    color: #666;
    margin-left: 5px;
}		
		/* 리뷰 */
		.reviewTable >table >tr> td{
				border-bottom: 1px solid #ccc;
		}
</style>
</head>
<body>
<div class="body">
	<div class="header"><%@include file="/WEB-INF/include/Header.jsp"%></div>
    <!-- 어사이드의 구매창 -->
    <div class="sidenav">
        <p class="sub-title">구매창</p>
					<form action="/Cart" class="buy">
						 <input type="hidden" name="id" id="">
						 <input type="hidden" name="pro_id" id="pro_id"value="${prod.pro_id}">
						 <input type="hidden" name="state" id="state" value="1">
						 <input type="hidden" name="price" id="price" value="">
						 <input type="hidden" name="delivery_charge" id="delivery_charge" value="">
						 <input type="hidden" name="count" id="count" value=""> <!-- 구매하는 상품의 수량 -->
					    <div id="name">${prod.name}</div>
					    <div>최대 구매 수량 ${prod.stock_count}</div>
					    <input type="hidden" value="${prod.stock_count}" id="prod_count"> <!-- 총 재고 -->
					    <input type='button' onclick='count("minus")' class="minus" value='-'/>
					    <span id='result'>1</span>
					    <input type='button' onclick='count("plus")' class="plus" value='+'/>
					    <!-- 상품 가격 -->
					    <div id="pro_price">${prod.pro_price}</div>
					    <!-- 총 금액 -->
					    <div>25,000원 이상 무료배송</div>
					    <div> 총 금액 </div>
					    <div class="totalcost"></div>
					    <button type="submit" id="addToCart">장바구니</button>
					    <button>구매하기</button>
					</form>
				</p>
				
				<!-- Scrollable modal -->
				<div class="modal-dialog modal-dialog-scrollable">
				  ...
				</div>>				
		</div>
		<!-- 어사이드의 구매창 끝 -->
		
		<!-- 상세페이지 -->
		<!-- 맨 위 요약페이지 -->
    <div class="content">
        <section id="intro">
       		<div class="left">
					  <div class="big" id="bigImageContainer">
					  	<img id="bigImage" src="img/영양제 사진 예시.png" alt="bigimage">
					  </div>
					  <div class="mini">
					  	<span data-image="img/영양제 사진 예시.png""><img src="img/영양제 사진 예시.png"" alt="1"></span>
					  	<span data-image="img/영양제1.png"><img src="img/영양제1.png" alt="2"></span>
					  	<span data-image="img/영양제2.png"><img src="img/영양제2.png" alt="3"></span>
					  	<span data-image="img/영양제2.png"><img src="img/영양제2.png" alt="4"></span>
					  	<span data-image="img/영양제2.png"><img src="img/영양제2.png" alt="5"></span>
					  </div> 
					</div>
					<div class="right">
						  <div> 별 평점 다시 넣어야함
			  				<div class="star-rating">
						        <span class="star" data-value="1">&#9733;</span>
						        <span class="star" data-value="2">&#9733;</span>
						        <span class="star" data-value="3">&#9733;</span>
						        <span class="star" data-value="4">&#9733;</span>
						        <span class="star" data-value="5">&#9733;</span>
						    </div>	    
						  <a href="#section2">리뷰보기(${recount})</a></div>
        			<div>${ prod.brand_name }</div>
        			<div>${ prod.name }</div>
        			<div id="pro_price">${ prod.pro_price }</div>
        			<div>찜하기</div>
					 </div>
        </section>
		<!-- 맨 위 요약페이지 끝 -->
        
		<!-- nav-bar -->
        <nav id="navbar">
            <ul>
                <li><a href="#section1">상품정보</a></li>
                <li><a href="#section2">리뷰(${recount})</a></li>
                <li><a href="#section3">상품 Q&A(FAQ)</a></li>
            </ul>
        </nav>

        <section id="section1">
            <h1>상품정보</h1>
            <p>
								<div>${ prod.name }</div>
								<div>${ prod.img }</div>
								<div>${ prod.url }</div>
								<div>${ prod.explain }</div>
								<div>${ prod.caution }</div>
								<div>${ prod.pro_price }</div>
								<div>${ prod.ingredients }</div>
						</p>
        </section>
        <section id="section2">
            <h1 style="border-bottom: 1px solid #ccc;">상품리뷰(${recount})</h1>
            
            <!-- 별 -->	
			    <div class="rating-container">3
					    <div class="left-section">
					        <div class="average-score">구매만족도</div>
									  <div class="star-grade" id="num" style="font-size:50px;">${avgstar}</div>
					        <!-- 별 색칠 -->
								  <div class="star-container">
								    <div class="star">★★★★★</div>
								  </div>
									<!-- 별 색칠 끝 -->
						        <div class="total-reviews" id="recount"></div>
						    </div>
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
				                    <div class="percentage"> ${one}%</div>
				                </div>
				            </div>
				        </div>
				    </div>
						<!-- 막대바 끝 -->
						
						<!-- 사람들 리뷰 시작 -->
            <div class="reviewTable">
            	<table>
								<c:forEach var="re" items="${ reviewList }">
									<tr>
										<td>id : ${ re.nick }</td>
										<td>${ re.created }</td>
									</tr>
									<tr>
										<td colspan="2">선택 옵션 : ${ re.pro_id }</td>
									</tr>
									<tr><td>별</td></tr>
									<tr>
										<td colspan="2">${ re.content }</td>
									</tr>
									<tr><td>${ re.img }</td></tr>
									<tr style="border-bottom: 1px solid #ccc;"><td>추천버튼</td></tr>
								</c:forEach>
            	</table>
			        <div class="d-flex justify-content-center paging-bottom-container">
								<%@include file="/WEB-INF/pagination/reviewPaging.jsp"%>
							</div>
            </div>
        </section>
        
        <!-- FAQ -->
<!--         <section id="section3"> -->
<!--         	<h3>자주 묻는 질문</h3> -->
<!--         		<div> -->
<%--         			<c:forEach var="faq" items="${faqList}"> --%>
<%--         				<button type="button" class="collapsible" onclick="collapse(this);">${faq.question}</button> --%>
<!--         				<div class="content"> -->
<%--         					<p>${faq.answer }</p> --%>
<!--         				</div> -->
<%--         			</c:forEach> --%>
<!--         		</div> -->
<!--         </section> -->
    <!-- FAQ 끝 -->
    </div>
    <!-- 상세페이지 끝 -->
	
	<!-- 스크립트들 -->	
	<!-- 상세페이지 스크립트 -->
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
	<!-- faq 아코디언 -->
<!--   <script>
   function collapse(element) {
       var before = document.getElementsByClassName("active")[1]               // 기존에 활성화된 버튼
       if (before && document.getElementsByClassName("active")[1] != element) {  // 자신 이외에 이미 활성화된 버튼이 있으면
           before.nextElementSibling.style.maxHeight = null;   // 기존에 펼쳐진 내용 접고
           before.classList.remove("active");                  // 버튼 비활성화
       }
       element.classList.toggle("active");         // 활성화 여부 toggle

       var content = element.nextElementSibling;
       if (content.style.maxHeight != 0) {         // 버튼 다음 요소가 펼쳐져 있으면
           content.style.maxHeight = null;         // 접기
       } else {
           content.style.maxHeight = content.scrollHeight + "px";  // 접혀있는 경우 펼치기
       }
   }
  </script>   -->

<!-- 별 -->
<script type="text/javascript">
	const inputValue = document.querySelector('#num'),
	form = document.querySelector('#form'),
	star = document.querySelector('.star');
	starGrade = document.querySelector('.star-grade');
	

	console.log(inputValue.value)
	starGrade.innerText = inputValue.value;
	
	let starGradeNum = (inputValue.value / 5) * 100;
	star.style.cssText = `background: linear-gradient(to right, #EAB838, #EAB838 ${starGradeNum}%, #E0E2E7 ${starGradeNum}%); color:transparent; background-clip: text;`
	})
</script>

<!-- +/- 버튼과 총 금액 -->
<script type="text/javascript">
let plus = document.querySelector(".plus");
let minus = document.querySelector(".minus");
let result = document.querySelector("#result");
let price = parseInt(document.querySelector("#pro_price").textContent);  // 가격을 숫자로 변환
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
    }

    let finalCost = totalcostNum + deliveryCharge;
    totalcost.textContent = "₩" + finalCost.toLocaleString();
    hiddenPriceInput.value = totalcostNum;
    deliveryChargeInput.value = deliveryCharge;
}

plus.addEventListener("click", () => {
    if (i < maxCount) {
        i++;
        result.textContent = i;
        countInput.value = i;
        updateTotalCost();
    }
});

minus.addEventListener("click", () => {
    if (i > 1) {
        i--;
        result.textContent = i;
        countInput.value = i;
        updateTotalCost();
    }
});

updateTotalCost();
</script>

</div>
</body>
</html>
