document.addEventListener("DOMContentLoaded", function() {
	 const token = getCookie('access');
	    console.log(token);
	     if (token) {
	        const memberList = document.getElementById('header-member-list');
	        memberList.innerHTML = `
	            <li><a href="#" id="logout">Logout</a></li>
	        `;

	        document.getElementById('logout').addEventListener('click', function(event) {
	            event.preventDefault();
	            logout(token);
	        });
	    } 
	    
	    /* -------------------------------------------------- */
	

 });
 /* -------------------------------------------------------------- */

 
function logout() {
    console.log("패치 실행됨");
    fetch('/logout', {
        method: 'POST'
    })
    .then(response => {
        if (response.ok) {
            // 쿠키 삭제
          
            location.reload();
        } else {
            alert('Logout failed!');
        }
    })
    .catch(error => console.error('Error:', error));
}
 
 /* ----------------------------------------- */
 
 
 function parseJwt(token) {
    const base64Url = token.split('.')[1];
    const base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
    const jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
        return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
    }).join(''));

    return JSON.parse(jsonPayload);
}
 function getCookie(name) {
	    let cookieArr = document.cookie.split(";");
	    for (let i = 0; i < cookieArr.length; i++) {
	        let cookiePair = cookieArr[i].split("=");
	        if (name === cookiePair[0].trim()) {
	            return decodeURIComponent(cookiePair[1]);
	        }
	    }
	    return null;
	}