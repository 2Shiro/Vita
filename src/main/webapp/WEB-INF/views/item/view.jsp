<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/start.css" rel="stylesheet" />
<link href="/css/header.css" rel="stylesheet" />
<link href="/css/item_tab.css" rel="stylesheet" />

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
    width: calc(100% / 5);
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
    border-bottom: 3px solid #ff7f00;
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
  
  
  /* 여기서 부터 시작 */
  #tab_wrap{
  margin-top: 230px;
  }
  
</style>
</head>
<body>
 
 <div id="wrap" class="active-start">
   <%@include file="/WEB-INF/include/Header.jsp"%>
   <main id="main" class="landing">
      
      
      <div id="tab_wrap" class="inner">
        <div class="tabs">
          <div class="tab active" data-target="allProducts">전체</div>
          <div class="tab" data-target="rank">인기</div>
          <div class="tab" data-target="ingredient">성분별</div>
          <div class="tab" data-target="worry">건강고민별</div>
          <div class="tab" data-target="gender">성별</div>

        </div>
<div class="recruitTitContainer">
    <div class="recruitTitBox">
        <div class="recontainer">
            <div class="box_top dev_wrap-department">
                <p class="recruitTit dev-title">카테고리</p>
                <button class="btn_filter fiex_layout">
                    <span class="filter_text dev-select-text selected">인기</span>
                    <i class="arrow"></i>
                </button>
                <div class="filter-box department-box">
                    <ul>
                        <li><button class="dev-button-all">전체</button></li>
                        <li><button class="dev-button-item active">비타민A</button></li>
                        <li><button class="dev-button-item">비타민B</button></li>
                        <li><button class="dev-button-item">비타민C</button></li>
                        <li><button class="dev-button-item">밀크씨슬</button></li>
                        <li><button class="dev-button-item">비오틴</button></li>
                        <li><button class="dev-button-item">홍삼</button></li>
                    </ul>
                    <div class="button-box">
                        <button class="search-reset">초기화</button>
                        <button class="search-button">적용하기</button>
                    </div>
                </div>
            </div>
            <div class="box_bottom">
                <div class="btn_boxes">
                    <div class="btn_box dev_wrap-local">
                        <button class="btn_filter btn_filter_box">
                            <span>지역</span>
                            <span class="filter_text dev-select-text">서울</span>
                            <i class="arrow"></i>
                        </button>
                        <div class="filter-box district-box">
                            <ul>
                                <li><button class="dev-button-all active">전체</button></li>
                                <li><button class="dev-button-item">서울</button></li>
                                <li><button class="dev-button-item">경기</button></li>
                                <li><button class="dev-button-item">인천</button></li>
                                <li><button class="dev-button-item">부산</button></li>
                            </ul>
                            <div class="button-box">
                                <button class="search-reset">초기화</button>
                                <button class="search-button">적용하기</button>
                            </div>
                        </div>
                    </div>
                    <div class="btn_box dev_wrap-career">
                        <button class="btn_filter btn_filter_box">
                            <span>경력</span>
                            <span class="filter_text dev-select-text">신입</span>
                            <i class="arrow"></i>
                        </button>
                        <div class="filter-box carreer-box">
                            <ul>
                                <li><button class="dev-button-item">경력무관</button></li>
                                <li><button class="dev-button-item">신입</button></li>
                                <li><button class="dev-button-item">경력</button></li>
                            </ul>
                            <div class="button-box">
                                <button class="search-reset">초기화</button>
                                <button class="search-button">적용하기</button>
                            </div>
                        </div>
                    </div>
                    <div class="btn_box">
                        <button class="btn_reset" id="resetCondition">
                            <i></i>
                            <span>초기화</span>
                        </button>
                    </div>
                </div>
                <form id="searchForm">
                    <div class="search-box">
                        <input type="text" name="Keyword" maxlength="30" placeholder="기업명 공고명 검색">
                        <button type="button" class="search-button"></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="recruitTitBox tag_box">
        <div class="recontainer">
            <ul>
                <li><button class="tag dev-button-item" data-code="3"><span>💵 절적한 보상</span></button></li>
                <li><button class="tag dev-button-item" data-code="3"><span>⏰ 유연한 근무</span></button></li>
                <li><button class="tag dev-button-item" data-code="3"><span>🔥 인기많은 공고</span></button></li>
                <li><button class="tag dev-button-item" data-code="3"><span>🌎 외국계 기업</span></button></li>
                <li><button class="tag dev-button-item" data-code="3"><span>💎 탄탄한 기업</span></button></li>
                <li><button class="tag dev-button-item" data-code="3"><span>📈 스톡옵션 제공</span></button></li>
                <li><button class="tag dev-button-item" data-code="3"><span>💸 통큰 연봉</span></button></li>
               
            </ul>
        </div>
    </div>
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
 
<!--   <script src="/js/jwtRequest.js"></script> JWT 요청 스크립트 추가 -->
 <script>
 document.addEventListener('DOMContentLoaded', function() {
	 document.querySelectorAll('.tab').forEach(tab => {
	     tab.addEventListener('click', function() {
	         // 모든 탭에서 active 클래스 제거
	         document.querySelectorAll('.tab').forEach(item => item.classList.remove('active'));
	         // 클릭된 탭에 active 클래스 추가
	         this.classList.add('active');
	
	         // 모든 컨테이너에서 active 클래스 제거
	         document.querySelectorAll('.container').forEach(container => container.classList.remove('active'));
	         // 클릭된 탭에 해당하는 컨테이너에 active 클래스 추가
	         const target = this.getAttribute('data-target');
	         document.getElementById(target).classList.add('active');
	     });
	     
	     
	     });
	 
	 document.querySelectorAll('.btn_filter').forEach(function(button) {
	     button.addEventListener('click', function() {
	         // 필터 박스의 가시성 토글
	         var filterBox = this.nextElementSibling;
	         filterBox.classList.toggle('visible');
	     });
	 });
	
	 // 검색 버튼 기능
	 document.querySelectorAll('.search-button').forEach(function(button) {
	     button.addEventListener('click', function() {
	         // 검색 기능 구현
	         var keyword = document.querySelector('input[name="Keyword"]').value;
	         console.log('검색 키워드:', keyword);
	     });
	 });
	
	 // 초기화 버튼 기능
	 document.getElementById('resetCondition').addEventListener('click', function() {
	     // 초기화 기능 구현
	     document.querySelectorAll('.filter-box button.active').forEach(function(button) {
	         button.classList.remove('active');
	     });
	     document.querySelector('input[name="Keyword"]').value = '';
	     console.log('조건이 초기화되었습니다.');
	 });
});
 </script>
 
</body>
</html>



