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
    /* 추가된 CSS */
    table th, table td {
        width: 10%;
    }
    /* 모달창 스타일 */
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgb(0,0,0);
        background-color: rgba(0,0,0,0.4);
        padding-top: 60px;
    }
    .modal-content {
        background-color: #fefefe;
        margin: 5% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
        max-width: 600px;
        border-radius: 10px;
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
        <h2>상품 리스트</h2>
        <hr />
        <div class="search-container">
            <input type="text" placeholder="검색...">
            <button>조회</button>
            <button id="addBtn">추가</button>
        </div>
        <div class="table-container">
            <table class="post-listings">
                <thead>
                    <tr>
                        <th>제품 번호</th>
                        <th>비타민 이름</th>
                        <th>제조사</th>
                        <th>성분 이름</th>
                        <th>제품주소</th>
                        <th>제형(가루,알약,액체)</th>
                        <th>약설명서</th>
                        <th>주의사항</th>
                        <th>가격</th>
                        <th>재고</th>
                        <th>등록직원</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${productList}" var="pro">
                        <tr data-pro_id="${pro.pro_id}">
                            <td>${pro.pro_id}</td>
                            <td>${pro.name}</td>
                            <td>${pro.make_name}</td>
                            <td>${pro.ing_name}</td>
                            <td>${pro.url}</td>
                            <td>${pro.type}</td>
                            <td>${pro.explain}</td>
                            <td>${pro.caution}</td>
                            <td>${pro.price}</td>
                            <td>${pro.count}</td>
                            <td>${pro.admin_name}</td>
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
        <h2>물품추가</h2>
        <form id="addAdminForm" enctype="multipart/form-data">
            <label for="pro_id">제품번호</label>
            <input type="number" id="pro_id" name="pro_id" readonly><br>
            <label for="name">제품명</label>
            <input type="text" id="name" name="name" required><br>
            <label for="make_id">제조사</label>
            <input type="text" id="make_id" name="make_id" required><br>
            <label for="ing_id">성분</label>
            <input type="text" id="ing_id" name="ing_id" required><br>
            <label for="img">사진</label>
            <input type="file" id="img" name="img" multiple required><br>
            <label for="url">제품사url</label>
            <input type="text" id="url" name="url" required><br>
            <label for="form_id">제형</label>
            <input type="number" id="form_id" name="form_id" required><br>
            <label for="explain">약설명서</label>
            <input type="text" id="explain" name="explain" required><br>
            <label for="caution">주의사항</label>
            <input type="text" id="caution" name="caution" required><br>
            <label for="count">재고</label>
            <input type="number" id="count" name="count" required><br>
            <label for="price">가격</label>
            <input type="number" id="price" name="price" required><br>
            <button type="submit">등록하기</button>
            <input type="hidden" id="admin_id" name="admin_id" value="1" required><br>
            <input type="hidden" id="state" name="state" value="1" required><br>
        </form>
    </div>
</div>


<!-- 제조사 선택 모달 -->
<div id="makeModal" class="modal">
    <div class="modal-content" id="makeModalContent">
        <span class="close">&times;</span>
        <h2>제조사 선택</h2>
        <input type="text" id="modalsearchInput1" placeholder="검색...">
        <button id="makemodalsearchButton1">조회</button>
        <button id="makemodaladdButton1">회사추가</button>
        <table>
            <thead>
                <tr>
                    <th>No.</th>
                    <th>회사이름</th>
                    <th>연락처</th>
                    <th>주소</th>
                </tr>
            </thead>
            <tbody id="makeTableBody">
                <c:forEach items="${makeList}" var="make">
                    <tr class="makeRow" data-id="${make.make_id}">
                        <td>${make.make_id}</td>
                        <td>${make.name}</td>
                        <td>${make.tel}</td>
                        <td>${make.address}</td> <!-- 추가된 열 -->
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<!-- 회사추가 모달 -->
<div id="makeAddModal" class="modal">
	<div class="modal-content" id="makeAddModalContent">
		<span class="close">&times;</span>
		<h2>회사정보 추가</h2>
		<form id="MakeForm">
			<input type="hidden" id="make_id" name="make_id" readonly>
			<label for="makeAddName">이름</label>
			<input type="text" id="makeAddName" name="makeAddName" required><br>
			<label for="tel">연락처</label>
			<input type="text" id="tel" name="tel" required><br>
			<div class="form-group">
				<label for="zipcode">우편번호</label>
				<input type="text" id="zipcode" name="zipcode" required readonly><br>
				<label for="com_adr">주소</label>
				<div class="input-group">
					<input type="text" class="form-control" id="address" name="address" placeholder="회사주소를 입력하세요" required readonly><br>
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" type="button" id="searchAdr">주소 검색</button>
					</div>
				</div>
			</div>
			<label for="addressdetail">상세주소</label>
			<input type="text" id="addressdetail" name="addressdetail" required><br>
			<button type="submit">등록하기</button>
		</form>
	</div>
</div>
    <!-- 성분모달 -->
    <div id="ingModal" class="modal">
        <div class="modal-content" id="ingModalContent">
            <span class="close">&times;</span>
            <h2>성분 선택</h2>
            <input type="text" id="modalsearchInput2" placeholder="검색...">
            <button id="makemodalsearchButton2">조회</button>
            <table>
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>성분이름</th>
                    </tr>
                </thead>
                <tbody id="ingTableBody">
                    <c:forEach items="${ingList}" var="ing">
                        <tr class="ingRow" data-id="${ing.ing_id}">
                            <td>${ing.ing_id}</td>
                            <td>${ing.name}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <!-- 제형모달 -->
    <div id="formModal" class="modal">
        <div class="modal-content" id="formModalContent">
            <span class="close">&times;</span>
            <h2>성분 선택</h2>
            <input type="text" id="modalsearchInput3" placeholder="검색...">
            <button id="makemodalsearchButton3">조회</button>
            <table>
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>재형</th>
                    </tr>
                </thead>
                <tbody id="formTableBody">
                    <c:forEach items="${formList}" var="form">
                        <tr class="formRow" data-id="${form.form_id}">
                            <td>${form.form_id}</td>
                            <td>${form.type}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
	<div id="infoModal" class="modal">
	    <div class="modal-content">
	        <span class="close">&times;</span>
	        <div id="makeModalContent1"></div>
	    </div>
	</div>
	    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
    // 검색 기능 구현
    $('.search-container input[type="text"]').on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $(".post-listings tbody tr").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
    });

    var modal = $("#myModal");
    var span = $(".close");

    $("#addBtn").click(function() {
        fetch('/GetNewpProid', { method: 'GET' })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    $("#pro_id").val(data.newAdminId);
                    modal.css("display", "block");
                } else {
                    alert('새로운 관리자 ID를 가져오는데 실패했습니다.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('새로운 관리자 ID를 가져오는 중 오류가 발생했습니다.');
            });
    });

    span.click(function() {
        modal.css("display", "none");
    });

    $(window).click(function(event) {
        if (event.target.id == "myModal") {
            modal.css("display", "none");
        }
    });

	// 폼 제출 이벤트 처리
	$("#addAdminForm").submit(function(event) {
	    event.preventDefault();
	
	    var productData = {
	        pro_id: $("#pro_id").val(),
	        name: $("#name").val(),
	        make_id: $("#make_id").val(),
	        ing_id: $("#ing_id").val(),
	        url: $("#url").val(),
	        form_id: $("#form_id").val(),
	        explain: $("#explain").val(),
	        caution: $("#caution").val(),
	        price: $("#price").val()
	    };
	
	    var stockData = {
	        pro_id: $("#pro_id").val(),
	        admin_id: $("#admin_id").val(),
	        count: $("#count").val(),
	        state: $("#state").val()
	    };
	
	    var imgFiles = $("#img")[0].files;
	    var formData = new FormData();
	    formData.append("product", JSON.stringify(productData));
	    formData.append("stock", JSON.stringify(stockData));
	    for (var i = 0; i < imgFiles.length; i++) {
	        formData.append("imgFiles", imgFiles[i]);
	    }
	
	    $.ajax({
	        type: "POST",
	        url: "/InsertProduct",
	        data: formData,
	        processData: false,
	        contentType: false,
	        success: function(response) {
	            alert('물품이 성공적으로 추가되었습니다.');
	            location.reload();
	        },
	        error: function(error) {
	            console.error('Error:', error);
	            alert('물품 추가 중 오류가 발생했습니다. 메시지: ' + error.responseText);
	        }
	    });
	});
});
</script>
        <!-- 제조사리스트 모달창  -->
    <script>
    $(document).ready(function() {
        var modal = $('#makeModal');
        var btn = $('#make_name');
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
		<!-- 제조사 리스트 클릭구현 검색구현  -->

	<script>
    $(document).ready(function() {
        var makeModal = $('#makeModal');
        var btn = $('#make_id');
        var span = $('.close');

        btn.click(function() {
            makeModal.css('display', 'block');
        });

        span.click(function() {
            makeModal.css('display', 'none');
        });

        $(window).click(function(event) {
            if ($(event.target).is(makeModal)) {
                makeModal.css('display', 'none');
            }
        });

        var makeRows = document.getElementsByClassName('makeRow');
        for (var i = 0; i < makeRows.length; i++) {
            makeRows[i].addEventListener('click', function() {
                var make_id = this.getAttribute('data-id');
                $('#make_id').val(make_id); // make_id 값을 modalContent의 필드에 설정
                makeModal.css('display', 'none'); // makeModal 닫기
                $('#myModal').css('display', 'block'); // myModal 열기
            });
        }
    });

    // 제조사 리스트 모달창 검색창
    var searchButton = document.getElementById('makemodalsearchButton1');
    var searchInput = document.getElementById('modalsearchInput1');
    var makeTableBody = document.getElementById('makeTableBody');
    var rows = makeTableBody.getElementsByTagName('tr');

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
<!-- 회사 추가 -->
<script>
$(document).ready(function() {
    var modal = $('#makeAddModal');
    var btn = $('#makemodaladdButton1');
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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
// 주소 api
document.getElementById('searchAdr').addEventListener('click', function() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 주소 선택 후 처리할 코드
            document.getElementById('address').value = data.address;
            document.getElementById('zipcode').value = data.zonecode;
        }
    }).open();
});
</script>
<script>
	document.getElementById("MakeForm").addEventListener("submit", function(event) {
		event.preventDefault();
		var name = document.getElementById("makeAddName").value;
		var tel = document.getElementById("tel").value;
		var zipcode = document.getElementById("zipcode").value;
		var address = document.getElementById("address").value;
		var addressdetail = document.getElementById("addressdetail").value;

		fetch('/InsertMake', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({
				name: name,
				tel: tel,
				zipcode: zipcode,
				address: address,
				addressdetail: addressdetail
			})
		})
		.then(response => response.json())
		.then(data => {
			if (data.success) {
				alert('회사가 성공적으로 추가되었습니다.');
				document.getElementById("makeAddModal").style.display = "none"; // 모달 창 닫기
				location.reload();
			} else {
				alert('회사 추가에 실패했습니다. 메시지: ' + data.message);
				document.getElementById("makeAddModal").style.display = "block"; // 모달 창 다시 열기
			}
		})
		.catch((error) => {
			console.error('Error:', error);
			alert('회사가 추가 중 오류가 발생했습니다.');
			document.getElementById("makeAddModal").style.display = "block"; // 모달 창 다시 열기
		});
	});
	
	document.querySelector(".close").addEventListener("click", function() {
		document.getElementById("makeAddModal").style.display = "none";
	});
	
	document.getElementById("searchAdr").addEventListener("click", function() {
		// 주소 검색 기능을 여기에 추가
	});
</script>
        <!-- 성분리스트 모달창  -->
    <script>
    $(document).ready(function() {
        var modal = $('#ingModal');
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
		<!-- 제조사 리스트 클릭구현 검색구현  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
    var makeModal = $('#ingModal');
    var btn = $('#ing_id');
    var span = $('.close');

    btn.click(function() {
        makeModal.css('display', 'block');
    });

    span.click(function() {
        makeModal.css('display', 'none');
    });

    $(window).click(function(event) {
        if ($(event.target).is(makeModal)) {
            makeModal.css('display', 'none');
        }
    });

    var ingRow = document.getElementsByClassName('ingRow');
    for (var i = 0; i < ingRow.length; i++) {
        ingRow[i].addEventListener('click', function() {
            var ing_id = this.getAttribute('data-id');
            console.log(ing_id); // 디버그용 출력
            $('#ing_id').val(ing_id); // 성분 ID 값을 ing_id 요소에 설정
            makeModal.css('display', 'none'); // makeModal 닫기
        });
    }

    // 제조사 리스트 모달창 검색창
    var searchButton = document.getElementById('makemodalsearchButton2');
    var searchInput = document.getElementById('modalsearchInput2');
    var ingTableBody = document.getElementById('ingTableBody');
    var rows = ingTableBody.getElementsByTagName('tr');

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
});
</script>
<!-- 제형 모달 검색기능 클릭시 리스트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
    var makeModal = $('#formModal');
    var btn = $('#form_id');
    var span = $('.close');

    btn.click(function() {
        makeModal.css('display', 'block');
    });

    span.click(function() {
        makeModal.css('display', 'none');
    });

    $(window).click(function(event) {
        if ($(event.target).is(makeModal)) {
            makeModal.css('display', 'none');
        }
    });

    var formRow = document.getElementsByClassName('formRow');
    for (var i = 0; i < formRow.length; i++) {
        formRow[i].addEventListener('click', function() {
            var form_id = this.getAttribute('data-id');
            console.log(form_id); // 디버그용 출력
            $('#form_id').val(form_id); // 제형 ID 값을 form_id 요소에 설정
            makeModal.css('display', 'none'); // makeModal 닫기
        });
    }

    // 제조사 리스트 모달창 검색창
    var searchButton = document.getElementById('makemodalsearchButton3');
    var searchInput = document.getElementById('modalsearchInput3');
    var formTableBody = document.getElementById('formTableBody');
    var rows = formTableBody.getElementsByTagName('tr');

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
});
</script>
<script>
$(document).ready(function() {
    // 모달 요소와 닫기 버튼을 선택합니다.
    var modal = $('#infoModal');
    var span = $('.close');

    // 테이블의 td 요소에 클릭 이벤트를 추가합니다.
    $('.post-listings td').click(function() {
        var cellContent = $(this).text();
        $('#modalContent').text(cellContent);
        modal.show();
    });

    // 닫기 버튼 클릭 시 모달을 닫습니다.
    span.click(function() {
        modal.hide();
    });

    // 모달 외부를 클릭할 때 모달을 닫습니다.
    $(window).click(function(event) {
        if ($(event.target).is(modal)) {
            modal.hide();
        }
    });
});
</script>

<script>
$(document).ready(function() {
    // 모달 요소와 닫기 버튼을 선택합니다.
    var modal = $('#infoModal');
    var span = $('.close');

    // 테이블의 td 요소에 클릭 이벤트를 추가합니다.
    $('.post-listings td').click(function() {
        var cellContent = $(this).text();
        $('#modalContent').text(cellContent);
        modal.show();
    });

    // 닫기 버튼 클릭 시 모달을 닫습니다.
    span.click(function() {
        modal.hide();
    });

    // 모달 외부를 클릭할 때 모달을 닫습니다.
    $(window).click(function(event) {
        if ($(event.target).is(modal)) {
            modal.hide();
        }
    });
});
</script>

<script>
document.addEventListener("DOMContentLoaded", function() {
    var rows = document.querySelectorAll("table.post-listings tbody tr");
    var modal = document.getElementById("infoModal");
    var modalContent = document.getElementById("makeModalContent1");

    rows.forEach(function(row) {
        row.addEventListener("click", function() {
            var pro_id = this.dataset.pro_id;  
            console.log("Clicked pro_id: ", pro_id);
            fetchMakeList(pro_id);
            modal.style.display = "block";
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

    function fetchMakeList(pro_id) {
        fetch('/GetModalProList', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ pro_id: pro_id }),
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            console.log("makeList: ", data);
            displayMakeList(data);
        })
        .catch(error => {
            console.error('Error:', error);
            alert('데이터를 가져오는 중 오류가 발생했습니다.');
        });
    }

    function displayMakeList(makeList) {
    	makeModalContent1.innerHTML = '<h2>제조사 정보</h2>';
        makeList.forEach(function(pro) {
            var makeInfo = document.createElement('div');
            makeInfo.classList.add('make-info');
            makeInfo.innerHTML = `
                <label for="pro_id">제품번호</label>
                <input type="text" id="pro_id" name="pro_id" value="\${pro.pro_id}" readonly> <br>
                <label for="name">제품 이름</label>
                <input type="text" id="name" name="name" value="\${pro.name}" required><br>
                <label for="make_name">제조사</label>
                <input type="text" id="make_name" name="make_name" value="\${pro.make_name}" required><br>
                <label for="ing_name">성분 이름</label>
                <input type="text" id="ing_name" name="ing_name" value="\${pro.ing_name}" required><br>
                <label for="url">제품주소</label>
                <input type="text" id="url" name="url" value="\${pro.url}" required><br>
                <label for="type">제형(가루,알약,액체)</label>
                <input type="text" id="type" name="type" value="\${pro.type}" required><br>
                <label for="explain">약설명서</label>
                <input type="text" id="explain" name="explain" value="\${pro.explain}" required><br>
                <label for="caution">주의사항</label>
                <input type="text" id="caution" name="caution" value="\${pro.caution}" required><br>
                <label for="price">가격</label>
                <input type="text" id="price" name="price" value="\${pro.price}" required><br>
                <label for="count">재고</label>
                <input type="number" id="count" name="count" value="\${pro.count}" required><br>
                <label for="admin_name">등록직원</label>
                <input type="text" id="admin_name" name="admin_name" value="\${pro.admin_name}" required><br>
                <button class="edit-btn" data-make-id="\${pro.pro_id}">수정</button>
            `;
            modalContent.appendChild(makeInfo);

            // 수정 버튼 클릭 이벤트 추가
            makeInfo.querySelector('.edit-btn').addEventListener('click', function() {
                var updatedMake = {
                	pro_id: Number(pro.pro_id),
                    name: makeInfo.querySelector('#name').value,
                    make_name: makeInfo.querySelector('#make_name').value,
                    ing_name: makeInfo.querySelector('#ing_name').value,
                    url: makeInfo.querySelector('#url').value,
                    type: makeInfo.querySelector('#type').value,
                    explain: makeInfo.querySelector('#explain').value,
                    caution: makeInfo.querySelector('#caution').value,
                    price: makeInfo.querySelector('#price').value,
                    count: makeInfo.querySelector('#count').value,
                    admin_name: makeInfo.querySelector('#admin_name').value	
                };
                updateMake(updatedMake);
            });

        });
    }

    function updateMake(pro) {
        fetch('/UpdatePro', {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(pro),
        })
        .then(response => {
            if (!response.ok) {
                return response.json().then(errorData => {
                    throw new Error(errorData.error || '알 수 없는 오류가 발생했습니다.');
                });
            }
            return response.json();
        })
        .then(data => {
            console.log("Updated make: ", data);
            alert('수정이 완료되었습니다.');
            modal.style.display = "none";
            location.reload();
        })
        .catch(error => {
            console.error('Error:', error);
            alert('수정 중 오류가 발생했습니다: ' + error.message);
        });
    }
});
</script>
<script>
$(document).ready(function() {
    // 모달 요소와 닫기 버튼을 선택합니다.
    var modal = $('#infoModal');
    var span = $('.close');

    // 테이블의 td 요소에 클릭 이벤트를 추가합니다.
    $('.post-listings td').click(function() {
        var cellContent = $(this).text();
        $('#modalContent').text(cellContent);
        modal.show();
    });

    // 닫기 버튼 클릭 시 모달을 닫습니다.
    span.click(function() {
        modal.hide();
    });

    // 모달 외부를 클릭할 때 모달을 닫습니다.
    $(window).click(function(event) {
        if ($(event.target).is(modal)) {
            modal.hide();
        }
    });
});
</script>

</body>
</html>