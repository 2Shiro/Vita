<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
.article { display: inline-block; }

    /* 사이드바 */
    .sidenav {
      background-color: #f1f1f1;
      position: fixed;
      width: 333px;
      height: 100%;
      margin-left: 78%; 
      margin-top:270px;
      display:inline-block; 
      justify-content : flex-end; 
      font-size:20px;
    }
    
    /* 본문 */


		.body { 
		     font-family: Arial, sans-serif; 
		     margin: 0; 
		     font-size:20px;
		     list-style-type: none;
		 } 
		
		.content {
		    padding: 20px;
		}
		
		#section1{
				margin:0;
				height: 1200px;
				padding-right: 400px;
		    padding-left : 66px;
		}
		#section2,#section3 {
		/* 		margin-top:250px; */
		    padding-top : 290px;
		    height: 1200px;
/* 		    border-bottom: 1px solid #ccc; */
		    padding-right: 400px;
		    padding-left : 66px;
		}
		
		#intro {
				margin-top:250px ;
				margin-right : 300px;
		    height: 600px;
/* 		    border-bottom: 1px solid #ccc; */
		}
		
		#navbar {
/* 				margin: 200px 400px 0px 50px; */
		    display: flex;
		    justify-content: center;
		    padding: 10px 0;
		    background-color: #ED7802;
		    color: #fff;
		}
		
		#navbar ul {
		    list-style-type: none;
		    margin10%;
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
/* 		    border-bottom: 1px solid #ccc; */
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
		

</style>
</head>
<body>
<div class="body">
<%@include file="/WEB-INF/include/Header.jsp"%>
    <!-- 사이드의 구매창 -->
    <div class="sidenav">
        <p class="sub-title">구매창</p>
        	<form action="" id="" >
		        <select name="pro_id" class="form-select" aria-label="Default select example">
						  <option selected>--선택해주세요--</option>
						  <option value="">One</option>
						  <option value="">Two</option>
						  <option value="">Three</option>
						</select>
						<input type='button' onclick='count("minus")' value='-'/>
						<span id='result' >0</span>
						<input type="hidden" name="count" id="count">
						<input type='button' onclick='count("plus")' value='+'/>
					</form>
				 </p>
				 <button class="btn btn-outline-warning" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">장바구니</button>
					<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
					  <div class="offcanvas-header">
					    <h5 id="offcanvasRightLabel">상품을 장바구니에 담았습니다.</h5>
					    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
					    <button type="button" onclick="location.href='#'">장바구니로 가기</button>
					  </div>
					  <div class="offcanvas-body">
					    ...
					  </div>
					</div>
					

				 <button type="button" class="btn btn-warning">구매하기</button>
		</div>
		<!-- 사이드의 구매창 끝 -->
		
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
						  <div>별 평점 <a href="#section2">리뷰보기</a></div>
        			<div>브랜드</div>
        			<div>영양제 이름</div>
        			<div>가격</div>
        			<div>찜하기</div>
					 </div>
        </section>
		<!-- 맨 위 요약페이지 끝 -->
        
		<!-- nav-bar -->
        <nav id="navbar">
            <ul>
                <li><a href="#section1">상품정보</a></li>
                <li><a href="#section2">리뷰(개수)&만족도</a></li>
                <li><a href="#section3">상품 Q&A(FAQ)</a></li>
            </ul>
        </nav>

        <section id="section1">
            <h1>상품정보</h1>
            <p>상품설명+사진들?</p>
        </section>
        <section id="section2">
            <h1>리뷰(개수)&만족도</h1>
            <p></p>
        </section>
        <section id="section3">
        	<h3>자주 묻는 질문</h3>
        		<div>
        			<c:forEach var="faq" items="${faqList}">
        				<button type="button" class="collapsible" onclick="collapse(this);">${faq.question}</button>
        				<div class="content">
        					<p>${faq.answer }</p>
        				</div>
        			</c:forEach>
        		</div>
        </section>
    </div>
    <!-- 상세페이지 끝 -->
	
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
  <script>
   function collapse(element) {
       var before = document.getElementsByClassName("active")[0]               // 기존에 활성화된 버튼
       if (before && document.getElementsByClassName("active")[0] != element) {  // 자신 이외에 이미 활성화된 버튼이 있으면
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
</script>
<!-- +/-버튼 -->
<script type="text/javascript">
function count(type)  {
	  // 결과를 표시할 element
	  const resultElement = document.getElementById('result');
	  
	  // 현재 화면에 표시된 값
	  let number = resultElement.innerText;
	  
	  // 더하기/빼기
	  if(type === 'plus') {
	    number = parseInt(number) + 1;
	  }else if(type === 'minus')  {
	    number = parseInt(number) - 1;
	  }
	  
	  // 결과 출력
	  resultElement.innerText = number;
	}

<!-- count값 받아오기 -->

// 	function count(action){
// 		var result = document.getElementById('result');
// 		var hiddenInput = document.getElementById('count')
// 		var currentCount = parseInt(resultSpan,innerText);
		
// 		if (action === "plus"){
// 			currentCount++;
// 		}else if(action ==="minus" && currentCount >0 ){
// 			currentCount--;
// 		}
// 		resultSpan.innerText = currentCount;
// 		hiddenInput.value = currentCount;		
// 	}
</script>
</div>
</body>
</html>
