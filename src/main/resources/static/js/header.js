document.addEventListener('DOMContentLoaded', function () {
	console.log("헤더js 실행됨");
      var header = document.querySelector('#header');
      var menuItems = document.querySelectorAll('#gnb > ul > li');
      var overlay = document.querySelector('.gnb-overlay-bg');
      var gnbEl = document.querySelector('#gnb');
      var lastScrollTop = 0;
      var fixedThreshold = 50; // 고정될 스크롤 위치

      menuItems.forEach(function (item) {
        item.addEventListener('mouseenter', function () {
          header.classList.add('gnb-open');
          overlay.classList.add('open');
          gnbEl.classList.add('open');
        });

        item.addEventListener('mouseleave', function () {
          header.classList.remove('gnb-open');
          overlay.classList.remove('open');
          gnbEl.classList.remove('open');
        });
      });

      window.addEventListener('scroll', function () {
        var scrollTop = window.pageYOffset || document.documentElement.scrollTop;

        if (scrollTop > lastScrollTop && scrollTop > fixedThreshold) {
          header.classList.add('top-fixed');
          header.style.top = '0';
        } else if (scrollTop < lastScrollTop && scrollTop < fixedThreshold) {
          header.classList.remove('top-fixed');
          header.style.top = 'var(--header-top)';
        } else if (scrollTop <= fixedThreshold) {
          header.style.top = 'var(--header-top)';
        }

        lastScrollTop = scrollTop <= 0 ? 0 : scrollTop;
      });
      
       const token = getCookie('access');
       console.log(token);
       console.log(token);
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
	    
	    
    });
    
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