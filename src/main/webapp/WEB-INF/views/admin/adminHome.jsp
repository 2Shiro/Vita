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
	display: flex;
	justify-content: space-between;
	flex-wrap: wrap;
}

.card {
	background: white;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	margin: 20px;
	padding: 20px;
	width: 30%;
	box-sizing: border-box;
}

.card h3 {
	margin-top: 0;
	color: #333;
}

.card p {
	color: #666;
}

.statistics {
	width: 100%;
	display: flex;
	justify-content: space-around;
	margin: 20px 0;
}

.statistics .stat {
	background: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	text-align: center;
	width: 30%;
}

.statistics .stat h3 {
	margin: 0;
	color: #333;
}

.statistics .stat p {
	color: #666;
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

.sales-records {
	text-align: center;
}

.records-container {
	width: 100%;
	max-width: 1200px;
	margin: 20px auto;
	background: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.records-container h2 {
	text-align: center;
	padding-top: 2%;
	color: #333;
}

.records-container hr {
	border: 0;
	height: 1px;
	background: #ccc;
	margin: 20px 0;
}

.sales-records {
	width: 100%;
	overflow-x: auto;
}

/* 새로운 클래스 추가 */
.records-container {
	background: white;
	border-radius: 8px;
	padding: 20px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
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
	font-weight: bold;
	text-transform: uppercase;
}

tr {
	background: #fff;
	transition: background-color 0.3s ease;
}

tr:hover {
	background-color: #f1f1f1;
}

td {
	color: #555;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
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
	    <div class="statistics">
	        <div class="stat">
	            <h3>총 유저 수</h3>
	            <p>유저수 : ${totalUsers}</p>
	        </div>
	        <div class="stat">
	            <h3>월간 매출</h3>
	            <p>금액 : ${totalAmount}</p>
	        </div>
	    </div>
	</div>

	<div class="records-container">
		<h2>판매기록</h2>
		<hr />
		<div class="search-container">
			<button id="alldayButton">전체</button>
			<button id="monthlyButton">월간</button>
			<button id="weeklyButton">주간</button>
			<button id="dailyButton">일간</button>
			<input type="text" id="searchInput" placeholder="검색...">
			<button id="searchButton">조회</button>
		</div>
			<table>
				<thead>
					<tr>
						<th>No.</th>
						<th>제품이름</th>
						<th>판매자</th>
						<th>판매수량</th>
						<th>출고일</th>
					</tr>
				</thead>
				<tbody id = "stockTableBody">
					<c:forEach items="${stockList}" var="stock">
						<tr>
							<td>${stock.stock_id}</td>
							<td>${stock.pro_name}</td>
							<td>${stock.admin_name}</td>
							<td>${stock.count}</td>
							<td>${stock.additional}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $('#monthlyButton').click(function() {
            $.ajax({
                type: 'POST',
                url: '/MonthlyButton', 
                contentType: 'application/json',
                data: JSON.stringify({}), 
                success: function(response) {
                    console.log('월간 버튼 클릭 후 서버 응답:', response);
                    
                    // 테이블 본문을 비움
                    $('#stockTableBody').empty();
                    
                    response.forEach(function(stock, index) {
                        var row = `<tr>
                            <td>\${stock.stock_id}</td>
                            <td>\${stock.pro_name}</td>
                            <td>\${stock.admin_name}</td>
                            <td>\${stock.count}</td>
                            <td>\${stock.additional}</td>
                        </tr>`;
                        $('#stockTableBody').append(row);
                    });
                },
                error: function(error) {
                    console.error('월간 버튼 클릭 후 에러:', error);
                }
            });
        });
    </script>
    <script>
        $('#alldayButton').click(function() {
            $.ajax({
                type: 'POST',
                url: '/AllDayButton', 
                contentType: 'application/json',
                data: JSON.stringify({}), 
                success: function(response) {
                    console.log('전체 버튼 클릭 후 서버 응답:', response);
                    
                    // 테이블 본문을 비움
                    $('#stockTableBody').empty();
                    
                    response.forEach(function(stock, index) {
                        var row = `<tr>
                            <td>\${stock.stock_id}</td>
                            <td>\${stock.pro_name}</td>
                            <td>\${stock.admin_name}</td>
                            <td>\${stock.count}</td>
                            <td>\${stock.additional}</td>
                        </tr>`;
                        $('#stockTableBody').append(row);
                    });
                },
                error: function(error) {
                    console.error('전체 버튼 클릭 후 에러:', error);
                }
            });
        });
    </script>
        <script>
        $('#weeklyButton').click(function() {
            $.ajax({
                type: 'POST',
                url: '/WeekButton', 
                contentType: 'application/json',
                data: JSON.stringify({}), 
                success: function(response) {
                    console.log('주간 버튼 클릭 후 서버 응답:', response);
                    
                    // 테이블 본문을 비움
                    $('#stockTableBody').empty();
                    
                    response.forEach(function(stock, index) {
                        var row = `<tr>
                            <td>\${stock.stock_id}</td>
                            <td>\${stock.pro_name}</td>
                            <td>\${stock.admin_name}</td>
                            <td>\${stock.count}</td>
                            <td>\${stock.additional}</td>
                        </tr>`;
                        $('#stockTableBody').append(row);
                    });
                },
                error: function(error) {
                    console.error('주간 버튼 클릭 후 에러:', error);
                }
            });
        });
    </script>
    <script>
        $('#dailyButton').click(function() {
            $.ajax({
                type: 'POST',
                url: '/DailyButton', 
                contentType: 'application/json',
                data: JSON.stringify({}), 
                success: function(response) {
                    console.log('일간 버튼 클릭 후 서버 응답:', response);
                    
                    // 테이블 본문을 비움
                    $('#stockTableBody').empty();
                    
                    response.forEach(function(stock, index) {
                        var row = `<tr>
                            <td>\${stock.stock_id}</td>
                            <td>\${stock.pro_name}</td>
                            <td>\${stock.admin_name}</td>
                            <td>\${stock.count}</td>
                            <td>\${stock.additional}</td>
                        </tr>`;
                        $('#stockTableBody').append(row);
                    });
                },
                error: function(error) {
                    console.error('일간 버튼 클릭 후 에러:', error);
                }
            });
        });
    </script>
	<script>
	document.addEventListener("DOMContentLoaded", function() {
	    var searchInput = document.getElementById("searchInput");
	    var searchButton = document.getElementById("searchButton");
	
	    searchButton.addEventListener("click", function() {
	        var searchText = searchInput.value.toLowerCase();
	        var rows = document.querySelectorAll("#stockTableBody tr");
	
	        rows.forEach(function(row) {
	            var productName = row.cells[1].textContent.toLowerCase();
	            var sellerName = row.cells[2].textContent.toLowerCase();
	
	            if (productName.includes(searchText) || sellerName.includes(searchText)) {
	                row.style.display = "";
	            } else {
	                row.style.display = "none";
	            }
	        });
	    });
	
	    searchInput.addEventListener("keypress", function(e) {
	        if (e.key === "Enter") {
	            searchButton.click();
	        }
	    });
	});
	</script>

</body>
</html>
