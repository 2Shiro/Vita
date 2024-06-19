<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="/css/start.css" rel="stylesheet" />
<link href="/css/board.css" rel ="stylesheet"/>
<link href="/css/header.css" rel="stylesheet"/> 


 
  
<style>
 #header {
   overflow:visible;
    position: static;
    margin-bottom: 50px;
  }
.container {
    width: 100%;
    margin: 0 auto;
    font-size: 13px;
  }

  .content-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 11px;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    background: #fcfcfc;
    line-height: 1.5em;
  }

  .content-header h2 {
    font-size: 1.2rem;
  }

  .post-details {
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid #eee;
  }

  .post-details .left,
  .post-details .right {
    display: flex;
    align-items: center;
    padding: 9px;
  }

  .post-details .right span {
    margin-left: 15px;
  }

  .post-content {
    margin-top: 20px;
    padding: 9px;
    margin-bottom: 100px;
  }

  .post-content p img {
    max-width: 100%;
  }

  .content_like {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 20px;
    margin-bottom: 20px;
  }

  .content_like button {
    padding: 4px;
    border: 2px solid blue;
    font-weight: bold;
    color: blue;

  }

  .content_like span {
    display: block;
    position: static;
    padding: 3px 7px 0;
    letter-spacing: 0;
    color: #1171cc;
    border: 1px solid #ccc;
    font-weight: bold;
    margin: 0 10px;
    height: 26px;
    line-height: 21px;
    box-sizing: border-box;
  }

  .content_like button:nth-child(3) {
    border-color: red;
    color: red;
  }


  .like-dislike {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 20px;
  }

  .like-dislike button {
    margin-left: 10px;

  }

  .ben {
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-top: 1px solid #ccc;

    padding: 20px 0;
  }

  .ben button {
    padding: 4px;
    border: 1px solid #ccc;
    font-weight: bold;
  }

  .comments {
    margin-top: 2px;
  }

  .comments h4 {
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 7px;
    box-sizing: border-box;
  }

  .comments ul {
    list-style: none;
    padding: 0;
  }

  .comments ul li {
    margin-bottom: 20px;
    border-bottom: 1px solid #ddd;
    padding-bottom: 10px;
  }

  .comments ul li .comment-details {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  .comments ul li .comment-content {
    margin-top: 10px;
  }

  .comments ul li .like-dislike {
    margin-top: 10px;
  }

  .cmt_editor {
    margin-bottom: 15px;
    padding: 12px 16px 20px;
    background: #fcfcfc;
    border: 1px solid #ddd;
    border-bottom-color: #ccc;
    border-radius: 8px;
    box-shadow: 0 1px 3px -1px rgba(0, 0, 0, .1);
  }



  .cmt_editor_tl {
    margin-bottom: 5px;
    display: block;
  }



  .simple_wrt {
    position: relative;
    margin: 0 60px 0 0;
  }


  .bd_pc #re_cmt .bd_btn,
  .simple_wrt .bd_btn {
    position: absolute;
    top: 0;
    right: -60px;
    width: 56px;
    height: 46px;
    line-height: 56px;
    margin: 0;
    padding: 0;
    cursor: pointer;
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
              <p class="left_img"><img src="/img/my_icon.jpg" alt="User Icon"></p>
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
              <li><a href="#">나우푸드 비타민B</a></li>
              <li><a href="#">21st detsqy 비타민A</a></li>
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
        <div class="container mt-5">
          <div class="content-header">
            <h2>${postVo.title}</h2>
            <span>${postVo.created}</span>
          </div>
          <div class="post-details">
            <div class="left">
              <span>작성자:${postVo.name}</span>
            </div>
            <div class="right">
              <span>조회수 <b>${postVo.hit_count}</b> </span>
              <span>추천수 <b>${postVo.like_count}</b> </span>
              <span>댓글 <b>${postVo.comment_count}</b></span>
            </div>
          </div>
          <div class="post-content">
            ${postVo.content}
          </div>
          <div class="content_like">
            <button>좋아요</button>
            <span>10</span>
            <button>싫어요</button>
          </div>
          <div class="ben">
            <button>목록으로</button>
            <button>신고하기</button>
          </div>
          <div class="comments">
            <h4>댓글 89개</h4>
            <ul>
              <li>
                <div class="comment-details">
                  <span>작성자: <b>user1</b></span>
                  <div class="like-dislike">
                    <button>좋아요</button>
                    <button>싫어요</button>
                  </div>
                </div>
                <div class="comment-content">
                  댓글 내용입니다.
                </div>
              </li>
              <li>
                <div class="comment-details">
                  <span>작성자: <b>user2</b></span>
                  <div class="like-dislike">
                    <button>좋아요</button>
                    <button>싫어요</button>
                  </div>
                </div>
                <div class="comment-content">
                  또 다른 댓글 내용입니다.
                </div>
              </li>
              <!-- 추가 댓글은 여기에 추가 -->
            </ul>
            <div class="cmt_editor" style="margin-top:0px; ">
              <label for="editor_7158233100" class="cmt_editor_tl">
                <strong style="padding-left:5px;">댓글 쓰기</strong>
              </label>
              <form action="./" method="post" onsubmit="" class="bd_wrt cmt_wrt clear">
                <input type="hidden" name="mid" value="best">
                <input type="hidden" name="document_srl" value="7158233100">
                <input type="hidden" name="comment_srl" value="">
                <input type="hidden" name="content" value="">
                <div class="simple_wrt">
                  <div class="text">
                    <input type="hidden" name="use_html" value="Y">
                    <input type="hidden" id="htm_7158233100" value="n">
                    <textarea id="editor_textarea" cols="50" rows="4"
                      style="background: rgb(255, 255, 255); overflow: hidden; min-height: 4em; height: 49px; width: 98%; margin-left: 3px;"
                      class="keyup_alt">
                    </textarea>

                  </div>
                  <input type="submit" value="등록" class="bd_btn keyup_alt">
                </div>
              </form>

            </div>

          </div>
        </div>
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


  <script>
  
  </script>
</body>
 
</body>
</html>



