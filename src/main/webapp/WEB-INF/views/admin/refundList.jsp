<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- JSTL 태그 라이브러리 선언 -->
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
        background-color: rgb(0,0,0); 
        background-color: rgba(0,0,0,0.4); 
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
    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
    .modal input[type="text"], .modal input[type="password"] {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    .modal button {
        padding: 10px 20px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    .modal button:hover {
        background-color: #0056b3;
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
        <h2>환불 신청 리스트</h2>
        <hr/>
        <div class="search-container">
            <input type="text" id="searchInput" placeholder="검색...">
            <button id="searchButton">조회</button>
        </div>
        <div class="table-container">
            <table class="post-listings">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>이름</th>
                        <th>아이디</th>
                        <th>비밀번호</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${adminList}" var="admin">
                        <tr data-admin_id="${admin.admin_id}">
                            <td>${admin.admin_id}</td>
                            <td>${admin.name}</td>
                            <td>${admin.id}</td>
                            <td>${admin.password}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div id="myModal" class="modal">
    <div class="modal-content" id="modalContent">
        <span class="close">&times;</span>
        <h2>어드민 추가</h2>
        <form id="addAdminForm">
            <label for="admin_id">회사번호</label>
            <input type="text" id="admin_id" name="admin_id" readonly>
            <label for="name">이름</label>
            <input type="text" id="name" name="name" required>
            <label for="id">아이디</label>
            <input type="text" id="id" name="id" required>
            <label for="password">비밀번호</label>
            <input type="password" id="password" name="password" required>
            <button type="submit">등록하기</button>
        </form>
    </div>
</div>
</body>
</html>