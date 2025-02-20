<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<h2>제조사 리스트</h2>
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
							<th>회사이름</th>
							<th>연락처</th>
							<th>우편번호</th>
							<th>주소</th>
							<th>상세주소</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${makeList}" var="make">
							<tr data-make_id="${make.make_id}">
								<td>${make.make_id}</td>
								<td>${make.name}</td>
								<td>${make.tel}</td>
								<td>${make.zipcode}</td>
								<td>${make.address}</td>
								<td>${make.addressdetail}</td>
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
			<h2>회사정보 추가</h2>
			<form id="MakeForm">
				<input type="hidden" id="make_id" name="make_id" readonly> <label
					for="name">이름</label> <input type="text" id="name" name="name"
					required> <label for="tel">연락처</label> <input type="text"
					id="tel" name="tel" required>
				<div class="form-group">
					<label for="zipcode">우편번호</label> <input type="text" id="zipcode"
						name="zipcode" required readonly> <label for="com_adr">주소</label>
					<div class="input-group">
						<input type="text" class="form-control" id="address"
							name="address" placeholder="회사주소를 입력하세요" required readonly>
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button"
								id="searchAdr">주소 검색</button>
						</div>
					</div>
				</div>
				<label for="addressdetail">상세주소</label> <input type="text"
					id="addressdetail" name="addressdetail" required>
				<button type="submit">등록하기</button>
			</form>
		</div>
	</div>

	<div id="infoModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<div id="makeModalContent"></div>
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
    var name = document.getElementById("name").value;
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
            location.reload();
        } else {
            alert('회사 추가에 실패했습니다. 메시지: ' + data.message);
        }
    })
    .catch((error) => {
        console.error('Error:', error);
        alert('회사가 추가 중 오류가 발생했습니다.');
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
    var modalContent = document.getElementById("makeModalContent");

    rows.forEach(function(row) {
        row.addEventListener("click", function() {
            var make_id = this.dataset.make_id;  
            console.log("Clicked make_id: ", make_id);
            fetchMakeList(make_id);
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

    function fetchMakeList(make_id) {
        fetch('/GetMakeList', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ make_id: make_id }),
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
        modalContent.innerHTML = '<h2>제조사 정보</h2>';
        makeList.forEach(function(make) {
            var makeInfo = document.createElement('div');
            makeInfo.classList.add('make-info');
            makeInfo.innerHTML = `
                <label for="make_id">어드민번호</label>
                <input type="text" id="make_id" name="make_id" value="\${make.make_id}" readonly>
                <label for="name">이름</label>
                <input type="text" id="name" name="name" value="\${make.name}" required>
                <label for="tel">전화번호</label>
                <input type="text" id="tel" name="tel" value="\${make.tel}" required>
                <label for="zipcode">우편번호</label>
                <input type="text" id="zipcode" name="zipcode" value="\${make.zipcode}" required>
                <label for="address">주소</label>
                <input type="text" id="address" name="address" value="\${make.address}" required>
                <label for="addressdetail">상세주소</label>
                <input type="text" id="addressdetail" name="addressdetail" value="\${make.addressdetail}" required>
                <button class="edit-btn" data-make-id="\${make.make_id}">수정</button>
                <button class="delete-btn" data-make-id="\${make.make_id}">삭제</button>
            `;
            modalContent.appendChild(makeInfo);

            // 수정 버튼 클릭 이벤트 추가
            makeInfo.querySelector('.edit-btn').addEventListener('click', function() {
                var updatedMake = {
                	make_id: Number(make.make_id),
                    name: makeInfo.querySelector('#name').value,
                    tel: makeInfo.querySelector('#tel').value,
                    zipcode: makeInfo.querySelector('#zipcode').value,
                    address: makeInfo.querySelector('#address').value,
                    addressdetail: makeInfo.querySelector('#addressdetail').value
                };
                updateMake(updatedMake);
            });

            // 삭제 버튼 클릭 이벤트 추가
            makeInfo.querySelector('.delete-btn').addEventListener('click', function() {
                var confirmDelete = confirm('삭제하시겠습니까?');
                if (confirmDelete) {
                    deleteMake(make.make_id);
                }
            });
        });
    }

    function updateMake(make) {
        fetch('/UpdateMake', {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(make),
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
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
            alert('수정 중 오류가 발생했습니다.');
        });
    }

    function deleteMake(make_id) {
        fetch('/DeleteMake', {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ make_id: make_id }),
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            console.log("Deleted make: ", data);
            alert('삭제가 완료되었습니다.');
            modal.style.display = "none";
            location.reload();
        })
        .catch(error => {
            console.error('Error:', error);
            alert('삭제 중 오류가 발생했습니다.');
        });
    }
});
</script>
</body>
</html>
