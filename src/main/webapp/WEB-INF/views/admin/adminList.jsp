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
    <a href="/MakeList">제조사</a>
    <a href="/Ingredient">성분</a>
    <a href="/FormList">제형</a>
    <a href="/NutrientList">영양분</a>
    <a href="/Inquiry">문의 글</a>
    <a href="/AdminLogout">로그아웃</a>
</div>
<div class="container">
    <div class="content">
        <h2>어드민 리스트</h2>
        <hr/>
        <div class="search-container">
            <input type="text" id="searchInput" placeholder="검색...">
            <button id="searchButton">조회</button>
            <button id="addBtn">추가</button>
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


    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
document.addEventListener("DOMContentLoaded", function() {
    var searchInput = document.getElementById("searchInput");
    var searchButton = document.getElementById("searchButton");
    var modal = document.getElementById("myModal");
    var addBtn = document.getElementById("addBtn");
    var span = document.getElementsByClassName("close")[0];

    searchButton.addEventListener("click", function() {
        var searchText = searchInput.value.toLowerCase();
        var rows = document.querySelectorAll("table.post-listings tbody tr");
        rows.forEach(function(row) {
            var name = row.cells[1].textContent.toLowerCase();
            var id = row.cells[2].textContent.toLowerCase();

            if (name.includes(searchText) || id.includes(searchText)) {
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

    addBtn.onclick = function() {
        fetch('/GetNewAdminId', {
            method: 'GET'
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                document.getElementById("admin_id").value = data.newAdminId;
                modal.style.display = "block";
            } else {
                alert('새로운 관리자 ID를 가져오는데 실패했습니다.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('새로운 관리자 ID를 가져오는 중 오류가 발생했습니다.');
        });
    };

    span.onclick = function() {
        modal.style.display = "none";
        location.reload();
    };

    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
            location.reload();
        }
    };

    document.getElementById("addAdminForm").addEventListener("submit", function(event) {
        event.preventDefault();
        var admin_id = document.getElementById("admin_id").value;
        var name = document.getElementById("name").value;
        var id = document.getElementById("id").value;
        var password = document.getElementById("password").value;

        fetch('/InsertAdmin', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                admin_id: admin_id,
                name: name,
                id: id,
                password: password
            })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('관리자가 성공적으로 추가되었습니다.');
                location.reload();
            } else {
                alert('관리자 추가에 실패했습니다. 메시지: ' + data.message);
            }
        })
        .catch((error) => {
            console.error('Error:', error);
            alert('관리자 추가 중 오류가 발생했습니다.');
        });
    });
});

document.addEventListener("DOMContentLoaded", function() {
    var rows = document.querySelectorAll("table.post-listings tbody tr");
    var modal = document.getElementById("myModal");
    var modalContent = document.getElementById("modalContent");
    var adminIdInput = document.getElementById("admin_id");

    rows.forEach(function(row) {
        row.addEventListener("click", function() {
            var admin_id = this.dataset.admin_id;
            console.log("Clicked admin_id: ", admin_id);
            fetchAdminList(admin_id);
            modal.style.display = "block";
            adminIdInput.value = admin_id;
        });

        row.addEventListener("mouseover", function() {
            this.style.cursor = 'pointer';
            this.style.backgroundColor = '#f1f1f1';
        });

        row.addEventListener("mouseout", function() {
            this.style.backgroundColor = '';
        });
    });

    var span = document.getElementsByClassName("close")[0];
    span.onclick = function() {
        modal.style.display = "none";
        location.reload();
    };

    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
            location.reload();
        }
    };

    function fetchAdminList(admin_id) {
        fetch('/GetadminList', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ admin_id: admin_id }),
        })
        .then(response => response.json())
        .then(data => {
            console.log("adminList: ", data);
            displayAdminList(data);
        })
        .catch(error => console.error('Error:', error));
    }

    function displayAdminList(adminList) {
        modalContent.innerHTML = '<h2>어드민 정보</h2>';
        adminList.forEach(function(admin) {
            var adminInfo = document.createElement('div');
            adminInfo.classList.add('admin-info');
            adminInfo.innerHTML =
                `<label for="admin_id">어드민번호</label>
                <input type="text" id="admin_id" name="admin_id"  value = "\${admin.admin_id}" readonly>
                <label for="name">이름</label>
                <input type="text" id="name" name="name" value = "\${admin.name}" required>
                <label for="id">아이디</label>
                <input type="text" id="id" name="id" value = "\${admin.id}" required>
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password" value "\${admin.password}" required>
                <button class="edit-btn" data-admin-id="${admin.admin_id}">수정</button>
                <button class="delete-btn" data-admin-id="${admin.admin_id}">삭제</button>
            `;
            modalContent.appendChild(adminInfo);
        });

        document.querySelectorAll('.edit-btn').forEach(button => {
            button.addEventListener('click', function() {
                var admin_id = this.dataset.adminId;
                console.log('수정 버튼 클릭:', admin_id);

                var adminInfo = this.parentElement;

                var adminIdInput = adminInfo.querySelector('input[name="admin_id"]');
                var nameInput = adminInfo.querySelector('input[name="name"]');
                var idInput = adminInfo.querySelector('input[name="id"]');
                var passwordInput = adminInfo.querySelector('input[name="password"]');

                // 요소가 null인지 확인
                if (!adminIdInput || !nameInput || !idInput || !passwordInput) {
                    console.error('필요한 입력 요소를 찾을 수 없습니다.');
                    alert('필요한 입력 요소를 찾을 수 없습니다.');
                    return;
                }

                var admin_id_value = adminIdInput.value;
                var name = nameInput.value;
                var id = idInput.value;
                var password = passwordInput.value;

                // AJAX 요청으로 서버에 수정된 데이터 전송
                fetch('/UpdateAdmin', {
                    method: 'PUT',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({ admin_id: admin_id_value, name: name, id: id, password: password }),
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        alert('관리자 정보가 성공적으로 업데이트되었습니다.');
                        location.reload();
                    } else {
                        alert('관리자 정보 업데이트에 실패했습니다. 메시지: ' + data.message);
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('관리자 정보 업데이트 중 오류가 발생했습니다.');
                });
            });
        });
        document.querySelectorAll('.delete-btn').forEach(button => {
            button.addEventListener('click', function() {
                const adminInfo = document.querySelector('.admin-info');

                if (!adminInfo) {
                    console.error('adminInfo 요소를 찾을 수 없습니다.');
                    return;
                }

                var adminIdInput = adminInfo.querySelector('input[name="admin_id"]');
                if (!adminIdInput) {
                    console.error('admin_id input 요소를 찾을 수 없습니다.');
                    return;
                }

                console.dir(adminIdInput);
                console.log('삭제 버튼 클릭:', adminIdInput.value);

                if (confirm(adminIdInput.value + ' 번 어드민을 삭제하시겠습니까?')) {
                    fetch('/DeleteAdmin', {
                        method: 'DELETE',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify({ pro_id: adminIdInput.value }) // DELETE 요청에 body를 포함
                    })
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Network response was not ok');
                        }
                        return response.json();
                    })
                    .then(data => {
                        if (data.success) {
                            alert('관리자가 성공적으로 삭제되었습니다.');
                            location.reload();
                        } else {
                            alert('관리자 삭제에 실패했습니다. 메시지: ' + data.error);
                        }
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        alert('관리자 삭제 중 오류가 발생했습니다.');
                    });
                }
            });
        });
    }
});
</script>

</body>
</html>