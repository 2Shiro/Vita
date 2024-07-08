<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-lite.min.css" rel="stylesheet">
<link href="/css/start.css" rel="stylesheet" />
<link href="/css/header.css" rel="stylesheet" />
<link href="/css/board.css" rel ="stylesheet"/>


 
  
<style>
 #header {
   
    position: static;
    margin-bottom: 50px;
  }
.tag-input {
    position: relative;
    border-bottom: solid 1px #edeef0;
    border-top: solid 1px #edeef0;
  }



  .tag-input input {
    width: 100%;
    height: 64px;
    font-size: 15px;
    letter-spacing: 0px;
    color: #333;
    padding: 15px 25px 15px 35px;
    border: 0 none;
    box-sizing: border-box;
    outline: none;
    line-height: 43px;
    text-align: left;
  }

  .lyWriteBoard .writeBoxWrap .btnCommWrap {
    margin: 40px 0;
  }

  .btnCommWrap {
    overflow: hidden;
    text-align: center;
    margin: 40px 0;
  }

  .btnCommWrap button {
    margin: 0 5px;
    width: 135px;
    height: 50px;
    background: #3399ff;
    border: 1px solid #3399ff;
    box-sizing: border-box;
    font-size: 15px;
    letter-spacing: 0px;
    color: #fff;
    line-height: 50px;
  }

  .btnCommWrap button.bg_white {
    background: #fff;
    border-color: #d7d8d9;
    color: #666;
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
    height: 25px;
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
            <h4>최근 본 내용</h4>
            <ul>
              <c:forEach var="item" items="${hitList}">	
                <li><a href="#">${item.title}</a></li>
              
             </c:forEach>
            </ul>
          </li>
        </ul>
      </div>
      <div class="main-content">
        <div class="container mt-5">
          <h2>게시판 수정하기</h2>
          <form id="postForm" method="POST" action="/submit-post">
            <div class="form-group">
              <label for="title">제목</label>
              <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요">
            </div>
            <div class="form-group">
              <label for="content">내용</label>
              <textarea class="form-control" id="content" name="content" rows="10" placeholder="내용을 입력하세요">
              	${postVo.content}
              
              </textarea>
            </div>
            <div class="form-group">
              <label for="file">파일 첨부</label>
              <input type="file" class="form-control-file" id="file">
            </div>
            <div class="tag-input">
              <input type="text" id="devTags"  value="${contentMarks }">
            </div>
            <div class="btnCommWrap">
              <button type="submit" class="btnQuestion devQnaWriteButton">등록하기</button>
              <button type="button" class="btnCancel bg_white devQnaWriteCancelButton">취소</button>
            </div>

          </form>
        </div>
      </div>
      <div class="right-sidebar">
        <div id="side_area">
		   <div id="sideScrap">
		     <strong class="titTotal"><a href="#" class="link">추천 상품</a></strong>
		     <ul class="scrapList">  
		      <c:forEach var="item" items="${recommendList}">		           
		          <li class="on">
		             <a href="#" class="item">
		               <span class="info">              
		                     <em class="day today">${item.name }</em>         
		               </span>
		               <span class="co">
		                 <img src="/img/${item.img}.jpg" >
		               </span>
		             </a>
		           </li>   
		         </c:forEach>  	
		     </ul>
		     <strong class="titTotal"><a href="#" class="link">장바구니 상품</a></strong>
		     <ul class="scrapList">  
		      <c:forEach var="item" items="${basketList}">		           
		          <li class="on">
		             <a href="#" class="item">
		               <span class="info">              
		                     <em class="day today">${item.name }</em>         
		               </span>
		               <span class="co">
		                 <img src="/img/${item.img}.jpg" >
		               </span>
		             </a>
		           </li>   
		         </c:forEach>  	
		     </ul>
		   </div><!-- sideScrap -->   
		 </div>
      </div>
    </div>
     
   </main>
   
   
 </div>
   
 <script src="/js/header.js"></script>
 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-lite.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
  <script>
    document.addEventListener('DOMContentLoaded', function () {
      $('#content').summernote({
        height: 300, // 에디터 높이
        lang: 'ko-KR', // 한국어 설정
        placeholder: '내용을 입력하세요',
        callbacks: {
          onImageUpload: function (files) {
            for (let i = 0; i < files.length; i++) {
              let file = files[i];
              let reader = new FileReader();
              reader.onloadend = function () {
                $('#content').summernote('insertImage', reader.result, 'image name');
              }
              reader.readAsDataURL(file);
            }
          }
        }
      });

      document.getElementById('postForm').addEventListener('submit', function (e) {
        e.preventDefault(); // 폼 제출 방지
        var formData = new FormData(this);
        formData.append('content', $('#content').summernote('code'));
        formData.append('tags', document.querySelector('#devTags').value);
        formData.append('postId', ${postVo.post_id});
        fetch('/Pds/Submit/Update', {
          method: 'POST',
          body: formData
        })
          .then(response => response.json())
          .then(data => {
        	  if (data.ok) {
                  alert('글이 성공적으로 제출되었습니다.');
                  window.location.href = '/Pds/List?nowpage=1';
                } else {
                  alert('글 띠용?.');
                }
          })
          .catch(error => {
            console.error('Error:', error);
            alert('글 제출에 실패했습니다.');
          });
      });
    });
  </script>
</body>
 
</body>
</html>



