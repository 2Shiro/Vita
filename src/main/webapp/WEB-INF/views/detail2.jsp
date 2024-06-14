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

.product-sumary{
			margin : 100px;
}

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
    #scroll {
     margin-top:0px;
     margin-right: 333px;
     font-size:25px;
     position: fixed;
     background-color:#ED7802;
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
    
    /* 스크롤 */
		ul, ol, li {list-style-type: none;}
		a {color: #333; text-decoration: none;}
		
		.list {position: relative; height: 50px; margin-bottom: 50px;}
		.list li {display: inline-block; padding: 0 20px;}
		.listbox {margin: 0 auto; text-align: center;}
		
		.scroll1, .scroll2, .scroll3, .scroll4 {
		 img{ 	height:150px; }
     margin-top : 300px;
     margin-right: 400px;
     margin-left : 66px;
		}

</style>
</head>
<body>
   <%@include file="/WEB-INF/include/Header.jsp"%>
    <div class="product-sumary">
    	<div>
    		사진
    	</div>
    </div>
    
    <!-- 사이드의 구매창 -->
    <div class="sidenav">
        <p class="sub-title">구매창</p>
        	<form action="" id="">
		        <select name="" class="form-select" aria-label="Default select example">
						  <option selected>--선택해주세요--</option>
						  <option value="1">One</option>
						  <option value="2">Two</option>
						  <option value="3">Three</option>
						</select>
					</form>
				 </p>
		</div>
		<!-- 사이드의 구매창 끝 -->
		
		<!-- 테스트용 -->
	<ul role="tablist" data-log-actionid-area="tab"
		class="c_product_tab_list fixed fixed_sm notranslate"
		style="top: 70px;">
		<li role="presentation" class="tab_menu"><button type="button"
				role="tab" data-log-actionid-label="tab"
				data-log-body="{&quot;current_product_no&quot;:3602806109,&quot;first_view_product_no&quot;:3612139004,&quot;send_impression&quot;:&quot;Y&quot;,&quot;btn_name&quot;:&quot;상품정보&quot;}"
				aria-selected="true" aria-controls="tabpanelDetail1"
				id="tabMenuDetail1" data-is-send-log="true" class="">상품정보</button></li>
		<li role="presentation" class="tab_menu"><button type="button"
				role="tab" data-log-actionid-label="tab"
				data-log-body="{&quot;current_product_no&quot;:3602806109,&quot;first_view_product_no&quot;:3612139004,&quot;send_impression&quot;:&quot;Y&quot;,&quot;btn_name&quot;:&quot;리뷰&quot;}"
				aria-selected="false" aria-controls="tabpanelDetail2"
				id="tabMenuDetail2" data-is-send-log="true">
				리뷰 <i>(2,242)</i>
			</button></li>
		<li role="presentation" class="tab_menu"><button type="button"
				role="tab" data-log-actionid-label="tab"
				data-log-body="{&quot;current_product_no&quot;:3602806109,&quot;first_view_product_no&quot;:3612139004,&quot;send_impression&quot;:&quot;Y&quot;,&quot;btn_name&quot;:&quot;Q&amp;A&quot;}"
				aria-selected="false" aria-controls="tabpanelDetail3"
				id="tabMenuDetail3" data-is-send-log="true">
				<span class="text_en">Q&amp;A</span>
			</button></li>
		<li role="presentation" class="tab_menu"><button type="button"
				role="tab" data-log-actionid-label="tab"
				data-log-body="{&quot;current_product_no&quot;:3602806109,&quot;first_view_product_no&quot;:3612139004,&quot;send_impression&quot;:&quot;Y&quot;,&quot;btn_name&quot;:&quot;판매자정보&quot;}"
				aria-selected="false" aria-controls="tabpanelDetail4"
				id="tabMenuDetail4" data-is-send-log="true">
				판매자정보 <i class="text">(반품/교환)</i>
			</button></li>
	</ul>
	<!-- 테스트 끝 -->
		
		
		
            
    <!-- 상세페이지(스크롤) -->    
   <nav id="scroll">
		<div class="nav nav-tabs justify-content-center" id="nav-tab"	role="tablist">
			<button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button"
				role="tab" aria-controls="nav-home" aria-selected="true"><a href="#scroll1" class="scroll_move">상품정보</a></button>
			<button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab"
				aria-controls="nav-profile" aria-selected="false"><a href="#scroll2" class="scroll_move">리뷰(개수)&만족도</a></button>
			<button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab"
				aria-controls="nav-contact" aria-selected="false"><a href="#scroll3" class="scroll_move">상품 Q&A(FAQ)</a></button>
		</div>
	</nav>
		
		<div class="listbox">
		  <div class="scroll1" id="scroll1">
		  	상품정보	
		  </div>
		  <div class="scroll2" id="scroll2">
		  리뷰(개수)&만족도
		  </div>
		  <div class="scroll3" id="scroll3">
		  상품 Q&A(FAQ)
		  </div>
		</div>         
    <!-- 상세페이지(스크롤) 끝 -->   
    
		<!-- 스크롤 스크립트 -->
		<script>
			$(document).ready(function($) {
		        $(".scroll_move").click(function(event){
		            console.log(".scroll_move");         
		            event.preventDefault();
		            $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
		        });
		    });
		</script>
		<script type="text/javascript">
			
		</script>

</body>
</html>
-
