document.addEventListener('DOMContentLoaded', function () {
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
    });