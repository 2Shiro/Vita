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
<link href="/css/aside.css" rel="stylesheet" /> 
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<style>
.overlay {
    position: fixed;
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
    z-index: 1090;  
    align-items: center;
    justify-content: center;
    background-color: rgba(0, 0, 0, .4);
    display: none;
}
.overlay.show {
    display: flex;
}

</style>
</head>
<body>
<div class="overlay" id="overlay">
	 <%@include file="/WEB-INF/include/Aside.jsp"%> 
</div>

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
 <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
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
	 //------------모달------------------
	
    // 별점 채우기
    document.querySelectorAll('.recoAvg').forEach(starScoreElement => {
        const avgstar = parseFloat(starScoreElement.getAttribute('data-reco-rating'));
        const fullStars = Math.floor(avgstar);
        const partialStar = avgstar - fullStars;
        const percentage = Math.round(partialStar * 100);

        const stars = starScoreElement.nextElementSibling.querySelectorAll('.recoStar');
        stars.forEach((recoStar, index) => {
            if (index < fullStars) {
                recoStar.classList.add('full');
            } else if (index === fullStars) {
                recoStar.innerHTML = '<div class="fill" style="width: ' + percentage + '%;"></div>';
            }
        });
    });

    const overlay = document.getElementById('overlay');
    const closeModalBtn = document.getElementById('closeModalBtn');
    const modal = document.getElementById('myModal');

    // 동적으로 생성된 cart-button에 대한 이벤트 위임
    document.body.addEventListener('click', function(event) {
        if (event.target.classList.contains('cart-button')) {
            event.preventDefault();
            overlay.classList.add('show');
            
            setTimeout(() => {
                modal.classList.add('show');
            }, 10); // 10ms 딜레이를 줘서 트랜지션이 잘 작동하도록 함
        }
    });

    closeModalBtn.addEventListener('click', function() {
    	 modal.classList.remove('show');
         setTimeout(() => {
             overlay.classList.remove('show');
         }, 400); // 모달 트랜지션 시간이 끝난 후 오버레이를 제거
    });

    document.getElementById('continueShoppingBtn').addEventListener('click', function() {
        modal.classList.remove('show');
        setTimeout(() => {
            overlay.classList.remove('show');
        }, 400); // 모달 트랜지션 시간이 끝난 후 오버레이를 제거
    });

    document.getElementById('viewCartBtn').addEventListener('click', function() {
        alert('장바구니 보기를 클릭했습니다.');
    });

    // 오버레이를 클릭하면 모달 닫기
    overlay.addEventListener('click', function(event) {
        if (event.target === overlay) {
        	 modal.classList.remove('show');
             setTimeout(() => {
                 overlay.classList.remove('show');
             }, 400); // 모달 트랜지션 시간이 끝난 후 오버레이를 제거
        }
    });

    // 모달 내부 클릭 시 모달 닫히지 않도록 방지
    modal.addEventListener('click', function(event) {
        event.stopPropagation();
    });

    // Swiper 초기화
    var swiper1 = new Swiper('.swiper1', {
        slidesPerView: 2,
        spaceBetween: 10,
        navigation: {
            nextEl: '.swiper1 .custom-swiper-button-next',
            prevEl: '.swiper1 .custom-swiper-button-prev',
        },
    });

    var swiper2 = new Swiper('.swiper2', {
        slidesPerView: 2,
        spaceBetween: 10,
        navigation: {
            nextEl: '.swiper2 .custom-swiper-button-next',
            prevEl: '.swiper2 .custom-swiper-button-prev',
        },
    });
	
	 
	 //---------모달 ---------------
	// 위시리스트 버튼에 이벤트 위임
	    document.body.addEventListener('click', function(event) {
	        if (event.target.classList.contains('wishlist')) {
	        	 event.preventDefault(); 
	            const button = event.target;
	            const isOn = button.classList.toggle('on');
	            const url = isOn ? '/Wishlist/add' : '/Wishlist/delete';
	            const productId = button.closest('.product').dataset.proid;

	            fetch(url, {
	                method: 'POST',
	                headers: {
	                    'Content-Type': 'application/json'
	                },
	                body: JSON.stringify({ pro_id: productId })
	            })
	            .then(response => {
	                if (!response.ok) {
	                    throw new Error('Network response was not ok');
	                }
	                return response.json();
	            })
	            .then(data => {
	                if (data.status === 'success') {
	                    console.log('Operation successful');
	                    // 여기에서 추가적인 작업을 수행할 수 있습니다.
	                } else {
	                    console.error('Operation failed');
	                    button.classList.toggle('on'); // 상태 복원
	                }
	            })
	            .catch(error => {
	                console.error('Fetch error:', error);
	                button.classList.toggle('on'); // 상태 복원
	            });
	        }
	    });
	 // 버튼 호버 이벤트
	    document.body.addEventListener('click', function(event) {
	        if (event.target.classList.contains('cart-button')) {
	            event.preventDefault();
	            console.log('확인');
	        }
	    });
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
             const wishClass = product.wish_id ? 'wishlist on' : 'wishlist';
             const productHtml = `
                 <a href="#" class="product" data-proId="\${product.pro_id}">
                     <div class="ranking_list">
                         <div class="ranking">\${index + 1}위</div>
                     </div>
                     <button class="\${wishClass}" data-product-id="\${product.pro_id}"></button>
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
                     <button class="cart-button">장바구니에 추가</button>  
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



