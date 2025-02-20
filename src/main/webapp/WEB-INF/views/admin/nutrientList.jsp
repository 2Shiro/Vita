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
        <h2>영양분 리스트</h2>
        <hr />
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
                        <th>제품이름</th>
                        <th>성분이름</th>
                        <th>양</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${nutrienList}" var="nut">
                        <tr>
                            <td>${nut.nut_id}</td>
                            <td>${nut.pro_name}</td>
                            <td>${nut.ing_name}</td>
                            <td>${nut.capacity}</td>
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
        <h2>영양분 추가</h2>
        <form id="nutForm">
            <input type="hidden" id="nut_id" name="nut_id" required>
            <label for="type">제품이름</label>
            <input type="number" id="pro_id" name="pro_id" required readonly><br>
            <label for="type">성분이름</label>
            <input type="number" id="ing_id" name="ing_id" required><br>
            <label for="type">양</label>
            <input type="number" id="capacity" name="capacity" required><br>
            <button type="submit">등록하기</button>
        </form>
    </div>
</div>
<div id="productModal" class="modal">
    <div class="modal-content" id="productModalContent">
        <span class="close">&times;</span>
        <h2>제품 선택</h2>
        <input type="text" id="modalsearchInput" placeholder="검색...">
        <button id="modalsearchButton">조회</button>
        <table>
            <thead>
                <tr>
                    <th>No.</th>
                    <th>제품이름</th>
                </tr>
            </thead>
            <tbody id="productTableBody">
                <c:forEach items="${productList}" var="pro">
                    <tr class="productRow" data-id="${pro.pro_id}">
                        <td>${pro.pro_id}</td>
                        <td>${pro.name}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div id="IngredientModal" class="modal">
    <div class="modal-content" id="IngredientModalContent">
        <span class="close">&times;</span>
        <h2>성분 선택</h2>
        <input type="text" id="modalsearchInput2" placeholder="검색...">
        <button id="modalsearchButton2">조회</button>
        <table>
            <thead>
                <tr>
                    <th>No.</th>
                    <th>제품이름</th>
                </tr>
            </thead>
            <tbody id="IngredientTableBody">
                <c:forEach items="${ingList}" var="ing">
                    <tr class="IngredientRow" data-id="${ing.ing_id}">
                        <td>${ing.ing_id}</td>
                        <td>${ing.name}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function(){
        $('#searchButton').click(function(){
            var searchInput = $('#searchInput').val().toLowerCase();
            filterTable(searchInput);
        });

        $('#searchInput').keyup(function(event){
            if (event.keyCode === 13) { // 엔터 키의 키코드가 13입니다.
                var searchInput = $(this).val().toLowerCase();
                filterTable(searchInput);
            } else if ($(this).val() === '') {
                // 검색어가 비어있을 때 모든 행 보이기
                $('table.post-listings tbody tr').show();
            }
        });

        function filterTable(searchInput) {
            $('table.post-listings tbody tr').each(function() {
                var rowText = $(this).text().toLowerCase();
                if (rowText.indexOf(searchInput) === -1) {
                    $(this).hide();
                } else {
                    $(this).show();
                }
            });
        }
    });
</script>

<script>
    $(document).ready(function() {
        var modal = $('#myModal');
        var btn = $('#addBtn');
        var span = $('.close');

        btn.click(function() {
            modal.show();
        });

        span.click(function() {
            modal.hide();
        });

        $(window).click(function(event) {
            if ($(event.target).is(modal)) {
                modal.hide();
            }
        });
    });

    </script>
    
        <!-- 제품이름리스트 모달창  -->
    <script>
    $(document).ready(function() {
        var modal = $('#productModal');
        var btn = $('#pro_id');
        var span = $('.close');

        btn.click(function() {
            modal.show();
        });

        span.click(function() {
            modal.hide();
        });

        $(window).click(function(event) {
            if ($(event.target).is(modal)) {
                modal.hide();
            }
        });
    });
	</script>
	
	<!-- 제품이름 리스트 글릭구현 검색구현  -->
	<script>
    $(document).ready(function() {
        var productModal = $('#productModal');
        var btn = $('#pro_id');
        var span = $('.close');

        btn.click(function() {
            productModal.show();
        });

        span.click(function() {
            productModal.hide();
        });

        $(window).click(function(event) {
            if ($(event.target).is(productModal)) {
                productModal.hide();
            }
        });

        // 행 클릭 시 pro_id 입력
        var productRows = document.getElementsByClassName('productRow');
        for (var i = 0; i < productRows.length; i++) {
            productRows[i].addEventListener('click', function() {
                var proId = this.getAttribute('data-id');
                $('#pro_id').val(proId); // pro_id 값을 modalContent의 필드에 설정
                productModal.hide(); // productModal 닫기
                $('#myModal').show(); // myModal 열기
            });
        }
    });

    // 제품이름 리스트 모달창 검색창
    var searchButton = document.getElementById('modalsearchButton');
    var searchInput = document.getElementById('modalsearchInput');
    var productTableBody = document.getElementById('productTableBody');
    var rows = productTableBody.getElementsByTagName('tr');

    function filterTable() {
        var filter = searchInput.value.toLowerCase();
        for (var i = 0; i < rows.length; i++) {
            var row = rows[i];
            var cells = row.getElementsByTagName('td');
            var match = false;
            for (var j = 0; j < cells.length; j++) {
                var cell = cells[j];
                if (cell.innerHTML.toLowerCase().indexOf(filter) > -1) {
                    match = true;
                    break;
                }
            }
            if (match) {
                row.style.display = "";
            } else {
                row.style.display = "none";
            }
        }
    }

    searchButton.addEventListener('click', filterTable);

    // 엔터 키를 누를 때도 filterTable 함수 호출
    searchInput.addEventListener('keyup', function(event) {
        if (event.key === 'Enter') {
            filterTable();
        }
    });
	</script>
	
	<!-- 성분 모달창 -->
	<script>
    $(document).ready(function() {
        var modal = $('#IngredientModal');
        var btn = $('#ing_id');
        var span = $('.close');

        btn.click(function() {
            modal.show();
        });

        span.click(function() {
            modal.hide();
        });

        $(window).click(function(event) {
            if ($(event.target).is(modal)) {
                modal.hide();
            }
        });
    });
	</script>
		<!-- 성분 리스트 모달창 검색기능 -->
<script>
$(document).ready(function() {
    var productModal = $('#IngredientModal');
    var btn = $('#ing_id');
    var span = $('.close');

    btn.click(function() {
        productModal.show();
    });

    span.click(function() {
        productModal.hide();
    });

    $(window).click(function(event) {
        if ($(event.target).is(productModal)) {
            productModal.hide();
        }
    });

    var ingredientRow = document.getElementsByClassName('IngredientRow');
    for (var i = 0; i < ingredientRow.length; i++) {
        ingredientRow[i].addEventListener('click', function() {
            var ingId = this.getAttribute('data-id');
            $('#ing_id').val(ingId); 
            productModal.hide(); 
            $('#myModal').show(); 
        });
    }
});

var searchButton = document.getElementById('modalsearchButton2');
var searchInput = document.getElementById('modalsearchInput2');
var productTableBody = document.getElementById('IngredientTableBody');
var rows = productTableBody.getElementsByTagName('tr');

searchButton.addEventListener('click', filterTable);

function filterTable() {
    var filter = searchInput.value.toLowerCase();
    for (var i = 0; i < rows.length; i++) {
        var row = rows[i];
        var cells = row.getElementsByTagName('td');
        var match = false;
        for (var j = 0; j < cells.length; j++) {
            var cell = cells[j];
            if (cell.innerHTML.toLowerCase().indexOf(filter) > -1) {
                match = true;
                break;
            }
        }
        if (match) {
            row.style.display = "";
        } else {
            row.style.display = "none";
        }
    }
}

// 엔터 키를 누를 때도 filterTable 함수 호출
searchInput.addEventListener('keyup', function(event) {
    if (event.key === 'Enter') {
        filterTable();
    }
});
</script>
	
     <script>
	document.getElementById("nutForm").addEventListener("submit", function(event) {
    event.preventDefault();
    var pro_id = document.getElementById("pro_id").value;
    var ing_id = document.getElementById("ing_id").value;
    var capacity = document.getElementById("capacity").value;
    fetch('/InsertNut', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
        	pro_id : pro_id,
        	ing_id : ing_id,
        	capacity : capacity
        })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('영양분이 성공적으로 추가되었습니다.');
            location.reload();
        } else {
            alert('영양분 추가에 실패했습니다. 메시지: ' + data.message);
        }
    })
    .catch((error) => {
        console.error('Error:', error);
        alert('영양분 추가 중 오류가 발생했습니다.');
    });
});
</script>
</body>
</html>