<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- JSTL 태그 라이브러리 선언 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	background: #f4f4f4;
	margin: 0;
}

.header {
	background: #007bff;
	color: white;
	padding: 15px 20px;
	text-align: center;
}

.container {
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 20px;
}

.navbar {
	width: 100%;
	background: #333;
	overflow: hidden;
}

.navbar a {
	float: left;
	display: block;
	color: white;
	text-align: center;
	padding: 14px 20px;
	text-decoration: none;
}

.navbar a:hover {
	background: #575757;
}

.content {
	width: 100%;
	max-width: 1200px;
	margin: 20px auto;
	background: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.content h2 {
	text-align: center;
	padding-top: 2%;
	color: #333;
}

.content hr {
	border: 0;
	height: 1px;
	background: #ccc;
	margin: 20px 0;
}

.table-container {
	width: 100%;
	overflow-x: auto;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin: 20px 0;
}

th, td {
	padding: 12px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background: #f4f4f4;
	color: #333;
}

tr:hover {
	background: #f1f1f1;
}

td {
	color: black;
}

.search-container {
	display: flex;
	justify-content: flex-end;
	margin-bottom: 10px;
}

.search-container input[type="text"] {
	padding: 7px;
	margin-right: 10px; /* 검색창과 버튼 사이의 간격 */
	border: 1px solid #ccc;
	border-radius: 4px;
}

.search-container button {
	padding: 7px 15px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin-right: 10px; /* 버튼 간격 */
}

.search-container button:not(:last-child) {
	margin-right: 10px; /* 마지막 버튼을 제외한 모든 버튼에 적용 */
}

.search-container button:hover {
	background-color: #0056b3;
}

/* 모달 스타일 추가 */
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	padding-top: 100px;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	max-width: 500px;
	border-radius: 8px;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.modal {
	display: none; /* Hidden by default */
}

.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
}

.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
<body>

	<div class="header">
		<h1>Admin Dashboard</h1>
	</div>

<div class="navbar">
	<a href="/AdminHome">홈</a>
	<a href="/AdminList">직원 리스트</a>
	<a href="/AdminProduct">상품등록</a>
	<a href="/AdminUserList">사용자 관리</a>
	<a href="/RefundList">환불 관리</a>
	<a href="/MakeList">제조사</a>
	<a href="/Ingredient">성분</a>
	<a href="/FormList">제형</a>
	<a href="/NutrientList">영양분</a>
	<a href="/Inquiry">문의 글</a>
	<a href="/ReportList">신고</a>
	<a href="/AdminLogout">로그아웃</a>
</div>
	<div class="container">
		<div class="content">
			<h2>사용자 리스트</h2>
			<hr />
			<div class="search-container">
				<input type="text" id="searchInput" placeholder="검색...">
				<button id="searchButton">조회</button>
			</div>
			<div class="table-container">
				<table class="post-listings">
					<thead>
						<tr>
							<th>No.</th>
							<th>아이디</th>
							<th>이름</th>
							<th>성별</th>
							<th>생년월일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${userList}" var="user">
							<tr>
								<td>${user.id}</td>
								<td>${user.email}</td>
								<td>${user.name}</td>
								<td>${user.sex}</td>
								<td>${user.birth}</td>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- 모달 창 HTML -->
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <div id="modalContent">
        </div>
    </div>
</div>
	
<script>
document.addEventListener("DOMContentLoaded", function () {
    var modal = document.getElementById("myModal");
    var modalContent = document.getElementById("modalContent");
    var span = document.getElementsByClassName("close")[0];
    var rows = document.querySelectorAll("table.post-listings tbody tr");

    rows.forEach(function (row) {
        row.addEventListener("click", function () {
            var id = this.cells[0].innerText;
            var userEmail = this.cells[1].innerText;
            var userName = this.cells[2].innerText;
            var userSex = this.cells[3].innerText;
            var userBirth = this.cells[4].innerText;

            modalContent.innerHTML = `
                <h2>유저정보</h2>
                <p><strong>회사번호:</strong> \${id}</p>
                <p><strong>이메일:</strong> \${userEmail}</p>
                <p><strong>이름:</strong> \${userName}</p>
                <p><strong>성별:</strong> \${userSex}</p>
                <p><strong>생년월일:</strong> \${userBirth}</p>
                <button class="delete-btn" id="${id}">삭제</button>
            `;
            modal.style.display = "block";
            
            var deleteBtn = modalContent.querySelector(".delete-btn");
            deleteBtn.addEventListener("click", function () {
                console.log('Deleting user with ID:', id);

                fetch('/AdminUserDelete', {
                    method: 'DELETE',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({ id: id })
                })
                .then(response => {
                    console.log('Response status:', response.status);
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json(); 
                })
                .then(data => {
                    console.log('Delete Successful:', data);
                    alert("삭제되었습니다"); 
                    modal.style.display = "none";
                    location.reload(); 
                })
                .catch((error) => {
                    console.error('Delete Error:', error);
                });
            });
        });

        row.addEventListener("mouseover", function () {
            this.style.cursor = 'pointer';
            this.style.backgroundColor = '#f1f1f1';
        });

        row.addEventListener("mouseout", function () {
            this.style.backgroundColor = '';
        });
    });

    span.onclick = function () {
        modal.style.display = "none";
    };

    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    };
});
</script>



</body>
</html>