<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link href="/css/start.css" rel="stylesheet" />
<link href="/css/header.css" rel="stylesheet" />
<link href="/css/board.css" rel ="stylesheet"/>

<style>
#header {
   
    position: static;
    margin-bottom: 50px;
  }
.main-content .headerWrap {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 14px 20px;
    border: solid 1px #dbdbdb;
    border-bottom: 0 none;
    background-color: #fff;
    border-top: 0 none;
  }

  .main-content .headerWrap .sort-list {
    display: flex;
    align-items: center;
  }

  .main-content .headerWrap .sort-list .sort-list-item .sort-list-btn.on {
    color: #39f;
    font-weight: bold;
  }

  .main-content .headerWrap .sort-list .sort-list-item .sort-list-btn {
    font-size: 13px;
    letter-spacing: 0px;
    color: #666666;
  }

  .main-content .listWrap {
    border: 1px solid #dbdbdb;
  }

  .main-content .listWrap>ul>li {
    position: relative;
    padding: 29px 20px 0;
    background: #fff;
  }

  .main-content .topArea.recommend {
    position: relative;
    /* padding-left: 61px; */
  }

  .main-content .topArea {
    overflow: hidden;
    padding: 0 15px 15px;
    border-bottom: 1px solid #e1e5e8;
  }

  .main-content .topArea .labelSwiper {
    overflow: hidden;
    display: flex;
    position: relative;

    width: calc(100% - 70px);
    height: 22px;
    white-space: nowrap;
  }

  .swiper-container {

    position: relative;
    overflow: hidden;
    list-style: none;
    padding: 0;
    z-index: 1;
  }

  .swiper-wrapper {
    position: relative;
    width: 100%;
    height: 100%;
    z-index: 1;
    display: flex;
    box-sizing: content-box;
  }

  .main-content .topArea .labelSwiper .label:last-child {
    margin-right: 0;
  }

  .main-content .topArea .labelSwiper .label {
    display: inline-block;
    margin-right: 6px;
    padding: 0 6px;
    width: auto;
    height: 22px;
    background: #f0f3f9;
    font-size: 13px;
    letter-spacing: 0px;
    color: #777;
    line-height: 22px;
  }

  .main-content .contArea {
    position: relative;
  }

  .main-content .contArea a,
  .main-content .contArea a:hover,
  .main-content .contArea .post-title {
    color: #000;
  }

  .main-content .post-summary {
    color: #666;
  }

  .main-content .contArea.visited a,
  .main-content .contArea.visited a:hover,
  .main-content .contArea.visited .post-title,
  .main-content .contArea.visited .post-summary {
    color: #999;
  }

  .main-content .post-title {
    position: relative;
    color: #000;
    font-size: 0;
  }

  .main-content .lineOne {
    width: 100%;
    display: block;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }

  .main-content .post-summary {
    position: relative;
    color: #666;
    margin-top: 12px;
    font-size: 15px;
    letter-spacing: 0px;
    line-height: 1.5em;
  }

  .main-content .lineTwo {
    display: block;
    display: -webkit-box;
    overflow: hidden;
    max-height: 3em;
    text-overflow: ellipsis;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    white-space: normal;
    line-height: 1.5em;
    word-wrap: break-word;
    word-break: break-all;
  }

  .main-content .post-cell-box {
    display: inline-block;
    position: relative;
    margin-top: 10px;
    font-size: 15px;
    letter-spacing: 0px;
    color: #666;
  }

  .main-content .post-cell-box .cell {
    display: inline-block;
    position: relative;
    font-size: 13px;
    letter-spacing: 0px;
    color: #999;
    vertical-align: middle;
  }

  .main-content .post-cell-box i {
    display: inline-block;
    font-size: 0;
    vertical-align: middle;
  }


  .main-content .post-cell-box .cell:not(:first-child):before {
    content: "";
    display: inline-block;
    margin: 0 10px;
    width: 1px;
    height: 12px;
    background: #edeef0;
    vertical-align: -2px;
  }

  .main-content .post-util {
    z-index: 5;
    position: absolute;
    right: 0;
    bottom: -7px;
    top: auto;
  }

  .main-content .post-util-item {
    position: relative;
    display: inline-block;
  }

  .main-content .post-util-item button {
    font-size: 0;
    width: 30px;
    height: 30px;
  }

  .btnBookmark:before {
    width: 15px;
    height: 20px;
    background-position: -195px -30px;
  }



  .main-content .post-util .icon-more-button {
    margin-right: -10px;
  }

  .main-content .post-util-item button {
    font-size: 0;
    width: 30px;
    height: 30px;
  }

  .main-content .post-util .icon-more-button::before {
    width: 5px;
    height: 19px;
    margin-top: 2px;
    background-position: -262px -179px;
  }



  .main-content .post-util .view-more-layer.active {
    display: block;
  }

  .main-content .post-util .view-more-layer {
    display: none;
    position: absolute;
    right: 0;
    top: 33px;
    border: 1px solid #565d79;
    background-color: #fff;
  }

  .main-content .post-util .view-more-item {
    display: block;
    width: 80px;
    height: 30px;
    color: #333;
    font-size: 13px;
    letter-spacing: 0px;
    line-height: 30px;
    text-align: center;
  }

  .main-content .post-title span {
    font-size: 20px;
    letter-spacing: -0.5px;
    vertical-align: top;
    margin-top: 5px;
  }

  .main-content .icon-like {
    width: 20px;
    height: 20px;
    display: inline-block;

    background-image: url(/img/hand-thumbs-up.svg);
    background-repeat: no-repeat;
    background-position: 0 0;
    vertical-align: middle;
  }

  .main-content .eyes {
    width: 20px;
    height: 20px;
    display: inline-block;
    background-image: url(/img/eye.svg);
    background-repeat: no-repeat;
    background-position: 0 0;
    vertical-align: middle;
  }

  .icon-answer {
    width: 20px;
    height: 20px;
    display: inline-block;
    background-image: url(/img/chat-left.svg);
    background-repeat: no-repeat;
    background-position: 0 0;
    vertical-align: middle;
  }

  .btnBookmark .icon-bookmark {
    width: 20px;
    height: 20px;
    display: inline-block;
    background-image: url(/img/bookmark-check.svg);
    background-repeat: no-repeat;
    background-position: 0 0;
    vertical-align: middle;

  }

  .iconMore .icon-dots {
    width: 20px;
    height: 20px;
    display: inline-block;
    background-image: url(img/three-dots-vertical.svg);
    background-repeat: no-repeat;
    background-position: 0 0;
    vertical-align: middle;
  }

  .main-content .background-blue {
    background: #f6fafd !important;
  }
  
  .pagination{
  	display: flex;
  	justify-content: center;
  	align-items: center;
  }
  .pagination li{
  padding: 5px;
  }
  .pagination .prev_item{
  	margin-right: 10px
  }
  .pagination .next_item{
  	margin-left: 10px
  }
</style>
</head>
<body>
 
 <div id="wrap" class="active-start">
   <%@include file="/WEB-INF/include/Header.jsp"%>
   <main id="main" class="landing">
      
      <div class="container_wrap">
      <div class="left-sidebar">
        <ul class="left_nav">
          <li class="nav_top">
            <a href="#">질문 · 글쓰기</a>

          </li>
          <li id="my_container">
            <a href="#">
              <p class="left_img"><img src="/img/my_icon.jpg"></p>
              <p>wodud6967@naver.com</p>
            </a>
            <p class="left_textleft">
              <a href="#">나의 글 0</a>
              <a href="#">답변 0</a>
            </p>

          </li>
          <p class="line"></p>
          <li>
            <h4>북마크</h4>
            <ul>
              <li><a href="#"">나우푸드 비타민B</a></li>
              <li><a href=" #"">21st detsqy 비타민A</a></li>
            </ul>
          </li>
          <p class="line"></p>
          <li>
            <h4>최근 검색내용</h4>
            <ul>
              <li><a href="#">종합비타민</a></li>
              <li><a href="#">밀크씨슬</a></li>
            </ul>
          </li>
        </ul>
      </div>
      <div class="main-content">
        <div class="tabs">
          <button class="tablink active" onclick="openTab(event, '전체')">전체</button>
          <button class="tablink" onclick="openTab(event, '인기')">인기</button>
          <button class="tablink" onclick="openTab(event, '북마크')">북마크</button>
        </div>
        <div class="headerWrap">
          <p class="numBx"> <span>총 <b class="num">94,835</b>건</span></p>
          <ul class="sort-list">
            <li class="sort-list-item">
              <button type="button" class="sort-list-btn  devBtnOrderType on" data-ordertype="1">최신순</button>
            </li>
            <li class="sort-list-item">
              <button type="button" class="sort-list-btn  devBtnOrderType " data-ordertype="3">인기순</button>
            </li>
            <li class="sort-list-item">
              <button type="button" class="sort-list-btn  devBtnOrderType " data-ordertype="2">좋아요</button>
            </li>
            <li class="sort-list-item">
              <button type="button" class="sort-list-btn  devBtnOrderType " data-ordertype="4">댓글순</button>
            </li>
          </ul>
        </div>
        <div id="전체" class="tabcontent listWrap" style="display: block;">
          <ul>
          <c:forEach var="post" items="${response.list}">
       
                   
                <c:choose>	     
		     <c:when test="${post.read}">
		  	     <li class="background-blue">
		  	     	<div class="topArea recommend">

	                <div class="labelSwiper swiper-container swiper-container-horizontal">
	                  <div class="labelBx swiper-wrapper" style="transition-duration: 0ms;">
	                   <c:forEach var="mark" items="${post.content_mark}">
	                     <a href="#" class="label swiper-slide swiper-slide-active" target="_blank">#${mark}</a>
	                   </c:forEach>
	               
	                  </div>
	                </div>
	                <div class="contArea visited">
		     </c:when>
		     <c:otherwise>
		     	 <li>
		     	 <div class="topArea recommend">

	                <div class="labelSwiper swiper-container swiper-container-horizontal">
	                  <div class="labelBx swiper-wrapper" style="transition-duration: 0ms;">
	                    <c:forEach var="mark" items="${post.content_mark}">
	                     <a href="#" class="label swiper-slide swiper-slide-active" target="_blank">#${mark}</a>
	                   </c:forEach>
	                  </div>
	                </div>
	                <div class="contArea">
		    
		     </c:otherwise>
	    </c:choose>
                
             
		     
            
        
                  <!-- [Dev] 이미지 포함 컨텐츠 : image 클래스 추가 -->
                  <a href="/Pds/View?post_id=${post.post_id}&nowpage=1" class="post-type ">
                    <div class="post-title">
                      <span class="lineOne">${post.title}</span>
                    </div>
                    <div class="post-summary ">
                   
                       <span class="lineTwo">
                       	${post.content_str } ...
                      </span> 
                    </div>
                  </a>

                  <div class="post-cell-box">
                    <span class="cell">
                      <i class="bi bi-airplane-engines-fill"></i>
                      <i class="eyes">조회수</i>${post.hit_count}


                    </span>
                    <button type="button" class="cell devQstnListLike " data-likecnt="1" data-qstnno="127013">
                      <i class=" icon-like">좋아요</i>
                      <em>${post.like_count}</em>
                    </button>
                    <!-- [Dev] 신규 답변의 경우 icnNew 클래스 추가 -->
                    <span class="cell ">
                      <i class="icon-answer">답변</i><span class="num">${post.comment_count}</span>
                    </span>
                    <span class="cell">${post.created}</span>
                  </div>
                  <!-- [Dev] 북마크 툴팁 show - class tooltip-open 추가 -->
                  <div class="post-util has-tooltip">
                    <div class="post-util-item">
                      <!-- [Dev] 북마크 - class on 추가/제거 -->
                      <button type="button" class="btnBookmark">
                        <i class="icon-bookmark"></i>
                      </button>
                      <div class="book-mark-layer tooltip-layer qnaSpA">

                      </div>
                    </div>
                    <div class="post-util-item">
                      <button type="button" class="iconMore">
                        <i class="icon-dots"></i>
                      </button>
                      <div class="view-more-layer devQnaListPopupMenu">
                        <ul>
                          <li>
                            <a href="#" class="view-more-item devCancelSubscribe" data-subscrno="10031191">구독 취소</a>
                          </li>
                          <li><a href="#" class="view-more-item devSingo" data-idfno="127013" data-type="1">신고</a></li>
                          <li><a href="#" class="view-more-item devBtnBlock" data-mid="jobkoreaofficial">차단</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </li>
            
            </c:forEach>
            
            
            
          </ul>
        </div>
        <div id="인기" class="tabcontent">
          <h2>인기 게시판</h2>
          <p>여기에 인기 게시판 내용이 들어갑니다.</p>
        </div>
        <div id="북마크" class="tabcontent">
          <h2>북마크 게시판</h2>
          <p>여기에 북마크 게시판 내용이 들어갑니다.</p>
        </div>
        
        <%@include file="/WEB-INF/pagination/pdsListPaging.jsp"%>
        
      </div>
      <div class="right-sidebar">
        <h2>내가 본 상품</h2>
        <ul>
          <li>상품 1</li>
          <li>상품 2</li>
          <li>상품 3</li>
        </ul>
        <h2>내가 본 글</h2>
        <ul>
          <li>글 제목 1</li>
          <li>글 제목 2</li>
          <li>글 제목 3</li>
        </ul>
      </div>
    </div>
   </main>
   
   
 </div>
   
 <script src="/js/header.js"></script>
 
<!--   <script src="/js/jwtRequest.js"></script> JWT 요청 스크립트 추가 -->
 <script>
 function openTab(evt, tabName) {
     var i, tabcontent, tablinks;

     tabcontent = document.getElementsByClassName("tabcontent");
     for (i = 0; i < tabcontent.length; i++) {
       tabcontent[i].style.display = "none";
     }

     tablinks = document.getElementsByClassName("tablink");
     for (i = 0; i < tablinks.length; i++) {
       tablinks[i].className = tablinks[i].className.replace(" active", "");
     }

     document.getElementById(tabName).style.display = "block";
     evt.currentTarget.className += " active";
   }
 </script>
 
</body>
</html>



