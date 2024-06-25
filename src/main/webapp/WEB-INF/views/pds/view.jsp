<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

  .comments .comments_wrap {
    list-style: none;
    padding: 0;
  }

  .comments .comments_wrap li {
    margin-bottom: 20px;
    border-bottom: 1px solid #ddd;
    padding-bottom: 10px;
  }

  .comments .comments_wrap li .comment-details {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  .comments .comments_wrap li .comment-content {
    margin-top: 10px;
  }

  .comments .comments_wrap li .like-dislike {
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
  .like-dislike button .icon-like{
    display: inline-block;
    font-size: 0;
    vertical-align: middle;
    width: 20px;
    height: 20px;
    display: inline-block;
    background-image: url(/img/hand-thumbs-up.svg);
    background-repeat: no-repeat;
    background-position: 0 0;
    vertical-align: middle;
  }
  .add-like.select_like .icon-like{
  background-image: url(/img/hand-thumbs-up-fill.svg);
  }
  #editor_textarea{
  	
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
            <button class="icon-like">좋아요</button>
            <span>${postVo.like_count}</span>
            <button>싫어요</button>
          </div>
          <div class="ben">
            <button>목록으로</button>
            <button>신고하기</button>
          </div>
          <div class="comments">
            <h4>댓글 89개</h4>
            <ul class ="comments_wrap">
              <c:forEach var="c" items="${response.list}">
              <li>
                <div class="comment-details">
                  <span>작성자: <b>${c.name }</b></span>
                  <div class="like-dislike">
                    <button class="add-like" data-comme-id ="${c.comme_id}"> 
                       <span class="icon-like"></span>
                       ${ c.like_count }
                    </button>
                   
                  </div>
                </div>
                <div class="comment-content">
                  ${c.content}
                </div>
              </li>
              </c:forEach>
             
              <!-- 추가 댓글은 여기에 추가 -->
            </ul>
            <%@include file="/WEB-INF/pagination/pdsViewPaging.jsp"%>
            
            <div class="cmt_editor" style="margin-top:0px; ">
              <label for="editor_7158233100" class="cmt_editor_tl">
                <strong style="padding-left:5px;">댓글 쓰기</strong>
              </label>
              <form action="/Pds/ApI/Review" method="post" id="commentForm" onsubmit="" class="bd_wrt cmt_wrt clear">
                
                <div class="simple_wrt">
                  <div class="text">
                    
                    <textarea id="editor_textarea" cols="50" rows="4"style="background: rgb(255, 255, 255); overflow: hidden; min-height: 4em; height: 49px; width: 98%; "class="keyup_alt"></textarea>

					
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
document.addEventListener('DOMContentLoaded', function() {
    let postId = ${post_id};
    let totalPageCount = 1; // 초기 페이지 수 설정, 실제 값으로 업데이트 필요

    // 페이지 링크 클릭 이벤트 위임
    document.querySelector('.pagination').addEventListener('click', function(event) {
        if (event.target.classList.contains('page-link')) {
            event.preventDefault();
            let page = parseInt(event.target.getAttribute('data-page'));

            if (!page || event.target.getAttribute('onclick') === "return false;") {
                return;
            }
            loadComments(page);
        }
    });
 // 좋아요 버튼 클릭 이벤트
    document.querySelector('.content_like .icon-like').addEventListener('click', function(event) {
        event.preventDefault();
        
        fetch('/Pds/Api/PostAddLike', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ post_id: postId })
        })
        .then(response => response.json())
        .then(data => {
            console.log('Like added:', data);
            // 좋아요 개수 업데이트
            if (data.success) {
            	console.log("잘온듯")
                  document.querySelector('.content_like span').textContent = data.post_like_count;
                  document.querySelector('.post-details .right span:nth-child(2) b').textContent = data.post_like_count;
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
    });

    // 댓글 폼 제출 이벤트 처리
    document.querySelector('#commentForm').addEventListener('submit', function(event) {
        event.preventDefault();

        const commentText = document.querySelector('#editor_textarea').value;
        totalPageCount = ${totalPageCount};
        const data = {
            content: commentText,
            post_id: postId,
            nowpage: totalPageCount
        };

        fetch('/Pds/Api/Review', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        })
        .then(response => response.json())
        .then(data => {
            console.log('Success:', data);

            // 댓글 목록 업데이트
            const commentList = document.querySelector('.comments_wrap');
            commentList.innerHTML = ''; // 기존 댓글 목록 초기화
            data.list.forEach(comment => {
                const newComment = document.createElement('li');
                newComment.innerHTML = `
                    <div class="comment-details">
                      <span>작성자: <b>\${comment.name}</b></span>
                      <div class="like-dislike">
                        <button class="add-like" data-comme-id ="\${comment.comme_id}">
                          <span class="icon-like"></span>
                          \${comment.like_count}
                        </button>
                      </div>
                    </div>
                    <div class="comment-content">
                      \${comment.content}
                    </div>
                `;
                commentList.appendChild(newComment);
            });

            // 페이징 정보 업데이트
            updatePagination(data.pagination);
        })
        .catch(error => {
            console.error('Error:', error);
        });
    });
    
    // 댓글 좋아요 버튼 클릭 이벤트 위임
    document.querySelector('.comments_wrap').addEventListener('click', function(event) {
        if (event.target.closest('.add-like')) {
            event.preventDefault();
            const likeButton = event.target.closest('.add-like');
            const commentId = likeButton.getAttribute('data-comme-id');
            
            fetch('/Pds/Api/AddLike', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ comme_id: commentId })
            })
            .then(response => response.json())
            .then(data => {
                console.log('Like added:', data);
                // 좋아요 개수 업데이트
               
	            if (data.success) {
	            	
	            	likeButton.classList.add('select_like'); // 클래스 추가
	            	likeButton.querySelector('.icon-like').nextSibling.nodeValue = ` \${data.like_count}`;
	            }
            })
            .catch(error => {
                console.error('Error:', error);
            });
        }
    });
    
    // 댓글 불러오기 함수
    function loadComments(page) {
        fetch('/Pds/Api/Comments', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ post_id: postId, nowpage: page })
        })
        .then(response => response.json())
        .then(data => {
            console.log('Comments loaded:', data);

            const commentList = document.querySelector('.comments_wrap');
            commentList.innerHTML = ''; // 기존 댓글 목록 초기화
            data.list.forEach(comment => {
                const newComment = document.createElement('li');
                newComment.innerHTML = `
                    <div class="comment-details">
                      <span>작성자: <b>\${comment.name}</b></span>
                      <div class="like-dislike">
                        <button class="add-like" data-comme-id ="\${comment.comme_id}">
                          <span class="icon-like"></span>
                          \${comment.like_count}
                        </button>
                      </div>
                    </div>
                    <div class="comment-content">
                      \${comment.content}
                    </div>
                `;
                commentList.appendChild(newComment);
            });

            // 페이징 정보 업데이트
            updatePagination(data.pagination);
        })
        .catch(error => {
            console.error('Error:', error);
        });
    }

    // 페이징 정보 업데이트 함수
    function updatePagination(pagination) {
        const paginationElement = document.querySelector('.pagination');
        paginationElement.innerHTML = ''; // 기존 페이징 정보 초기화

        if (pagination.existPrevPage) {
            paginationElement.innerHTML += `
                <li class="page-item"><a class="page-link" href="#" data-page="1">처음</a></li>
                <li class="page-item prev_item"><a class="page-link" href="#" data-page="\${pagination.prevPage}">⏪</a></li>
            `;
        } else {
            paginationElement.innerHTML += `
                <li class="page-item"><a class="page-link" href="#" onclick="return false;">처음</a></li>
                <li class="page-item prev_item"><a class="page-link" href="#" onclick="return false;">⏪</a></li>
            `;
        }

        for (let i = pagination.startPage; i <= pagination.endPage; i++) {
            if (i === pagination.currentPage) {
                paginationElement.innerHTML += `
                    <li class="page-item"><a class="page-link" href="#" style="font-weight: bold; color: blue; text-decoration: underline;">\${i}</a></li>
                `;
            } else {
                paginationElement.innerHTML += `
                    <li class="page-item"><a class="page-link" href="#" data-page="\${i}">\${i}</a></li>
                `;
            }
        }

        if (pagination.existNextPage) {
            paginationElement.innerHTML += `
                <li class="page-item next_item"><a class="page-link" href="#" data-page="\${pagination.nextPage}">⏩</a></li>
                <li class="page-item"><a class="page-link" href="#" data-page="\${pagination.totalPageCount}">마지막</a></li>
            `;
        } else {
            paginationElement.innerHTML += `
                <li class="page-item next_item"><a class="page-link" href="#" onclick="return false;">⏩</a></li>
                <li class="page-item"><a class="page-link" href="#" onclick="return false;">마지막</a></li>
            `;
        }
    }

    // 페이지가 처음 로드될 때 댓글 불러오기
    loadComments(1);
});
</script>
</body>
 
</body>
</html>



