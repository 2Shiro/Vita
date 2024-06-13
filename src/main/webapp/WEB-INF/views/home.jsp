<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/start.css" rel="stylesheet" />
<link href="/css/header.css" rel="stylesheet" />
<link href="/css/home.css" rel ="stylesheet">
<style>
#main {
    width: 100%;
   height: auto;

  }
.tabs {
    width: 100%;
    display: flex;
    justify-content: center;
    margin-bottom: 20px;
  }

  .tab {
    cursor: pointer;
    width: calc(100% / 6);
    height: 50px;
    line-height: 42px;
    text-align: center;
    font-weight: 700;
    color: #101219;
    font-size: 20px;
    border-bottom: 2px solid #E6E9ED;
    box-sizing: border-box;

  }

  .tab.active {
    border-bottom: 3px solid #6C2FF2;
  }

  .container {
    display: none;
    flex-wrap: wrap;
    /* justify-content: space-between;*/
    padding: 10px;
  }

  .container.active {
    display: flex;
  }

  .inner {
    max-width: 1240px;
    margin: 0 auto;
  }

  .product {
    position: relative;
    background-color: #fff;
    box-sizing: border-box;
    margin: 10px;
    width: calc(25% - 20px);
    /* 4 items per row with margin */
    height: 400px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-decoration: none;
    color: black;
    padding: 10px;

    border: 1px solid #E6E9ED;
    box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
    border-radius: 20px;

  }

  .product .ranking_list {

    position: absolute;
    top: 20px;
    left: 20px;
    z-index: 50;

  }

  .product .ranking_list .ranking {
    width: 40px;
    height: 40px;
    display: inline-block;
    height: 25px;
    line-height: 25px;
    color: #9BA1AA;
    font-weight: 700;
    font-size: 1.2rem;
  }

  .product img {
    height: 44%;
    width: auto;
    object-fit: contain;

  }





  .product .product_util {
    width: 100%;


  }

  .product .product_util div {
    margin-bottom: 5px;
    text-align: left;
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    gap: 8px;
    max-height: 44px;
    line-height: 34px;
    overflow: hidden;
    padding-left: 4px;
  }

  .product .txt1 {
    font-weight: 500;
    display: block;
    font-size: 14px;
    color: #9BA1AA;
    text-align: left;

    margin: 30px 0px 0px 0px;
  }

  .product .txt2 {
    margin-top: -7px;
  }
  .product .txt2 {
    font-weight: 700;
    color: #101219;
    display: block !important;
    font-size: 18px;
    text-align: left;
    line-height: 27px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }
  .product .product_util div p {
    color: #3b65ff;
    background-color: #f0f5ff;
    height: 30px;
    font-size: 12px;
    letter-spacing: 0px;
    line-height: 30px;
    width: auto;
    padding: 0 12px;
    border-radius: 99px
  }

  .product .review .star-point {
    float: left;
    font-weight: 700;
    font-size: 17px;
    color: #535968;
    text-align: left;
    line-height: 20px;
    background: url(/img/star-icon.webp) left 2px no-repeat;
    background-size: 16px 15px;
    padding-left: 20px;
    height: 20px;
  }

  .product .review .txt3 {
    float: left;
    font-weight: 500;
    line-height: 19px;
    height: 20px;
    color: #9BA1AA;
    font-size: 16px;
    margin: 0px 0px 0px 10px;
  }

  .product .product_util .type_list {
    margin: 0;
    margin-top: 10px;
    padding: 0;

  }

  @media (max-width: 1200px) {
    .product {
      width: calc(33.33% - 20px);
      /* 3 items per row */
    }
  }

  @media (max-width: 800px) {
    .product {
      width: calc(50% - 20px);
      /* 2 items per row */
    }
  }

  @media (max-width: 500px) {
    .product {
      width: 100%;
      /* 1 item per row */
      max-width: 340px;
      /* max width 340px */
    }
  }
</style>
</head>
<body>
 
 <div id="wrap" class="active-start">
   <%@include file="/WEB-INF/include/Header.jsp"%>
   <main id="main" class="landing">
      <div class="section1 ui-ani-appear" data-intro-ani="" style="transition-delay: 0ms;">
        <div class="txt">다채로운<br>보험 생활의 시작</div> <!-- // 230629 수정 : 문구 -->
        <div class="img"><img src="/img/main_background01.jpg" alt=""></div>
        <div class="img2"><img src="/img/main_person.png" alt=""></div>
      </div>
      
      <div id="tab_wrap" class="inner">
        <div class="tabs">
          <div class="tab active" data-target="allProducts">전체</div>
          <div class="tab" data-target="rank">인기</div>
          <div class="tab" data-target="ingredient">성분별</div>
          <div class="tab" data-target="worry">건강고민별</div>
          <div class="tab" data-target="gender">성별</div>

        </div>

      </div><!-- tab_wrap -->
      
      <div class="product_list inner">

        <div id="allProducts" class="container active">
          <a href="#" class="product">
            <div class="ranking_list">
              <div class="ranking"> 1위 </div>
            </div>
            <img src="/img/product01.jpg" alt="Product 1">
            <div class="product_util">
              <div class="txt1">쏜리서치</div>
              <div class="txt2">칼슘 마그네슘 말레이트</div>
              <div class="review">
                <span class="star-point">4.72</span>
                <span class="txt3">(1,104개)</span>
              </div>
              <div class="type_list">
                <p class="type">#비타민A</p>
                <p class="type">#비타민B</p>
                <p class="type">#비타민C</p>
                <p class="type">#비타민E</p>
                <p class="type">#비타민E</p>
                <p class="type">#비타민E</p>
              </div>

            </div>

          </a>
          <a href="#" class="product">
            <div class="ranking_list">
              <div class="ranking"> 2위 </div>
            </div>
            <img src="/img/product02.jpg" alt="Product 2">
            <div class="product_util">
              <div class="txt1">회사 1</div>
              <div class="txt2">제목 1</div>
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
          </a>
          <a href="#" class="product">
            <div class="ranking_list">
              <div class="ranking"> 3위 </div>
            </div>
            <img src="product1.jpg" alt="Product 1">
            <div class="product_util">
              <div class="txt1">회사 1</div>
              <div class="txt2">제목 1</div>
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
          </a>
          <a href="#" class="product">
            <div class="ranking_list">
              <div class="ranking"> 4위 </div>
            </div>
            <img src="product1.jpg" alt="Product 1">
            <div class="product_util">
              <div class="txt1">회사 1</div>
              <div class="txt2">제목 1</div>
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
          </a>
          <a href="#" class="product">
            <div class="ranking_list">
              <div class="ranking"> 1위 </div>
            </div>
            <img src="product1.jpg" alt="Product 1">
            <div class="product_util">
              <div class="txt1">회사 1</div>
              <div class="txt2">제목 1</div>
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
          </a>
          <!-- 더 많은 제품을 추가할 수 있습니다 -->
        </div>

        <div id="ingredient" class="container">
          <a href="#" class="product">
            <div class="ranking_list">
              <div class="ranking"> 1위 </div>
            </div>
            <img src="product3.jpg" alt="Product 3">
            <div class="product_util">
              <div class="txt1">회사 1</div>
              <div class="txt2">제목 1</div>
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
          </a>
          <a href="#" class="product">
            <div>순위 2</div>
            <img src="product4.jpg" alt="Product 4">
            <div class="product_util">
              <div class="txt1">회사 1</div>
              <div class="txt2">제목 1</div>
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
          </a>
          <!-- 더 많은 제품을 추가할 수 있습니다 -->
        </div>

        <div id="gender" class="container">
          <a href="#" class="product">
            <div>순위 1</div>
            <img src="product5.jpg" alt="Product 5">
            <div class="product_util">
              <div class="txt1">회사 1</div>
              <div class="txt2">제목 1</div>
              <div class="type_list">
                <p class="type">#비타민A</p>
                <p class="type">#비타민B</p>
                <p class="type">#비타민C</p>
                <p class="type">#비타민E</p>
              </div>
              <div class="review">
                <span class="star-point">4.72</span>
                <span class="txt3">(1,104개)</span>
              </div>
            </div>
          </a>
          <a href="#" class="product">
            <div>순위 2</div>
            <img src="product6.jpg" alt="Product 6">
            <div class="product_util">
              <div class="txt1">회사 1</div>
              <div class="txt2">제목 1</div>
              <div class="type_list">
                <p class="type">#비타민A</p>
                <p class="type">#비타민B</p>
                <p class="type">#비타민C</p>
                <p class="type">#비타민E</p>
              </div>
              <div class="review">
                <span class="star-point">4.72</span>
                <span class="txt3">(1,104개)</span>
              </div>
            </div>
          </a>
          <!-- 더 많은 제품을 추가할 수 있습니다 -->
        </div>
      </div><!-- product_list -->
   </main>
   
   
 </div>
   
 <script src="/js/header.js"></script>
 <script src="/js/home.js"></script>
<!--   <script src="/js/jwtRequest.js"></script> JWT 요청 스크립트 추가 -->
 <script>
 
 document.addEventListener("DOMContentLoaded", function() {
	 fetch('/home/allproducts')
     .then(response => response.json())
     .then(data => {
         console.log("데이터가 옴");
         console.log(data);
         const allProductsEl = document.getElementById('allProducts');
         allProductsEl.innerHTML = '';  // 기존 내용을 비웁니다.

         data.forEach((product, index) => {
             const nutrientStr = product.nutrient.map(nutrient => `<p class="type">#\${nutrient}</p>`).join('');
             const productHtml = `
                 <a href="#" class="product">
                     <div class="ranking_list">
                         <div class="ranking">\${index + 1}위</div>
                     </div>
                     <img src="/img/\${product.img}.jpg" alt="Product ${index + 1}">
                     <div class="product_util">
                         <div class="txt1">\${product.make_name}</div>
                         <div class="txt2">\${product.name}</div>
                         <div class="review">
                             <span class="star-point">\${product.string_average_arting}</span>
                             <span class="txt3">(\${product.total_sell}개)</span>
                         </div>
                         <div class="type_list">
                             \${nutrientStr}
                         </div>
                     </div>
                 </a>
             `;
             allProductsEl.innerHTML += productHtml;
         });
     })
     .catch(error => {
         console.error('Error fetching products:', error);
     });
	});
 /*--------------------------  */
 
 </script>
 
</body>
</html>



