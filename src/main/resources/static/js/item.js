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