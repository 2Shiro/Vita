<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	justify-content: flex-start; /* 왼쪽 정렬 */
	align-items: center; /* 버튼과 검색창 수직 가운데 정렬 */
	margin-bottom: 10px;
	width: 100%;
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

.search-container input[type="text"] {
	padding: 7px;
	border: 1px solid #ccc;
	border-radius: 4px;
	margin-left: auto; /* 검색창을 오른쪽 끝으로 이동 */
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
			<button id="allReportButton">게시판신고전체</button>
			<button id="checkBanButton">게시판 신고</button>
			<button id="allReportButton">댓글신고전체</button>
			<button id="allReportButton">댓글 전체</button>
			<button id="banUserButton">정지유저</button>
			<input type="text" id="searchInput" placeholder="검색...">
			<button id="searchButton">조회</button>
		</div>
			<div class="table-container">
				<table class="post-listings">
					<thead id = "reportTitle">
						<tr>
							<th>No.</th>
							<th>게시판 번호</th>
							<th>게시판 제목</th>
							<th>신고자</th>
							<th>신고 사유</th>
							<th>신고일</th>
						</tr>
					</thead>
					<tbody id = "reportTableBody">
						<c:forEach items="${reportList}" var="report">
							<tr>
								<td>${report.report_id}</td>
								<td>${report.post_id}</td>
								<td>${report.title}</td>
								<td>${report.email}</td>
								<td>${report.reason}</td>
								<td>${report.created}</td>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div id="infoModal" class="modal">
	    <div class="modal-content">
	        <span class="close">&times;</span>
	        <div id="makeModalContent"></div>
	    </div>
	</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	    <script>
        $('#checkBanButton').click(function() {
            $.ajax({
                type: 'POST',
                url: '/checkBanButton', 
                contentType: 'application/json',
                data: JSON.stringify({}), 
                success: function(response) {
                    console.log('5건이상 버튼 클릭 후 서버 응답:', response);
                    $('#reportTitle').empty();
                    var rows = `<tr>
						<th>No.</th>
						<th>게시판 제목</th>
						<th>신고자</th>
					</tr>`;
						$('#reportTitle').append(rows);
                    // 테이블 본문을 비움
                    $('#reportTableBody').empty();
                    
                    response.forEach(function(report, index) {
                        var row = `
                        <tr>
                            <td>\${report.post_id}</td>
                            <td>\${report.title}</td>
                            <td>\${report.email}</td>
                        </tr>`;
                        $('#reportTableBody').append(row);
                    });
                },
                error: function(error) {
                    console.error('5건이상 버튼 클릭 후 에러:', error);
                }
            });
        });
    </script>
    <script>
        $('#allReportButton').click(function() {
            $.ajax({
                type: 'POST',
                url: '/allReportButton', 
                contentType: 'application/json',
                data: JSON.stringify({}), 
                success: function(response) {
                    console.log('전체 버튼 클릭 후 서버 응답:', response);
                    $('#reportTitle').empty();
                     var rows = `<tr>
							<th>No.</th>
							<th>게시판 번호</th>
							<th>게시판 제목</th>
							<th>신고자</th>
							<th>신고 사유</th>
							<th>신고일</th>
						</tr>`
						$('#reportTitle').append(rows);
                    // 테이블 본문을 비움
                    $('#reportTableBody').empty();
                    
                    response.forEach(function(report, index) {
                        var row = `
                        <tr>
                            <td>\${report.report_id}</td>
                            <td>\${report.post_id}</td>
                            <td>\${report.title}</td>
                            <td>\${report.email}</td>
                            <td>\${report.reason}</td>
                            <td>\${report.created}</td>
                        </tr>`;
                        $('#reportTableBody').append(row);
                    });
                },
                error: function(error) {
                    console.error('전체 버튼 클릭 후 에러:', error);
                }
            });
        });
    </script>
    
    <script>
        $('#banUserButton').click(function() {
            $.ajax({
                type: 'POST',
                url: '/banUserButton', 
                contentType: 'application/json',
                data: JSON.stringify({}), 
                success: function(response) {
                    console.log('전체 버튼 클릭 후 서버 응답:', response);
                    $('#reportTitle').empty();
                     var rows = `<tr>
							<th>No.</th>
							<th>유저아이디</th>
							<th>정지날짜</th>
							<th>정지 사유</th>
							<th>복귀날짜</th>
						</tr>`;
						$('#reportTitle').append(rows);
                    // 테이블 본문을 비움
                    $('#reportTableBody').empty();
                    
                    response.forEach(function(report, index) {
                        var row = `
                        <tr>
                            <td>\${report.ben_id}</td>
                            <td>\${report.email}</td>
                            <td>\${report.reason}</td>
                            <td>\${report.created}</td>
                            <td>\${report.dismiss}</td>
                        </tr>`;
                        $('#reportTableBody').append(row);
                    });
                },
                error: function(error) {
                    console.error('전체 버튼 클릭 후 에러:', error);
                }
            });
        });
    </script>
    <script>
    $('#reportTableBody').on('click', 'tr', function() {
        var post_id = $(this).find('td:first').text();
        $.ajax({
            type: 'POST',
            url: '/banUserButton', 
            contentType: 'application/json',
            data: JSON.stringify({}), 
            success: function(response) {
                console.log('전체 버튼 클릭 후 서버 응답:', response);
        // 모달창 내용 생성
        var modalContent = `
            
        `;

        // 모달창에 내용 표시
        $('#makeModalContent').html(modalContent);

        // 모달창 표시
        $('#infoModal').css('display', 'block');
    });

    // 모달창 닫기 버튼 클릭 시 모달창 숨기기
    $('.close').click(function() {
        $('#infoModal').css('display', 'none');
    });
    </script>
</body>
</html>