<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/start.css" rel="stylesheet" />
<link href="/css/header.css" rel="stylesheet" />
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" href="/css/compare.css" />
<style>
#header {
    position: static;
    margin-bottom: 50px;
}
#main {
    width: 1240px;
    margin: 0 auto;

  }
.wishlist{
  	 background-image: url(/img/heart.png);
    background-repeat: no-repeat;
    background-position: 50%;
    background-size: 100%;
    width: 20px;
    height: 20px;
    color: red;
    position: absolute;
    top: 20px;
    right: 20px;
    cursor: pointer;
    border: none;
    background-color: #fff;
  }
  .wishlist.on{
   background-image: url(/img/heart-fill.png);
  }
  .detail-row.caution ul{
  	padding: 0 20px
  }
.detail-row.caution ul li{
text-align: left;
}
.center{
width: 153px;}
.detail-row.caution .center{
width: 170px;
}

.chart {
      width: 400px;
      height: 500px;
      margin: 20px auto;
      border: 1px solid #ccc;
      position: relative;
    }

    .chart .bar {
      width: 50px;
      position: absolute;
      bottom: 0;
      text-align: center;
      background-color: #4CAF50;
      color: white;
      transition: height 0.5s ease;
    }

    .chart .bar1 {
      left: 110px;
    }

    .chart .bar2 {
      left: 240px;
    }

    .chart .label {
      position: absolute;
      width: 50px;
      text-align: center;
      bottom: -30px;
    }

    .chart .label1 {
      left: 110px;
    }

    .chart .label2 {
      left: 240px;
    }

    .chart .y-axis {
      position: absolute;
      left: -50px;
      top: 0;
      height: 100%;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }

    .chart .y-axis span {
      transform: translateY(-50%);
      text-align: right;
    }

    .chart .guideline {
      position: absolute;
      width: 100%;
      height: 2px;
      background-color: transparent;
      pointer-events: none;
    }

    .chart .guideline.male {
      background-color: blue;
      transform: translateY(-2px);
    }

    .chart .guideline.female {
      background-color: red;
      transform: translateY(2px);
    }

    .chart .guideline.same {
      background-color: gray;
    }

    .chart .guideline.male .bar-value {
      position: absolute;
      top: -32px;
      right: -28px;
      color: blue;
    }

    .chart .guideline.female .bar-value {
      position: absolute;
      top: -18px;
      right: -28px;
      color: red;
    }

    .chart .guideline.same .bar-value {
      position: absolute;
      top: -26px;
      right: -28px;
      color: gray;
    }

    #nutrient-list {
      list-style-type: none;
      padding: 0;
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
    }

    #nutrient-list li {
      cursor: pointer;
      margin: 5px;
      padding: 10px;
      background-color: #ddd;
      border: 1px solid #ccc;
      text-align: center;
      
      display: flex;
       justify-content: center;
       align-items: center;
      /* 최소 너비를 설정하여 중앙 정렬 유지 */
      transition: background-color 0.3s ease;
    }

    #nutrient-list li:hover {
      background-color: #ccc;
    }

    #nutrient-list li.on {
      background-color: #aaa;
    }
    #chart-name{
    	text-align: center;
    }
    #nutrient-list{
    	margin-top: 38px
    }

</style>
</head>
<body>
 
 <div id="wrap" class="active-start">
   <%@include file="/WEB-INF/include/Header.jsp"%>
   <main id="main" class="landing">
       <div class="container">
    <div class="check-product" id="math1">
      <div class="select-wrapper">
        <select class="mainSelect">
          <option value="recent">최근본상품</option>
          <option value="cart">장바구니상품</option>
          <option value="wish">북마크상품</option>
        </select>

      </div>
      <div class="option-wrapper">
        <select class="subSelect">
          <option value="" disabled selected>상품을 선택해주세요</option>
        </select>
        <button class="select-btn">비타민 C<a href="javascript:;" class="btnIco itemDel"><span>선택된 비교상품
              삭제</span></a></button>
      </div>
    </div>
    <div class="check-product" id="math2">
      <div class="select-wrapper">
        <select class="mainSelect">
          <option value="recent">최근본상품</option>
          <option value="cart">장바구니상품</option>
          <option value="wish">북마크상품</option>

        </select>
      </div>
      <div class="option-wrapper">
        <select class="subSelect">
          <option value="" disabled selected>상품을 선택해주세요</option>
          <button>비타민 C<a href="javascript:;" class="btnIco itemDel"><span>선택된 비교상품 삭제</span></a></button>
        </select>
        <button class="select-btn">비타민 C<a href="javascript:;" class="btnIco itemDel"><span>선택된 비교상품
              삭제</span></a></button>
      </div>
    </div>
    <div>
      <button class="compare-button">
        상품비교하기
      </button>
    </div>
  </div><!-- container -->
      <div class="slide-wrap">
    <h4>최근본상품</h4>
    <div class="swiper-container wish-products">
      <div class="swiper-wrapper">
      <c:forEach var="item" items="${recenItems}">
        <div class="swiper-slide">
          <div class="product" data-product-name="${ item.name } " data-product-id="${item.pro_id}">
            <c:choose>
                    <c:when test="${item.wish_id != null}">
                        <button class="wishlist on" data-product-id="${item.pro_id}"></button>
                    </c:when>
                    <c:otherwise>
                        <button class="wishlist" data-product-id="${item.pro_id}"></button>
                    </c:otherwise>
            </c:choose>
            <img src="/img/${item.img}.jpg" alt="Product 4">
            <div class="product_util">
              <div class="txt1">${ item.make_name }</div>
              <div class="txt2">${ item.name }</div>
              <div class="review">
                <span class="star-point">${item.string_average_arting }</span>
                <span class="txt3">${item.total_sell}</span>
              </div>
              <div class="type_list">
              <c:forEach var="nutrient" items="${item.nutrient}">
                <p class="type">#${nutrient}</p>
                </c:forEach>
              </div>
            </div>
          </div>
        </div>
       </c:forEach>
       
       
        <!-- 필요한 경우 추가 슬라이드 -->
      </div>
      <div class="swiper-pagination"></div>
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
    </div>
  </div>
   <div class="slide-wrap">
    <h4>위시리스트</h4>
    
    <div class="swiper-container wish-products">
      <div class="swiper-wrapper">
      <c:forEach var="item" items="${wishItems}">
        <div class="swiper-slide">
          <div class="product" data-product-name="${ item.name } " data-product-id="${item.pro_id}">
            <c:choose>
                    <c:when test="${item.wish_id != null}">
                        <button class="wishlist on" data-product-id="${item.pro_id}"></button>
                    </c:when>
                    <c:otherwise>
                        <button class="wishlist" data-product-id="${item.pro_id}"></button>
                    </c:otherwise>
            </c:choose>
            <img src="/img/${item.img}.jpg" alt="Product 4">
            <div class="product_util">
              <div class="txt1">${ item.make_name }</div>
              <div class="txt2">${ item.name }</div>
              <div class="review">
                <span class="star-point">${item.string_average_arting }</span>
                <span class="txt3">${item.total_sell}</span>
              </div>
              <div class="type_list">
              <c:forEach var="nutrient" items="${item.nutrient}">
                <p class="type">#${nutrient}</p>
                </c:forEach>
              </div>
            </div>
          </div>
        </div>
       </c:forEach>
       
       
        <!-- 필요한 경우 추가 슬라이드 -->
      </div>
      <div class="swiper-pagination"></div>
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
    </div>
  </div>  
  <div class="slide-wrap">
    <h4>장바구니</h4>
    
    <div class="swiper-container cart-products">
      <div class="swiper-wrapper">
      <c:forEach var="item" items="${basketItems}">
        <div class="swiper-slide">
          <div class="product" data-product-name="${ item.name } " data-product-id="${item.pro_id}">
            <c:choose>
                    <c:when test="${item.wish_id != null}">
                        <button class="wishlist on" data-product-id="${item.pro_id}"></button>
                    </c:when>
                    <c:otherwise>
                        <button class="wishlist" data-product-id="${item.pro_id}"></button>
                    </c:otherwise>
            </c:choose>
            <img src="/img/${item.img}.jpg" alt="Product 4">
            <div class="product_util">
              <div class="txt1">${ item.make_name }</div>
              <div class="txt2">${ item.name }</div>
              <div class="review">
                <span class="star-point">${item.string_average_arting }</span>
                <span class="txt3">${item.total_sell}</span>
              </div>
              <div class="type_list">
              <c:forEach var="nutrient" items="${item.nutrient}">
                <p class="type">#${nutrient}</p>
                </c:forEach>
              </div>
            </div>
          </div>
        </div>
       </c:forEach>
       
       
        <!-- 필요한 경우 추가 슬라이드 -->
      </div>
      <div class="swiper-pagination"></div>
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
    </div>
  </div>    
      
      <div class="footer-container">
    <div>
      <span class="compare-product-1" data-product-id=""></span>
      <span>와</span>
      <br>
      <span class="compare-product-2" data-product-id=""></span>
    </div>
    <div>
      <button class="compare-button">비교하기</button>
      <button class="reset-button">초기화</button>
    </div>
  </div>
   </main>
   
   <!-- 모달 -->
   <div class="modal" id="productModal">
    <div class="modal-content">
      <span class="close-modal" >&times;</span>
      <div class="comparison">
        <div class="product" id="compareProduct1">
          <img src="/img/product01.jpg" alt="Product 1">
          <h3>락토핏 생유산균 골드</h3>
          <button>자세히 보기</button>
        </div>
        <div class="product" id="compareProduct2">
          <img src="/img/product02.jpg" alt="Product 2">
          <h3>100억 유산균 프로바이오틱스</h3>
          <button>자세히 보기</button>
        </div>
      </div>
      <div class="details">
        <div class="detail-row oversea">
          <div class="detail-title">제품 분류</div>
          <div class="detail-content">
            <div>국내 건강기능식품 인증</div>
            <div>국내 건강기능식품 인증</div>
          </div>
        </div>
        <div class="detail-row functional">
          <div class="detail-title">기능성</div>
          <div class="detail-content">
            <div>장 건강</div>
            <div>뼈 건강, 면역력 증진, 장 건강</div>
          </div>
        </div>
        <div class="detail-row form">
          <div class="detail-title ">제형</div>
          <div class="detail-content">
            <div>가루</div>
            <div>가루</div>
          </div>
        </div>
        <div class="detail-row nutri">
          <div class="detail-title">영양소</div>
          <div class="detail-content progress-wrap">

            <div class="product-details progress-wrap">
              <div class="progress-container">

                <div class="progress-bar">
                  <div style="width: 100%;"></div>
                  <span>120IU</span>
                </div>
                <div><span>비타민D:</span></div>
                <div class="progress-bar">
                  <div style="width: 100%;"></div>
                  <span>90IU</span>
                </div>
              </div>
              <div class="progress-container">

                <div class="progress-bar">
                  <div style="width: 100%;"></div>
                  <span>2mg</span>
                </div>
                <div>
                  <span>아연:</span>
                </div>
                <div class="progress-bar">
                  <div style="width: 100%;"></div>
                  <span>1.8mg</span>
                </div>
              </div>
              <div class="progress-container">

                <div class="progress-bar">
                  <div style="width: 100%;"></div>
                  <span>100.00억cfu</span>
                </div>
                <div>
                  <span>프로바이오틱스:</span>
                </div>
                <div class="progress-bar">
                  <div style="width: 100%;"></div>
                  <span>0</span>
                </div>

              </div>
            </div>
          </div>
        </div>
        <div class="detail-row take">
          <div class="detail-title">섭취 방법</div>
          <div class="detail-content">
            <div>1일 1회, 1회 1포를 식전 · 식후 어느때나 물 없이 섭취하십시오.</div>
            <div>1일 1회 1포를 직접 섭취하거나 물과 함께 섭취하십시오.</div>
          </div>
        </div>
        <div class="detail-row caution">
          <div class="detail-title">섭취 시 주의사항</div>
          <div class="detail-content">
            <div>
              <ul>
                <li>질환이 있거나 의약품 복용 시 전문가와 상담할 것</li>
              
              </ul>
            </div>
            <div>
              <ul>
                <li>질환이 있거나 의약품 복용 시 전문가와 상담할 것</li>
               
              </ul>
            </div>
          </div>
        </div>
      </div>
      <h2 id="chart-name">상품 비타민 A </h2>
  <div class="chart">
    <div class="color-what">
      <div>
        <p></p>
        <p>남성권장량</p>
      </div>
      <div>
        <p></p>
        <p>여성권장량</p>
      </div>
      <div>
        <p></p>
        <p>권장량</p>
      </div>
    </div>
    <div class="bar bar1"><span id="bar1-value">1500</span></div>
    <div class="bar bar2"><span id="bar2-value">1050</span></div>
    <div class="label label1">상품 1</div>
    <div class="label label2">상품 2</div>
    <div class="y-axis" id="y-axis">
      <!-- y-axis values will be dynamically generated here -->
    </div>
    <div class="guideline male" id="male-guideline">
      <p class="bar-value" id="male-value">900</p>
    </div>
    <div class="guideline female" id="female-guideline">
      <p class="bar-value" id="female-value">700</p>
    </div>
    <div class="guideline same" id="same-guideline">
      <p class="bar-value" id="same-value">10</p>
    </div>
  </div>
  <ul id="nutrient-list">
    <!-- JavaScript will generate list items here -->
  </ul>
    </div>
  </div>
   
   
 </div>
   
 <script src="/js/header.js"></script>
 <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
  <script src="/js/swipertest.js"></script>
  <script>
  document.addEventListener('DOMContentLoaded', function () {
	  const optionsName = {
              recent: [
            	  <c:forEach var="item" items="${recenItems}" varStatus="status">
                  '${item.name}'<c:if test="${!status.last}">, </c:if>
                  </c:forEach>
              ],
              cart: [
                  <c:forEach var="item" items="${basketItems}" varStatus="status">
                      '${item.name}'<c:if test="${!status.last}">, </c:if>
                  </c:forEach>
              ],
              wish: [
                  <c:forEach var="item" items="${wishItems}" varStatus="status">
                      '${item.name}'<c:if test="${!status.last}">, </c:if>
                  </c:forEach>
              ]
          };
	  console.log(optionsName);
	  
	  const optionsId = {
              recent: [
            	  <c:forEach var="item" items="${recenItems}" varStatus="status">
                  '${status.index + 1}'<c:if test="${!status.last}">, </c:if>
                 </c:forEach>
              ],
              cart: [
                  <c:forEach var="item" items="${basketItems}" varStatus="status">
                      '${status.index + 1}'<c:if test="${!status.last}">, </c:if>
                  </c:forEach>
              ],
              wish: [
                  <c:forEach var="item" items="${wishItems}" varStatus="status">
                      '${status.index + 1}'<c:if test="${!status.last}">, </c:if>
                  </c:forEach>
              ]
          };
	  console.log("optionsId");
	  console.log(optionsId);
	  
      let compareProduct1 = { id: null, name: null };
      let compareProduct2 = { id: null, name: null };

      function updateSubSelect(mainSelect) {
        const subSelect = mainSelect.closest('.check-product').querySelector('.subSelect');
        const selectedValue = mainSelect.value;
        const subOptionsName = optionsName[selectedValue] || [];
        const subOptionsId = optionsId[selectedValue] || [];

        console.log("subOptionsId: " + subOptionsId);
        subSelect.innerHTML = '<option value="" disabled selected>상품을 선택해주세요</option>' +
            subOptionsName.map((option, index) => `<option value="\${subOptionsId[index]}">\${option}</option>`).join('');
      }

      function updateFooter() {
        const compareProduct1El = document.querySelector('.compare-product-1');
        const compareProduct2El = document.querySelector('.compare-product-2');

        if (compareProduct1.id && compareProduct2.id) {
          compareProduct1El.textContent = compareProduct1.name;
          compareProduct1El.setAttribute('data-product-id', compareProduct1.id);

          compareProduct2El.textContent = compareProduct2.name;
          compareProduct2El.setAttribute('data-product-id', compareProduct2.id);

          document.querySelector('.footer-container').style.display = 'flex';
        } else {
          document.querySelector('.footer-container').style.display = 'none';
        }
      }

     /*  function highlightSelectedProducts() {
        document.querySelectorAll('.product').forEach(product => {
          const productId = product.getAttribute('data-product-id');
          if ((compareProduct1.id && compareProduct1.id === productId) || (compareProduct2.id && compareProduct2.id === productId)) {
            product.classList.add('compare-to');
          } else {
            product.classList.remove('compare-to');
          }
        });
      } */
      function highlightSelectedProducts() {
    	    document.querySelectorAll('.product').forEach(product => {
    	        const productId = product.getAttribute('data-product-id');
    	        product.classList.remove('compare-to1', 'compare-to2');  // 기존 클래스를 제거합니다.

    	        if (compareProduct1.id && compareProduct1.id === productId) {
    	            product.classList.add('compare-to1');  // 첫 번째 선택된 상품에 빨간색 경계선을 추가합니다.
    	        } else if (compareProduct2.id && compareProduct2.id === productId) {
    	            product.classList.add('compare-to2');  // 두 번째 선택된 상품에 파란색 경계선을 추가합니다.
    	        }
    	    });
    	}

      document.querySelectorAll('.mainSelect').forEach(mainSelect => {
        mainSelect.addEventListener('change', function () {
          updateSubSelect(mainSelect);
        });

        // 초기 로딩 시에도 서브 셀렉트 박스 업데이트
        updateSubSelect(mainSelect);
      });

      document.querySelectorAll('.subSelect').forEach(subSelect => {
        subSelect.addEventListener('change', function () {
          const selectedOption = subSelect.options[subSelect.selectedIndex].text;
          const selectedOptionId = subSelect.value;

          // 선택된 subSelect의 상위 div의 id를 확인합니다.
          const parentDivId = subSelect.closest('.check-product').id;

          if (parentDivId === 'math1') {
            compareProduct1 = { id: selectedOptionId, name: selectedOption };
          } else if (parentDivId === 'math2') {
            compareProduct2 = { id: selectedOptionId, name: selectedOption };
          }

          // subSelect를 숨기고 버튼을 보이게 함
          const selectBtn = subSelect.closest('.option-wrapper').querySelector('.select-btn');
          subSelect.style.display = 'none';
          selectBtn.style.display = 'block';
          selectBtn.innerHTML = `\${selectedOption} <a href="javascript:;" class="btnIco itemDel"><span>선택된 비교상품 삭제</span></a>`;

          highlightSelectedProducts();
          updateFooter();
        });
      });

      // 상품 클릭으로 선택
      document.querySelectorAll('.product').forEach(item => {
        item.addEventListener('click', function () {
          const productName = this.getAttribute('data-product-name');
          const productId = this.getAttribute('data-product-id');

          let updateTarget;

          if (!compareProduct1.id) {
            compareProduct1 = { id: productId, name: productName };
            updateTarget = document.getElementById('math1');
          } else if (!compareProduct2.id) {
            compareProduct2 = { id: productId, name: productName };
            updateTarget = document.getElementById('math2');
          } else {
            compareProduct1 = { id: productId, name: productName };
            updateTarget = document.getElementById('math1');
          }

          // 해당 상품의 카테고리를 찾기 위해 mainSelect와 subSelect를 업데이트
          const productCategory = this.closest('.swiper-container').classList.contains('recent-products') ? 'recent' :
            this.closest('.swiper-container').classList.contains('cart-products') ? 'cart' : 'wish';

          const mainSelect = updateTarget.querySelector('.mainSelect');
          const subSelect = updateTarget.querySelector('.subSelect');

          mainSelect.value = productCategory;
          updateSubSelect(mainSelect);

          subSelect.value = productId;
          subSelect.style.display = 'none';

          const selectBtn = updateTarget.querySelector('.select-btn');
          selectBtn.style.display = 'block';
          selectBtn.innerHTML = `\${productName} <a href="javascript:;" class="btnIco itemDel"><span>선택된 비교상품 삭제</span></a>`;

          highlightSelectedProducts();
          updateFooter();
        });
      });

      document.body.addEventListener('click', function (event) {
        if (event.target.closest('.btnIco.itemDel')) {
          const itemDel = event.target.closest('.btnIco.itemDel');
          const optionWrapper = itemDel.closest('.option-wrapper');
          const subSelect = optionWrapper.querySelector('.subSelect');
          const selectBtn = optionWrapper.querySelector('.select-btn');
          const parentDivId = itemDel.closest('.check-product').id;

          if (parentDivId === 'math1') {
            compareProduct1 = { id: null, name: null };
          } else if (parentDivId === 'math2') {
            compareProduct2 = { id: null, name: null };
          }

          subSelect.style.display = 'block';
          selectBtn.style.display = 'none';

          updateSubSelect(subSelect.closest('.check-product').querySelector('.mainSelect'));
          highlightSelectedProducts();
          updateFooter();
        }
      });

      document.querySelector('.reset-button').addEventListener('click', function () {
        compareProduct1 = { id: null, name: null };
        compareProduct2 = { id: null, name: null };
        document.querySelectorAll('.product').forEach(product => {
        	  product.classList.remove('compare-to1', 'compare-to2');  // 기존 클래스를 제거합니다.
        });
        document.querySelector('.footer-container').style.display = 'none';

        document.querySelectorAll('.mainSelect').forEach(mainSelect => {
          mainSelect.selectedIndex = 0;
          updateSubSelect(mainSelect);
        });

        document.querySelectorAll('.subSelect').forEach(subSelect => {
          subSelect.style.display = 'block';
        });

        document.querySelectorAll('.select-btn').forEach(selectBtn => {
          selectBtn.style.display = 'none';
        });
      });
      
      // 모달 기능
      const modal = document.querySelector("#productModal");
      const closeModal = document.getElementsByClassName("close-modal")[0];

      
      document.querySelectorAll('.compare-button').forEach(button => {
          button.addEventListener('click', function () {
        	  console.log("1")
              console.log(compareProduct1);
              console.log("2")
              console.log(compareProduct2);
              // 선택된 제품 ID를 서버로 전송
              fetch('/Compare/Api/Go', {
                  method: 'POST',
                  headers: {
                      'Content-Type': 'application/json'
                  },
                  body: JSON.stringify({
                      productId1: compareProduct1.id,
                      productId2: compareProduct2.id
                  })
              })
              .then(response => response.json())
              .then(data => {
                  console.log('Success:', data);
                  updateModal(data.products, data.nutrients);
                  modal.style.display = "flex";
              })
              .catch((error) => {
                  console.error('Error:', error);
              });
              
              modal.style.display="flex";
          });
      });
      closeModal.addEventListener('click', function () {
          modal.style.display = "none";
        });

        window.addEventListener('click', function (event) {
          if (event.target == modal) {
            modal.style.display = "none";
          }
        });
      
    });
  function updateModal(products, nutrients) {
	    const compareProduct1 = products[0];
	    const compareProduct2 = products[1];

	    // Update product details
	    document.querySelector('#compareProduct1 h3').textContent = compareProduct1.name;
	    document.querySelector('#compareProduct2 h3').textContent = compareProduct2.name;
	    document.querySelector('#compareProduct1 img').src = `/img/\${compareProduct1.img}.jpg`;
	    document.querySelector('#compareProduct2 img').src = `/img/\${compareProduct2.img}.jpg`;
	    
	    
	 // Update oversea details
	    const overseaContainer = document.querySelector('.detail-row.oversea .detail-content');
	    overseaContainer.innerHTML = ''; // Clear existing content
	    const oversea1 = document.createElement('div');
	    const oversea2 = document.createElement('div');
	    oversea1.textContent = compareProduct1.pro_id < 10 ? "해외제품" : "국내 건강기능식품 인증";
	    oversea2.textContent = compareProduct2.pro_id < 10 ? "해외제품" : "국내 건강기능식품 인증";
	    const cautionCenter1 = document.createElement('span');
	    cautionCenter1.classList.add("center");
	    
	    overseaContainer.appendChild(oversea1);   
	    overseaContainer.appendChild(cautionCenter1);
	    overseaContainer.appendChild(oversea2);
	    
	    // Update functional details
	    const functionalContainer = document.querySelector('.detail-row.functional .detail-content');
	    functionalContainer.innerHTML = ''; // Clear existing content
	    const functional1 = document.createElement('div');
	    const functional2 = document.createElement('div');
	    functional1.textContent = compareProduct1.functional;
	    functional2.textContent = compareProduct2.functional;
	   
	    const cautionCenter2 = document.createElement('span');
	    cautionCenter2.classList.add("center");
	    functionalContainer.appendChild(functional1);
	    functionalContainer.appendChild(cautionCenter2);
	    functionalContainer.appendChild(functional2);
	    
	 // Update form details
	    const formContainer = document.querySelector('.detail-row.form .detail-content');
	    formContainer.innerHTML = ''; // Clear existing content
	    const form1 = document.createElement('div');
	    const form2 = document.createElement('div');
	    form1.textContent = compareProduct1.form;
	    form2.textContent = compareProduct2.form;
	    
	    const cautionCenter3 = document.createElement('span');
	    cautionCenter3.classList.add("center");
	    
	    formContainer.appendChild(form1);
	    formContainer.appendChild(cautionCenter3);
	    formContainer.appendChild(form2);
	    
	 // Update take details
	    const takeContainer = document.querySelector('.detail-row.take .detail-content');
	    takeContainer.innerHTML = ''; // Clear existing content
	    const take1 = document.createElement('div');
	    const take2 = document.createElement('div');
	    take1.textContent = compareProduct1.take;
	    take2.textContent = compareProduct2.take;
	    const cautionCenter4 = document.createElement('span');
	    cautionCenter4.classList.add("center");
	    takeContainer.appendChild(take1);	   
	    takeContainer.appendChild(cautionCenter4);	   
	    takeContainer.appendChild(take2);
	 // Update caution details
	    const cautionContainer = document.querySelector('.detail-row.caution .detail-content');
	    cautionContainer.innerHTML = ''; // Clear existing content
	    const caution1 = document.createElement('div');
	    const caution2 = document.createElement('div');
	    const cautionList1 = document.createElement('ul');
	    const cautionList2 = document.createElement('ul');
	    compareProduct1.cautionList.forEach(item => {
	        const li = document.createElement('li');
	        li.textContent = item;
	        cautionList1.appendChild(li);
	    });
	    compareProduct2.cautionList.forEach(item => {
	        const li = document.createElement('li');
	        li.textContent = item;
	        cautionList2.appendChild(li);
	    });
	    caution1.appendChild(cautionList1);
	    caution2.appendChild(cautionList2);
	    const cautionCenter5 = document.createElement('span');
	    cautionCenter5.classList.add("center");
	    cautionContainer.appendChild(caution1);
	    cautionContainer.appendChild(cautionCenter5);
	    cautionContainer.appendChild(caution2);
	    

	    
	    // Update nutrient details
	    const detailsContainer = document.querySelector('.detail-row.nutri');
	    detailsContainer.innerHTML = ''; // Clear existing content

	    // Add nutrient title
	    const detailTitle = document.createElement('div');
	    detailTitle.classList.add('detail-title');
	    detailTitle.textContent = "영양소 비교";
	    detailsContainer.appendChild(detailTitle);

	    nutrients.forEach(nutrient => {
	        const detailRow = document.createElement('div');
	        detailRow.classList.add('detail-row');

	        const detailContent = document.createElement('div');
	        detailContent.classList.add('detail-content', 'progress-wrap');

	        const productDetails = document.createElement('div');
	        productDetails.classList.add('product-details', 'progress-wrap');

	        const capacity1 = nutrient.capacity1 || 0;
	        const capacity2 = nutrient.capacity2 || 0;

	        const color1 = capacity1 >= capacity2 ? '#4caf50' : '#ffeb3b';
	        const color2 = capacity2 >= capacity1 ? '#4caf50' : '#ffeb3b';

	        // Create progress bar container
	        const progressContainer = document.createElement('div');
	        progressContainer.classList.add('progress-container');

	        const progressBar1 = document.createElement('div');
	        progressBar1.classList.add('progress-bar', 'reverse', 'optimal-wrap');

	        const progressNumber1 = document.createElement('span');
	        progressNumber1.classList.add('progress-number');
	        progressNumber1.textContent = `\${capacity1}\${nutrient.unit}`;

	        const progressFill1 = document.createElement('div');
	        progressFill1.classList.add('optimal');
	        progressFill1.style.width = capacity1 ? `\${(capacity1 / (capacity1 + capacity2)) * 100}%` : '0%';
	        progressFill1.style.backgroundColor = color1;

	        progressBar1.appendChild(progressNumber1);
	        progressBar1.appendChild(progressFill1);

	        const nutrientName = document.createElement('span');
	        nutrientName.textContent = nutrient.name;

	        const progressBar2 = document.createElement('div');
	        progressBar2.classList.add('progress-bar', 'suboptimal-wrap');

	        const progressNumber2 = document.createElement('span');
	        progressNumber2.classList.add('progress-number');
	        progressNumber2.textContent = `\${capacity2}\${nutrient.unit}`;

	        const progressFill2 = document.createElement('div');
	        progressFill2.classList.add('suboptimal');
	        progressFill2.style.width = capacity2 ? `\${(capacity2 / (capacity1 + capacity2)) * 100}%` : '0%';
	        progressFill2.style.backgroundColor = color2;

	        progressBar2.appendChild(progressNumber2);
	        progressBar2.appendChild(progressFill2);

	        progressContainer.appendChild(progressBar1);
	        progressContainer.appendChild(nutrientName);
	        progressContainer.appendChild(progressBar2);

	        productDetails.appendChild(progressContainer);
	        detailContent.appendChild(productDetails);
	        detailRow.appendChild(detailContent);

	        detailsContainer.appendChild(detailRow);
	    });
	    
	    createList(nutrients);
	    document.querySelectorAll('#nutrient-list li')[0].classList.add('on');
	    updateChart(0, nutrients);
	}
  
  function createList(nutrients) {
	    const list = document.getElementById('nutrient-list');
	    nutrients.forEach((nutrient, index) => {
	        const listItem = document.createElement('li');
	        listItem.textContent = nutrient.name;
	        listItem.addEventListener('click', () => {
	            updateChart(index, nutrients);
	            document.querySelectorAll('#nutrient-list li').forEach(li => li.classList.remove('on'));
	            listItem.classList.add('on');
	        });
	        list.appendChild(listItem);
	    });
	}

	function updateYAxis(maxValue) {
	    const yAxis = document.getElementById('y-axis');
	    yAxis.innerHTML = '';
	    for (let i = 0; i <= 10; i++) {
	        const value = maxValue * (10 - i) / 10;
	        const span = document.createElement('span');
	        span.textContent = value.toFixed(1);
	        yAxis.appendChild(span);
	    }
	}

	function updateChart(index, nutrients) {
	    const nutrient = nutrients[index];
	    const bar1 = document.querySelector('.bar1');
	    const bar2 = document.querySelector('.bar2');
	    const bar1Value = document.getElementById('bar1-value');
	    const bar2Value = document.getElementById('bar2-value');
	    const maleGuideline = document.getElementById('male-guideline');
	    const femaleGuideline = document.getElementById('female-guideline');
	    const sameGuideline = document.getElementById('same-guideline');
	    const maleValue = document.getElementById('male-value');
	    const femaleValue = document.getElementById('female-value');
	    const sameValue = document.getElementById('same-value');

	    const maxCapacity = Math.max(nutrient.capacity1 || 0, nutrient.capacity2 || 0);
	    const maxRDA = Math.max(nutrient.man_rda || 0, nutrient.girl_rda || 0);
	    // Ensure a minimum max value of 10
	    const maxValue = Math.max(maxCapacity, maxRDA) * 1.2;
	    bar1.style.height = `calc(100% * \${nutrient.capacity1 || 0} / \${maxValue})`;
	    bar2.style.height = `calc(100% * \${nutrient.capacity2 || 0} / \${maxValue})`;
	    bar1Value.textContent = (nutrient.capacity1 && nutrient.capacity1 !== 0) ? nutrient.capacity1 : '';
	    bar2Value.textContent = (nutrient.capacity2 && nutrient.capacity2 !== 0) ? nutrient.capacity2 : '';

	    if (nutrient.man_rda === nutrient.girl_rda) {
	        maleGuideline.style.display = 'none';
	        femaleGuideline.style.display = 'none';
	        sameGuideline.style.display = 'block';
	        sameGuideline.style.top = `calc(100% - 100% * \${nutrient.man_rda || 0} / \${maxValue})`;
	        sameValue.textContent = (nutrient.man_rda && nutrient.man_rda !== 0) ? nutrient.man_rda : '';
	    } else {
	        maleGuideline.style.display = 'block';
	        femaleGuideline.style.display = 'block';
	        sameGuideline.style.display = 'none';
	        maleGuideline.style.top = `calc(100% - 100% * \${nutrient.man_rda || 0} / \${maxValue})`;
	        femaleGuideline.style.top = `calc(100% - 100% * \${nutrient.girl_rda || 0} / \${maxValue})`;
	        maleValue.textContent = (nutrient.man_rda && nutrient.man_rda !== 0) ? nutrient.man_rda : '';
	        femaleValue.textContent = (nutrient.girl_rda && nutrient.girl_rda !== 0) ? nutrient.girl_rda : '';
	    }

	    updateYAxis(maxValue);

	    document.querySelector('#chart-name').textContent = `\${nutrient.name} 함량 비교 차트 (\${nutrient.unit})`;
	}

	createList();
	updateChart(0);
  </script>
 
</body>
</html>



