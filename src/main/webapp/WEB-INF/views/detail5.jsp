<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니</title>
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
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
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
      background-color: white;
      border-left: 1px solid #ECEFF7;
      position: fixed;
      width: 333px;
      height: 100%;
      margin-left: 75%;
      margin-top:200px;
      display:inline-block; 
      justify-content : flex-end; 
      font-size:23px;
      padding : 25px;
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
 				margin-right: 400px;
 		    margin-left : 66px; 
		}
		#section2,#section3 {
		    padding-top : 290px;
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

        .star-rating {
            display: flex;
            direction: row;
        }
        .star {
            width: 30px;
            height: 30px;
            background: url('star-empty.png') no-repeat center center;
            background-size: contain;
            position: relative;
        }
        .star.full {
            background: url('star-full.png') no-repeat center center;
            background-size: contain;
        }
        .star.partial::before {
            content: '';
            display: block;
            height: 100%;
            background: url('star-full.png') no-repeat center center;
            background-size: contain;
            position: absolute;
            top: 0;
            left: 0;
            z-index: 1;
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
		.like-button.liked {
    color: red; /* Example: Change color to red */
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
#offcanvasRightLabel{
	font-size:22px;
	padding : 12px;
}
a{
	color:black;
	text-decoration-line: none;
}
a:hover{
	text-decoration-line: underline;
}
td > img{
	width:120px;
	height :130px;
}
  .unfill {
      color: grey;
  }
  .fill {
    color: red;
  }
/* section3 */

</style>
</head>
<body>
<div class="body">
    <div class="header"><%@include file="/WEB-INF/include/Header.jsp"%></div>
    <!-- 어사이드의 구매창 -->
    <div class="sidenav">
        <p class="sub-title">구매창</p>
        <form id="cartForm" method="POST" >
            <input type="hidden" name="id" id="id" value="${id}">
            <input type="hidden" name="pro_id" id="pro_id" value="${prod.pro_id}">
            <input type="hidden" name="state" id="state" value="1">
            <input type="hidden" name="price" id="price" value="">
            <input type="hidden" name="delivery_charge" id="delivery_charge" value="">
            <input type="hidden" name="count" id="count" value="1">
            <div id="name">${prod.name}</div>
            <div style="font-size:15px;">최대 구매 수량 ${prod.stock_count}</div>
            <input type="hidden" value="${prod.stock_count}" id="prod_count">
							<input type='button' class="minus" value='-'/>
							<span id='result'>1</span>
							<input type='button' class="plus" value='+'/>
            <div id="pro_price">${prod.pro_price}</div>
            <div>25,000원 이상 무료배송</div>
            <div> 총 금액 </div>
            <div class="totalcost"></div>
            <button id="addToCart" class="btn btn-outline-dark btn-lg" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">장바구니</button>
            <button id="buy" class="btn btn-outline-dark btn-lg" type="button" onclick="location.href='/Pay/PayForm'" >구매하기</button>
        </form>
    </div>
<!--     어사이드의 구매창 끝 -->

			<!-- offcanvas -->
			<div class="offcanvas offcanvas-end  tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
			  <div class="offcanvas-header">
			    <h5 id="offcanvasRightLabel"></h5>
			    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
			  </div>
			  <div class="offcanvas-body">
			    <div>함께 보시면 좋은 상품</div>
			    <table>
			    	<c:forEach var="re" items="${prodList}">
				    	<tr>
				    		<input type="hidden"  id="prodList_id"  value="${re.pro_id }">
				    		<td rowspan="3"><img src="img/${ re.img }.jpg"></td>
				    		<td><a href="/Detail?pro_id=${re.pro_id}&nowpage=1">${ re.name }</a></td>
				    	</tr>
				    	<tr>
				    		<td>가격 ${ re.price }</td>
				    	</tr>
				    	<tr>
				    		<td> ${ re.avg_rating }, ${ re.review_count }
				    			<button type="button" id="wishButton" style="border:none; background-color:white;">♥</button></td>
				    	</tr>
			    	</c:forEach>
			    </table>			    
			    <button type="button" onclick="location.href='/Pay/Basket'">장바구니로 가기</button>
			  </div>
			</div>
			<!-- offcanvas 끝 -->
    
    <!-- 상세페이지 -->
    <!-- 맨 위 요약페이지 -->
    <div class="content">
        <section id="intro">
            <div class="left">
                <div class="big" id="bigImageContainer">
                    <img id="bigImage" src="img/영양제 사진 예시.png" alt="bigimage">
                </div>
                <div class="mini">
                    <span data-image="img/영양제 사진 예시.png"><img src="img/영양제 사진 예시.png" alt="1"></span>
                    <span data-image="img/영양제1.png"><img src="img/영양제1.png" alt="2"></span>
                    <span data-image="img/영양제2.png"><img src="img/영양제2.png" alt="3"></span>
                    <span data-image="img/영양제2.png"><img src="img/영양제2.png" alt="4"></span>
                    <span data-image="img/영양제2.png"><img src="img/영양제2.png" alt="5"></span>
                </div> 
            </div>
            <div class="right">
                <div> 별 평점 다시 넣어야함
							    <div class="star-rating" id="starRating">
							        <div class="star"></div>
							        <div class="star"></div>
							        <div class="star"></div>
							        <div class="star"></div>
							        <div class="star"></div>
							    </div>  
                    <a href="#section2">리뷰보기(${recount})</a>
                </div>
                <div>제조사 : ${ prod.brand_name }</div>
                <div>${ prod.name }</div>
                <div id="pro_price">${ prod.pro_price } 원</div>
                <button type="button" class="wish_btn" id="wishBtn" >♥</button>
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
            
            <!-- 평점 -->
            <div class="rating-container">
                <div class="left-section">
                    <div class="average-score">구매만족도</div>
                    <div id="num" style="font-size:50px;">${avgstar}</div>
                    <!-- 별 색칠 -->
									    <div class="star-rating" id="starRating">
									        <div class="star"></div>
									        <div class="star"></div>
									        <div class="star"></div>
									        <div class="star"></div>
									        <div class="star"></div>
									    </div>
                    <!-- 별 색칠 끝 -->
                    <div id="num" style="font-size:50px;"></div>
                    <div class="star-container">
                        <div class="star" style="width: 0%;"></div>
                    </div>
                    <!-- 막대바 -->
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
            <div id="reviews">
            <div class="reviewTable">
                <table>
                    <c:forEach var="re" items="${ reviewList }">
                        <tr>
                            <td>id : ${ re.nick }</td>
                            <td>${ re.created }</td>
                        </tr>
                        <tr><td>별</td></tr>
                        <tr>
                            <td colspan="2">${ re.content }</td>
                        </tr>
                        <tr><td>${ re.img }</td></tr>
                        <tr style="border-bottom: 1px solid #ccc;">
                        	<!-- 리뷰 좋아요 버튼 -->
                        	<td>
                        		<input type="hidden" name="rev_id">
										        <button class="like-button" data-user-id="1"><ion-icon name="thumbs-up-outline"></ion-icon></button>
										        <span></span>
										        <span class="like-status"></span>
                        	</td>
                        	<!-- 리뷰 좋아요 버튼 끝 -->
                        </tr>
                    </c:forEach>
                </table>
                <!-- 리뷰 페이징 -->
                <div class="d-flex justify-content-center paging-bottom-container">
										<div id="pagination">
                    <c:set var="startnum" value="${pagingVo.pagination.startPage}" />
										<c:set var="endnum" value="${pagingVo.pagination.endPage}" />
										<c:set var="totalpagecount" value="${pagingVo.pagination.totalPageCount}" />										
										<nav aria-label="Page navigation example" id="paging">
											<ul class="pagination">
											
												<c:if test="${nowpage > 1}">
													<li class="page-item">
													
														<a class="page-link" id="paging" data-page="1" href="/Detail?nowpage=1&pro_id=${pro_id}" aria-label="Previous">
															<span aria-hidden="true">&laquo;</span>
														</a>
													</li>
													<li class="page-item">
														<a class="page-link" id="paging" data-page="${nowpage - 1}" href="/Detail?nowpage=${nowpage - 1}&pro_id=${pro_id}" aria-label="Previous">
															<span aria-hidden="true">&lt;</span>
														</a>
													</li>
												</c:if>
												<c:forEach var="pagenum" begin="${startnum}" end="${endnum}" step="1">
													<li class="page-item">
														<a class="page-link" id="paging" data-page="${ pagenum }"href="/Detail?nowpage=${pagenum}&pro_id=${pro_id}"> 
															${ pagenum }
														</a>
													</li>
												</c:forEach>
												<c:if test="${pagingVo.pagination.existNextPage}">
							            <li class="page-item">
							                <a class="page-link" data-page="${nowpage + 1}" href="/Detail?nowpage=${nowpage + 1}&pro_id=${pro_id}" aria-label="Next">
							                    <span aria-hidden="true">&gt;</span>
							                </a>
							            </li>
							            <li class="page-item">
							                <a class="page-link" data-page="${totalpagecount}" href="/Detail?nowpage=${nowpage - 1}&pro_id=${pro_id}" aria-label="Next">
							                    <span aria-hidden="true">&raquo;</span>
							                </a>
							            </li>
												</c:if>
											</ul>
										</nav>
										</div>
                </div>
            </div>
            </div>
            <!-- 리뷰 페이징 끝 -->
        </section>
        
        <!-- FAQ -->
        <section id="section3">
            <h1>상품 Q&A (FAQ)</h1>
            <div class="accordion" id="faqAccordion">
                <c:forEach var="faq" items="${ faqList }">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="heading-${faq.faq_id}">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-${faq.faq_id}" 
                            aria-expanded="false" aria-controls="collapse-${faq.faq_id}" style="font-size:18px; ">
                                ${faq.question}
                            </button>
                        </h2>
                        <div id="collapse-${faq.faq_id}" class="accordion-collapse collapse" aria-labelledby="heading-${faq.faq_id}" data-bs-parent="#faqAccordion">
                            <div class="accordion-body">
                                ${faq.answer}
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </section>
        <!-- FAQ 끝 -->
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

<!-- FAQ -->
<script>
document.addEventListener("DOMContentLoaded", function() {
    var faqButtons = document.querySelectorAll(".accordion-button");
    faqButtons.forEach(function(button) {
        button.addEventListener("click", function() {
            var target = button.getAttribute("data-bs-target");
            var collapseElement = document.querySelector(target);
            var isCurrentlyOpen = collapseElement.classList.contains("show");

            // 다른 모든 아코디언을 닫기
            var allCollapseElements = document.querySelectorAll(".accordion-collapse");
            allCollapseElements.forEach(function(element) {
                element.classList.remove("show");
            });

            // 현재 클릭된 아코디언의 상태를 토글
            if (isCurrentlyOpen) {
                collapseElement.classList.remove("show");
            } else {
                collapseElement.classList.add("show");
            }
        });
    });
});

</script>
 
<!-- 리뷰 좋아요 
<script>
$(document).ready(function() {
    $('.like-button').click(function() {
        let rev_id = $(this).closest('.review').data('rev-id');
        let id = $(this).data('id')

        fetch('/LikeReview', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ rev_id, id })
        })
        .then(response => response.json())
        .then(data => {
            if (data.status === 'added') {
                $(this).addClass('liked');
                $(this).next('.like-status').text('추천했습니다');
                alert('추천해요!');
            } else if (data.status === 'removed') {
                $(this).removeClass('liked'); 
                $(this).next('.like-status').text('');
                alert('추천이 취소되었어요!');
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
    });
});
</script>-->

		<!-- 별 -->
    <script>
        // 데이터베이스에서 가져온 별점 값 (예: 4.1)
        const rating = 4.1;

        // 정수 부분과 소수 부분 계산
        const fullStars = Math.floor(rating);
        const partialStar = rating - fullStars;
        const partialStarPercentage = partialStar * 100;

        // 별 요소들 가져오기
        const stars = document.querySelectorAll('#starRating .star');

        // 별 채우기
        stars.forEach((star, index) => {
            if (index < fullStars) {
                star.classList.add('full');
            } else if (index === fullStars) {
                star.classList.add('partial');
                star.style.setProperty('--partial-width', `${partialStarPercentage}%`);
            }
        });

        // 부분적으로 채워진 별 스타일 설정
        const partialStarElement = document.querySelector('.star.partial::before');
        if (partialStarElement) {
            partialStarElement.style.width = `${partialStarPercentage}%`;
        }
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
   <script type="text/javascript">
      document.addEventListener("DOMContentLoaded", (event) => {
          let id = parseInt(document.querySelector("#id").value);
          let pro_id = parseInt(document.querySelector("#prodList_id").value);
          let wishButton = document.querySelector("#wishButton");        
          
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
            	  wishButton.classList.add("fill");
          }else{
        	  wishButton.classList.remove("fill");
          }
          })
          .catch(error => {
              console.error("Error:", error);
          });
      });

            
      wishButton.addEventListener("click", (event) => {
          let id = parseInt(document.querySelector("#id").value);
          let pro_id = parseInt(document.querySelector("#prodList_id").value);
          
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
                  wishButton.classList.add("fill");
                  wishButton.classList.remove("unfill");
              } else if (data.status === "existing") {
                  wishButton.classList.add("unfill");
                  wishButton.classList.remove("fill");
              }
          })
          .catch(error => {
              console.error("Error:", error);
          });
      });    
  </script>
  
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

</div>
</body>
</html>
