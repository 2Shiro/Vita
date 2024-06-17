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
    min-height: 300px;
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
          <div class="tab" data-target="rank">연령별</div>
          <div class="tab" data-target="ingredient">고민별</div>
          <div class="tab" data-target="worry">건강고민별</div>
          <div class="tab" data-target="gender">성별</div>

        </div>
<div class="recruitTitContainer">
    <div class="recruitTitBox">
        <div class="recontainer">
            <div class="box_top">
                <p class="recruitTit dev-title">카테고리</p>
                <div class="filter-container dev_wrap-category">
                	<button class="btn_filter fiex_layout">
	                    <span class="filter_text dev-select-text selected">전체</span>
	                    <i class="arrow"></i>
                    </button>
                    <div class="filter-box department-box">
                    <ul>
                        <li><button class="dev-button-all" data-dumy="all">전체</button></li>
                        <li><button class="dev-button-item active" data-dumy="인기">팔린순</button></li>
                        <li><button class="dev-button-item" data-dumy="성분">인기순</button></li>
                        <li><button class="dev-button-item" data-dumy="건강">건강고민</button></li>
                        <li><button class="dev-button-item" data-dumy="성별">성별</button></li>
                        
                    </ul>
                    <div class="button-box">
                        <button class="search-reset">초기화</button>
                        <button class="search-btn like_submit">적용하기</button>
                    </div>
                </div>
                </div>
                
                
            </div>
            <div class="box_bottom">
                <div class="btn_boxes">
                    <div class="btn_box filter-container dev_wrap-ingredient">
                        <button class="btn_filter btn_filter_box">
                            <span>성분별</span>
                            <span class="filter_text dev-select-text">전체</span>
                            <i class="arrow"></i>
                        </button>
                        <div class="filter-box district-box">
                            <ul>
                                <li><button class="dev-button-all active" data-dumy="all">전체</button></li>
                                <li><button class="dev-button-item" data-dumy="비타민 A">비타민A</button></li>
                                <li><button class="dev-button-item" data-dumy="비타민 B">비타민B</button></li>
                                <li><button class="dev-button-item" data-dumy="비타민 C">비타민C</button></li>
                                <li><button class="dev-button-item" data-dumy="밀크씨슬">밀크씨슬</button></li>
                                <li><button class="dev-button-item" data-dumy="비오틴">비오틴</button></li>
                                <li><button class="dev-button-item" data-dumy="오메가3">오메가3</button></li>
                                <li><button class="dev-button-item" data-dumy="칼슘">칼슘</button></li>
                            </ul>
                            <div class="button-box">
                                <button class="search-reset">초기화</button>
                                <button class="search-btn like_submit">적용하기</button>
                            </div>
                        </div>
                    </div>
                    <div class="btn_box filter-container dev_wrap-price">
                        <button class="btn_filter btn_filter_box">
                            <span>가격</span>
                            <span class="filter_text dev-select-text">전체</span>
                            <i class="arrow"></i>
                        </button>
                        <div class="filter-box carreer-box">
                            <ul>
                                <li><button class="dev-button-item" data-dumy ="all">전체</button></li>
                                <li><button class="dev-button-item" data-dumy ="10000">1만원이하</button></li>
                                <li><button class="dev-button-item" data-dumy ="20000">2만원이하</button></li>
                                <li><button class="dev-button-item" data-dumy ="30000">3만원이하</button></li>
                                <li><button class="dev-button-item" data-dumy ="50000">5만원이하</button></li>
                                <li><button class="dev-button-item" data-dumy ="100000">10만원이하</button></li>
                            </ul>
                            <div class="button-box">
                                <button class="search-reset">초기화</button>
                                <button class="search-btn like_submit">적용하기</button>
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
                        <button type="button" class="search-button like_submit"></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="recruitTitBox tag_box">
        <div class="recontainer">
            <ul>
                <li><button class="tag dev-button-item" data-code="3"><span>💵 비타민A</span></button></li>
                <li><button class="tag dev-button-item" data-code="3"><span>⏰ 비타민B</span></button></li>
                <li><button class="tag dev-button-item" data-code="3"><span>🔥  비타민C</span></button></li>
                <li><button class="tag dev-button-item" data-code="3"><span>🌎 밀크씨슬</span></button></li>
                <li><button class="tag dev-button-item" data-code="3"><span>💎 칼슘</span></button></li>
                <li><button class="tag dev-button-item" data-code="3"><span>📈 오메가3</span></button></li>
                <li><button class="tag dev-button-item" data-code="3"><span>💸 비오틴</span></button></li>
               
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
 var searchLikeVo ={
			    category: "전체",
				ingredient: "전체",
				price: "전체",
				searchIcon:"전체"
				
		}
		var searchLikeIndex = 0; 
		
		function changeLikeIndex(index, value){
			switch (index){
			case 0:
				searchLikeVo.category = value;
				break;
			case 1:
				searchLikeVo.ingredient = value;
				break;
			case 2:
				searchLikeVo.price =value;
				break;
			case 3:
				searchLikeVo.searchIcon = value;
				break;
			default:
				console.log("서치버튼클릭중 인데슥에서 오류남");
				break;
			}	
		}
		
		
 document.addEventListener('DOMContentLoaded', function() {
	 sendSearchLikeVo(searchLikeVo);
	 
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
	 
	 ////
	 
	   // .btn_filter 클릭 시 부모 .filter-container에 on 클래스 추가 및 제거
    var btnFilters = document.querySelectorAll(".btn_filter");

    btnFilters.forEach(function(button) {
        button.addEventListener("click", function() {
            var parentContainer = this.closest(".filter-container");
            var districtBox = parentContainer.querySelector(".filter-box");

            // 모든 .filter-container의 on 클래스 제거 및 filter-box 숨기기
            var allContainers = document.querySelectorAll(".filter-container");
            allContainers.forEach(function(container) {
                container.classList.remove("on");
                var box = container.querySelector(".filter-box");
                if (box) {
                    box.style.display = "none";
                }
            });

            // 선택된 .filter-container에 on 클래스 추가 및 filter-box 보이기
            if (districtBox) {
                parentContainer.classList.add("on");
                districtBox.style.display = "block";
            }
        });
    });

    // .filter-box 내의 ul > li > button 클릭 시 active 클래스 제어
    document.querySelectorAll(".filter-box ul li button").forEach(function(button) {
        button.addEventListener("click", function() {
            var ulElement = this.closest("ul");
            var allButtons = ulElement.querySelectorAll("li button");

            allButtons.forEach(function(btn) {
                btn.classList.remove("active");
            });

            this.classList.add("active");
        });
    });
    
 // like_submit 클릭 시 선택된 .filter-container의 .btn_filter 안의 모든 span 태그에 값 설정 및 on 클래스 제거
    document.querySelectorAll(".like_submit").forEach(function(button) {
        button.addEventListener("click", function() {
            var activeContainer = document.querySelector(".filter-container.on");
            if (activeContainer) {
                var activeButton = activeContainer.querySelector(".filter-box ul li button.active");
                if (activeButton) {
                    var value = activeButton.textContent;
                    var spans = activeContainer.querySelectorAll(".btn_filter span");
                    spans.forEach(function(span) {
                        span.textContent = value;
                    });

                    // searchLikeVo에 값 설정
                    var parentClass = activeContainer.classList;
                    var btnClass = parentClass.contains('dev_wrap-category') ? 'category' :
                                   parentClass.contains('dev_wrap-ingredient') ? 'ingredient' :
                                   parentClass.contains('dev_wrap-price') ? 'price' : '';

                    switch (btnClass) {
                        case 'category':
                            searchLikeVo.category = value;
                            break;
                        case 'ingredient':
                            searchLikeVo.ingredient = value;
                            break;
                        case 'price':
                        	var dummyValue = activeButton.getAttribute("data-dumy");
                            if (dummyValue) {
                                searchLikeVo.price = dummyValue;
                            }
                            break;
                        default:
                            console.log("서치버튼클릭중 인덱스에서 오류남");
                            break;
                    }
                }

                // on 클래스 제거
                activeContainer.classList.remove("on");
                console.log(searchLikeVo);
                var districtBox = activeContainer.querySelector(".filter-box");
                if (districtBox) {
                    districtBox.style.display = "none";
                }
            }
            var searchForm = document.querySelector("#searchForm");
            if (searchForm) {
                var searchInput = searchForm.querySelector("input[type='text']");
                if (searchInput) {
                	console.log(searchInput);
                	console.log(searchInput);
                    searchLikeVo.searchIcon = searchInput.value;
                    console.log(searchLikeVo.searchIcon);
                    console.log(searchLikeVo.searchIcon);
                }else{
                	searchLikeVo.searchIcon = "전체";
                }
            }
            sendSearchLikeVo(searchLikeVo);
            
        });
    });
 
    
	 // ---------------------------------------------------------------------
	
	
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
 function sendSearchLikeVo(searchLikeVo) {
     fetch('/Item/Popularity', {
         method: 'POST',
         headers: {
             'Content-Type': 'application/json'
         },
         body: JSON.stringify(searchLikeVo)
     })
     .then(response => response.json())
     .then(data => {
         console.log("데이터가 옴");
         console.log(data);
         const allProductsEl = document.getElementById('allProducts');
         allProductsEl.innerHTML = '';  // 기존 내용을 비웁니다.

         data.products.forEach((product, index) => {
             const nutrientStr = product.nutrient.map(nutrient => `<p class="type">#\${nutrient}</p>`).join('');
             const productHtml = `
                 <a href="#" class="product">
                     <div class="ranking_list">
                         <div class="ranking">\${index + 1}위</div>
                     </div>
                     <img src="/img/\${product.img}.jpg" alt="Product \${index + 1}">
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
 }
 </script>
 
</body>
</html>



