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
      margin-top:130px;
      display:inline-block; 
      justify-content : flex-end; 
    }
    
    /* 본문 */
    nav {
     margin-top:50px;
     margin-right: 333px;
     font-size:25px;
     position: fixed;
     background-color:white;
     width:100%;
    }
    .tab-content,.tab-pane fade{
     img{ 
     			height:50px;
     }
     margin-top : 50px;
     margin-right: 400px;
     margin-left : 66px;
    }
    


/* styles.css*/
.body { 
     font-family: Arial, sans-serif; 
     margin: 0; 
 } 

.content {
    padding: 20px;
}

section {
		margin-top:250px;
    padding-top : 290px;
    height: 600px;
    border-bottom: 1px solid #ccc;
}

#navbar {
		margin-top : 200px;
    display: flex;
    justify-content: center;
    padding: 10px 0;
    background-color: #ED7802;
    color: #fff;
}

#navbar ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    display: flex;
}

#navbar ul li {
    margin: 0 15px;
}

#navbar ul li a {
    color: #fff;
    text-decoration: none;
}

.sticky {
    position: fixed;
    top: 0;
    width: 100%;
    z-index: 1000;
}

</style>
</head>
<body>
<div class="body">
    <!-- 사이드의 구매창 -->
    <div class="sidenav">
        <p class="sub-title">구매창</p>
        	<form action="" id="">
		        <select class="form-select" aria-label="Default select example">
						  <option selected>--선택해주세요--</option>
						  <option value="1">One</option>
						  <option value="2">Two</option>
						  <option value="3">Three</option>
						</select>
					</form>
				 </p>
		</div>
		<!-- 사이드의 구매창 끝 -->
		
		<!-- 상세페이지 -->
    <div class="content">
        <section id="intro">
            <h1>Scroll down to see the navbar stick</h1>
            <p>Content before the navbar...</p>
        </section>

        <nav id="navbar">
            <ul>
                <li><a href="#section1">상품정보</a></li>
                <li><a href="#section2">리뷰(개수)&만족도</a></li>
                <li><a href="#section3">상품 Q&A(FAQ)</a></li>
            </ul>
        </nav>

        <section id="section1">
            <h1>상품정보</h1>
            <p>Content for section 1...</p>
        </section>
        <section id="section2">
            <h1>리뷰(개수)&만족도</h1>
            <p>Content for section 2...</p>
        </section>
        <section id="section3">
            <h1>상품 Q&A(FAQ)</h1>
            <p>Content for section 3...</p>
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
</div>
</body>
</html>
-
