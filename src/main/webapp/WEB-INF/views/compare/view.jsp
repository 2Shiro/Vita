<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
          <option value="bookmark">북마크상품</option>
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
          <option value="bookmark">북마크상품</option>

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
    <div class="swiper-container recent-products">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
          <div class="product" data-product-name="비타민 A" data-product-id="1">
            <img src="/img/product01.jpg" alt="Product 1">
            <div class="product_util">
              <div class="txt1">회사 1</div>
              <div class="txt2">비타민 A</div>
              <div class="review">
                <span class="star-point">4.72</span>
                <span class="txt3">(1,104개)</span>
              </div>
              <div class="type_list">
                <p class="type">#비타민A</p>
              </div>
            </div>
          </div>
        </div>
        <div class="swiper-slide">
          <div class="product" data-product-name="비타민 B" data-product-id="2">
            <img src="/img/product02.jpg" alt="Product 2">
            <div class="product_util">
              <div class="txt1">회사 2</div>
              <div class="txt2">비타민 B</div>
              <div class="review">
                <span class="star-point">4.72</span>
                <span class="txt3">(1,104개)</span>
              </div>
              <div class="type_list">
                <p class="type">#비타민A</p>
                <p class="type">#비타민B</p>
              </div>
            </div>
          </div>
        </div>
        <div class="swiper-slide">
          <div class="product" data-product-name="비타민 C" data-product-id="3">
            <img src="/img/product03.jpg" alt="Product 3">
            <div class="product_util">
              <div class="txt1">회사 3</div>
              <div class="txt2">비타민 C</div>
              <div class="review">
                <span class="star-point">4.72</span>
                <span class="txt3">(1,104개)</span>
              </div>
              <div class="type_list">
                <p class="type">#비타민A</p>
                <p class="type">#비타민B</p>
                <p class="type">#비타민C</p>
                <p class="type">#비타민E</p>
              </div>
            </div>
          </div>
        </div>
        <!-- 필요한 경우 추가 슬라이드 -->
      </div>
      <div class="swiper-pagination"></div>
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
    </div>
  </div>
   <div class="slide-wrap">
    <h4>장바구니상품</h4>
    <div class="swiper-container cart-products">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
          <div class="product" data-product-name="상품 1" data-product-id="4">
            <img src="/img/product04.jpg" alt="Product 4">
            <div class="product_util">
              <div class="txt1">회사 4</div>
              <div class="txt2">상품 1</div>
              <div class="review">
                <span class="star-point">4.72</span>
                <span class="txt3">(1,104개)</span>
              </div>
              <div class="type_list">
                <p class="type">#비타민A</p>
              </div>
            </div>
          </div>
        </div>
        <div class="swiper-slide">
          <div class="product" data-product-name="상품 2" data-product-id="5">
            <img src="/img/product05.jpg" alt="Product 5">
            <div class="product_util">
              <div class="txt1">회사 5</div>
              <div class="txt2">상품 2</div>
              <div class="review">
                <span class="star-point">4.72</span>
                <span class="txt3">(1,104개)</span>
              </div>
              <div class="type_list">
                <p class="type">#비타민A</p>
              </div>
            </div>
          </div>
        </div>
        <div class="swiper-slide">
          <div class="product" data-product-name="상품 3" data-product-id="6">
            <img src="/img/product06.jpg" alt="Product 6">
            <div class="product_util">
              <div class="txt1">회사 6</div>
              <div class="txt2">상품 3</div>
              <div class="review">
                <span class="star-point">4.72</span>
                <span class="txt3">(1,104개)</span>
              </div>
              <div class="type_list">
                <p class="type">#비타민A</p>
              </div>
            </div>
          </div>
        </div>
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
      <span class="compare-product-2" data-product-id=""></span>
    </div>
    <div>
      <button class="compare-button">비교하기</button>
      <button class="reset-button">초기화</button>
    </div>
  </div>
   </main>
   
   
 </div>
   
 <script src="/js/header.js"></script>
 <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
  <script src="/js/swipertest.js"></script>
  <script>
    document.addEventListener('DOMContentLoaded', function () {
      const optionsName = {
        recent: ['비타민 A', '비타민 B', '비타민 C'],
        cart: ['상품 1', '상품 2', '상품 3', '상품 4', '상품 5'],
        bookmark: ['나우푸드에서 좋은제품 비타민 a 팔아요']
      };
      const optionsId = {
        recent: ['1', '2', '3'],
        cart: ['4', '5', '6', '7', '8'],
        bookmark: ['9']
      };
      console.log("optionsName");
      console.log(optionsName);

      let compareProduct1 = { id: null, name: null, image: null, company: null, features: [] };
      let compareProduct2 = { id: null, name: null, image: null, company: null, features: [] };

      function updateSubSelect(mainSelect) {
        const subSelect = mainSelect.closest('.check-product').querySelector('.subSelect');
        const selectedValue = mainSelect.value;
        const subOptionsName = optionsName[selectedValue] || [];
        const subOptionsId = optionsId[selectedValue] || [];

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

      function highlightSelectedProducts() {
        document.querySelectorAll('.product').forEach(product => {
          const productId = product.getAttribute('data-product-id');
          if ((compareProduct1.id && compareProduct1.id === productId) || (compareProduct2.id && compareProduct2.id === productId)) {
            product.classList.add('compare-to');
          } else {
            product.classList.remove('compare-to');
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
            compareProduct1 = { id: selectedOptionId, name: selectedOption, image: compareProduct1.image, company: compareProduct1.company, features: compareProduct1.features };
          } else if (parentDivId === 'math2') {
            compareProduct2 = { id: selectedOptionId, name: selectedOption, image: compareProduct2.image, company: compareProduct2.company, features: compareProduct2.features };
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
          const productImage = this.querySelector('img').src;
          const productCompany = this.querySelector('.txt1').textContent;
          const productFeatures = Array.from(this.querySelectorAll('.type_list .type')).map(el => el.textContent);

          let updateTarget;

          if (!compareProduct1.id) {
            compareProduct1 = { id: productId, name: productName, image: productImage, company: productCompany, features: productFeatures };
            updateTarget = document.getElementById('math1');
          } else if (!compareProduct2.id) {
            compareProduct2 = { id: productId, name: productName, image: productImage, company: productCompany, features: productFeatures };
            updateTarget = document.getElementById('math2');
          } else {
            compareProduct1 = { id: productId, name: productName, image: productImage, company: productCompany, features: productFeatures };
            updateTarget = document.getElementById('math1');
          }

          // 해당 상품의 카테고리를 찾기 위해 mainSelect와 subSelect를 업데이트
          const productCategory = this.closest('.swiper-container').classList.contains('recent-products') ? 'recent' :
            this.closest('.swiper-container').classList.contains('cart-products') ? 'cart' : 'bookmark';

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
            compareProduct1 = { id: null, name: null, image: null, company: null, features: [] };
          } else if (parentDivId === 'math2') {
            compareProduct2 = { id: null, name: null, image: null, company: null, features: [] };
          }

          subSelect.style.display = 'block';
          selectBtn.style.display = 'none';

          updateSubSelect(subSelect.closest('.check-product').querySelector('.mainSelect'));
          highlightSelectedProducts();
          updateFooter();
        }
      });

      document.querySelector('.reset-button').addEventListener('click', function () {
        compareProduct1 = { id: null, name: null, image: null, company: null, features: [] };
        compareProduct2 = { id: null, name: null, image: null, company: null, features: [] };
        document.querySelectorAll('.product').forEach(product => {
          product.classList.remove('compare-to');
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

     

     
    });
  </script>
 
</body>
</html>



