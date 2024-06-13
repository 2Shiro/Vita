<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>토큰 리다이렉션 jsp입니다.</h2>
<li id="goMypage"><a href="/Mypage/View">마이페이지이동</a>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // 액세스 토큰을 모델에서 가져와 로컬 스토리지에 저장합니다.
    var accessToken = '<%= request.getAttribute("accessToken") %>';
    localStorage.setItem('accessToken', accessToken);

     // fetch 요청을 보내는 함수
    function sendToken() {
        var token = localStorage.getItem('accessToken');
        fetch('/gohome', {
            method: 'GET', // 필요한 HTTP 메서드로 변경
            headers: {
                'Authorization': 'Bearer ' + token
            }
        })
        .then(response => {
            // 응답 상태를 확인합니다.
            if (!response.ok) {
                return response.json().then(err => { throw new Error(err.error); });
            }
            return response.json(); // JSON 응답 처리
        })
        .then(data => {
            console.log('Response:', data);
            window.location.href = '/home';
        })
        .catch(error => {
            console.error('Error:', error);
        });
    }

    // 페이지 로드 시 토큰을 보냅니다.
    sendToken(); 
});
</script>




</body>
</html>