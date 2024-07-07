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
/* aside  */

	
	 #side_area{
		line-height: 1.3;
         position: relative;
	}
	
	.titTotal {
    display: block;
    }
     .titTotal .link {
    display: block;
    padding: 14px 10px 13px;
    background-color: #f5f7f9;
    font-size: 12px;
    letter-spacing: 0px;
}
.scrapList li:first-child {
    border-top: 1px solid #e6eaf1;
}
 .scrapList li .item {
    display: block;
    padding: 13px 10px 12px;
    background-color: #fff;
}
 .scrapList li .info {
    display: block;
    height: 15px;
    line-height: 14px;
}
.scrapList li .info .day.today {
    color: #fff;
    background-color: #ffa257;
    padding: 0 2px;
}
.scrapList li .info .day {
    font-size: 11px;
    letter-spacing: 0px;
    color: #666;
}
.scrapList li .co {
    font-weight: bold;
    margin-top: 4px;
}
.scrapList li .co, .scrapList li .tx {
    display: block;
    width: 100%;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    font-size: 12px;
    letter-spacing: 0px;
    color: #333;
    padding-bottom: 1px;
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
             <a href="#">나의 글 ${myPostCount}</a>
             <a href="#">답변 0</a>
           </p>
         </li>
         <p class="line"></p>
         <li>
           <h4>북마크</h4>
           <ul>
             <c:forEach var="post" items="${response.list}"> 
           	     <c:choose>
		                  <c:when test="${post.bookmark_count == true}">		                         
		                         <li><a href="#">${post.title }</a></li>
		                  </c:when>
		                  <c:otherwise>				              
		                          
		                 </c:otherwise>
		          </c:choose>
           </c:forEach>
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
         <button class="tablink" onclick="location.href='/Pds/List?nowpage=1'">전체</button>
         <button class="tablink active" onclick="openTab(event, 'my-tab')">나의 글</button>
         <button class="tablink" onclick="openTab(event, 'book-tab')">북마크</button>
       </div>
       <div class="headerWrap">
         <p class="numBx"> <span>총 <b class="num">${count }</b>건</span></p>
         <ul class="sort-list">
           <li class="sort-list-item">
             <button type="button" class="sort-list-btn  devBtnOrderType on" data-ordertype="1">최신순</button>
           </li>
           <li class="sort-list-item">
             <button type="button" class="sort-list-btn  devBtnOrderType " data-ordertype="2">인기순</button>
           </li>
           <li class="sort-list-item">
             <button type="button" class="sort-list-btn  devBtnOrderType " data-ordertype="3">좋아요</button>
           </li>
           <li class="sort-list-item">
             <button type="button" class="sort-list-btn  devBtnOrderType " data-ordertype="4">댓글순</button>
           </li>
         </ul>
       </div>
       <div id="entire-tab" class="tabcontent listWrap" style="display: block;">
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
                      <c:choose>
		                  <c:when test="${post.bookmark_count == true}">
		                         <button type="button" class="btnBookmark on" data-post-id="${post.post_id}">
		                            <i class="icon-bookmark"></i>
		                         </button>
		                         
		                  </c:when>
		                  <c:otherwise>				              
		                          <button type="button" class="btnBookmark" data-post-id="${post.post_id}">
		                            <i class="icon-bookmark"></i>
		                         </button>
		                 </c:otherwise>
		              </c:choose>                                         
                   </div>              
                 </div>
               </div>
             </div>
           </li>         
           </c:forEach>          
         </ul>
       </div>
       <div id="my-tab" class="tabcontent">
         <h2>나의 글 게시판</h2>
         <p>여기에 인기 게시판 내용이 들어갑니다.</p>
       </div>
       <div id="book-tab" class="tabcontent">
         <h2>북마크 게시판</h2>
         <p>여기에 북마크 게시판 내용이 들어갑니다.</p>
       </div>
       
       <%@include file="/WEB-INF/pagination/pdsListPaging.jsp"%>
       
     </div>
     <div class="right-sidebar">
       <div id="side_area">
   <div id="sideScrap">
     <strong class="titTotal"><a href="#" class="link">스크랩 내용</a></strong>
     <ul class="scrapList">  
           <li class="on">
             <a href="/Detail/Detail?po_id=11" class="item">
               <span class="info">              
                     <em class="day today">곧 마감</em>         
               </span>
               <span class="co">ddd</span>
             </a>
           </li>
          <li class="on">
             <a href="/Detail/Detail?po_id=11" class="item">
               <span class="info">              
                     <em class="day today">곧 마감</em>         
               </span>
               <span class="co">ddd</span>
             </a>
           </li>   	
     </ul>
   </div><!-- sideScrap -->
   
 </div>
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

document.addEventListener("DOMContentLoaded", function() {
    document.querySelectorAll(".btnBookmark").forEach(function(button) {
        button.addEventListener("click", function() {
            let postId = this.getAttribute("data-post-id");
            let url = this.classList.contains("on") ? "/Bookmark/Api/DeleteBook" : "/Bookmark/Api/AddBook";
            let data = {
                post_id: postId
            };

            fetch(url, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(data)
            })
            .then(response => response.text())
            .then(result => {
                if (result) {
                    this.classList.toggle("on");
                }
            })
            .catch(error => console.error('Error:', error));
        });
    });

    document.querySelectorAll(".sort-list-btn").forEach(function(button) {
        button.addEventListener("click", function() {
            document.querySelectorAll(".sort-list-btn").forEach(btn => btn.classList.remove("on"));
            this.classList.add("on");
            let orderType = this.getAttribute("data-ordertype");

            let data = {
                orderType: orderType
            };

            fetch("/Pds/Api/List/Order", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(data)
            })
            .then(response => response.json())
            .then(result => {
                // 여기에 데이터 받아서 목록 갱신하는 코드 추가 필요
                console.log(result);

                // 목록 갱신 함수 호출
                updatePostList(result.response.list);
            })
            .catch(error => console.error('Error:', error));
        });
    });
});

function updatePostList(posts) {
    const postListContainer = document.querySelector('.listWrap ul');
    postListContainer.innerHTML = '';

    posts.forEach(post => {
        const postItem = document.createElement('li');

        // 'read' 상태에 따른 클래스 추가
        if (post.read) {
            postItem.classList.add('background-blue');
        }

        postItem.innerHTML = `
            <div class="topArea recommend">
                <div class="labelSwiper swiper-container swiper-container-horizontal">
                    <div class="labelBx swiper-wrapper" style="transition-duration: 0ms;">
                        \${post.content_mark.map(mark => `<a href="#" class="label swiper-slide swiper-slide-active" target="_blank">#\${mark}</a>`).join('')}
                    </div>
                </div>
                <div class="contArea \${post.read ? 'visited' : ''}">
		            <a href="/Pds/View?post_id=${post.post_id}&nowpage=1" class="post-type">
		                <div class="post-title">
		                    <span class="lineOne">\${post.title}</span>
		                </div>
		                <div class="post-summary">
		                    <span class="lineTwo">\${post.content_str} ...</span>
		                </div>
		            </a>
		            <div class="post-cell-box">
	                    <span class="cell">
	                        <i class="bi bi-airplane-engines-fill"></i>
	                        <i class="eyes">조회수</i>\${post.hit_count}
	                    </span>
	                    <button type="button" class="cell devQstnListLike" data-likecnt="1" data-qstnno="\${post.post_id}">
	                        <i class="icon-like">좋아요</i>
	                        <em>\${post.like_count}</em>
	                    </button>
	                    <span class="cell">
	                        <i class="icon-answer">답변</i><span class="num">\${post.comment_count}</span>
	                    </span>
	                    <span class="cell">\${post.created}</span>
	                </div>
	                <div class="post-util has-tooltip">
	                    <div class="post-util-item">
	                        <button type="button" class="btnBookmark \${post.bookmark_count ? 'on' : ''}" data-post-id="\${post.post_id}">
	                            <i class="icon-bookmark"></i>
	                        </button>
	                    </div>
	                </div>
                </div>
            </div>
        `;

        postListContainer.appendChild(postItem);
    });
}
</script>
 
</body>
</html>



