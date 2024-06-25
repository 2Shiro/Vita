<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

        <header id="header" class="top-fixed-object top"><!-- .top-fixed가 붙는 object에 top-fixed-object 클래스 추가  -->
      <div class="gnb-overlay-bg"></div>
      <div id="headerInnerWrap">
        <!-- ****************** 헤더상단 ********************** -->
        <div id="headerInner" class="clearfix area-box">
         
          <h1 class="logo">
            <a href="/">
              <img class="ori-ver" src="/img/logo.png" alt="랭콘">
              <img class="color-ver" src="/img/logo.png" alt="랭콘">
            </a>
          </h1>
          <div class="header-util-box">
            <!-- 회원메뉴 -->
            <ul class="header-member-list" id="header-member-list">
              <li><a href="/login">Sign Up</a></li>
              <li><a href="/login">Login</a></li>
            </ul>
          </div>
        </div>
        <!-- ****************** GNB ********************** -->
        <!-- GNB PC  -->
        <nav id="gnb" class="total-menu">
          <div id="gnbBg"></div>
          <ul class="clearfix area">
            <li class="gnb1">
              <a href="#">비타민</a>
              <div class="gnb-2dep">
                <ul>
                  <li><a href="./program/level_system"><span>종합비타민</span></a></li>
                  <li><a href="./program/curriculum"><span>비타민</span></a></li>
                  <li><a href="./program/textbooks"><span>밀크씨슬</span></a></li>
                  <li><a href="./program/homework"><span>프로바이오틱스</span></a></li>
                  <li><a href="/Pds/List?nowpage=1"><span>리스트</span></a></li>
                  <li><a href="/Pds/Write"><span>글쓰기</span></a></li>
                  <li><a href="/Pds/View?post_id=2&nowpage=1"><span>글상세보기</span></a></li>
                </ul>
              </div>
            </li>
            <li class="gnb2">
              <a href="./program/level_system">나에게 맞는 영양제</a>
              <div class="gnb-2dep">
                <ul>
                  <li><a href="./program/level_system"><span>비교하기</span></a></li>
				 <li><a href="/Pay/Basket"><span>장바구니</span></a></li>
				 <li><a href="/Pay/PayForm"><span>결제</span></a></li>
				 <li><a href="/Pay/Success"><span>결제완료</span></a></li>
                </ul>
              </div>
            </li>



            <li class="gnb3">
              <a href="./program/level_system">게시판</a>
              <div class="gnb-2dep">
                <ul>
                  <li><a href="/Pds/List?nowpage=1"><span>자유게시판</span></a></li>
                  <li><a href="#"><span>정보</span></a></li>
                  <li><a href="#" target="_blank"><span>QnA</span></a></li>


                </ul>
              </div>
            </li>
            <li class="gnb4">
              <a href="#">매거진</a>
              <div class="gnb-2dep">
                <ul>
                  <li><a href="./contest/magazine"><span>영양소 정보</span></a></li>
                  <li><a href="./contest/dream_star"><span>영양 상식</span></a></li>
                  <li><a href="./contest/dream_star"><span>health & life</span></a></li>
                </ul>
              </div>
            </li>
            <li class="gnb5">
              <a href="./contest/magazine">Event</a>
              <div class="gnb-2dep">
                <ul>
                  <li><a href="./program/level_system"><span>이벤트</span></a></li>

                </ul>
              </div>
            </li>
          </ul>
        </nav>
      </div>
      <!-- GNB Mobile -->
      <button class="nav-open-btn" title="네비게이션 열기">
        <span class="dot dot1"></span><span class="dot dot2"></span><span class="dot dot3"></span><span
          class="dot dot4"></span>
        <i class="xi-close-min close-icon"></i>
      </button>
      <div class="gnb-overlay-bg-m"></div>
      <nav id="gnbM" class="gnb-style-basic">
        <h2 class="blind">Menu</h2>
        <div class="header-util-menu-box">
          <!-- sns 리스트 -->
          <ul class="header-sns-box">
            <li><a href="https://blog.naver.com/langconenglish" target="_blank"><svg xmlns="http://www.w3.org/2000/svg"
                  viewBox="0 0 145.7 66.53">
                  <defs></defs>
                  <g id="레이어_2" data-name="레이어 2">
                    <g id="Layer_1" data-name="Layer 1">
                      <path class="cls-1" d="M40.45,0V11.94s5.44.9,5.44,7.78V49.55H57.16V20.1C56.24,1,40.45,0,40.45,0Z">
                      </path>
                      <path class="cls-1"
                        d="M97.24,20.9a19.05,19.05,0,0,0-6.17-3.85,20.49,20.49,0,0,0-7.37-1.34,19.89,19.89,0,0,0-7.25,1.34,19.65,19.65,0,0,0-6.18,3.85A18.42,18.42,0,0,0,66,26.75a16.75,16.75,0,0,0,0,13.59,18.42,18.42,0,0,0,4.23,5.85A19.47,19.47,0,0,0,76.45,50a19.89,19.89,0,0,0,7.25,1.34A20.49,20.49,0,0,0,91.07,50a18.89,18.89,0,0,0,6.17-3.85,17.5,17.5,0,0,0,4.14-5.78,17.3,17.3,0,0,0,0-13.73A17.6,17.6,0,0,0,97.24,20.9ZM89.17,39a7.48,7.48,0,0,1-5.48,2.28A7.29,7.29,0,0,1,78.3,39a7.92,7.92,0,0,1,0-11,7.3,7.3,0,0,1,5.39-2.29,7.8,7.8,0,0,1,7.76,7.81A7.52,7.52,0,0,1,89.17,39Z">
                      </path>
                      <path class="cls-1"
                        d="M22.83,15.84c-4.68.16-8.65,1-11.64,3.58h-.14V1H0V49.19H11.05V46.85h.14a16,16,0,0,0,10,3.13c4.87,0,9.34-1.38,12.26-4.67s4.36-6.39,4.36-11.82A19.31,19.31,0,0,0,33.5,21.1C31,18.22,26.83,15.71,22.83,15.84ZM24,39.07a7.46,7.46,0,0,1-5.48,2.28,7.27,7.27,0,0,1-5.38-2.28,7.93,7.93,0,0,1,0-11,7.27,7.27,0,0,1,5.38-2.28A7.46,7.46,0,0,1,24,28a7.83,7.83,0,0,1,0,11.05Z">
                      </path>
                      <path class="cls-1"
                        d="M134.72,16.05v2.64h-.15c-2.67-2.44-5.4-3.49-9.73-3.49-4.84,0-9.07,1.61-12,5.08s-4.46,8.12-4.46,14q0,7.86,4,12.54a14.26,14.26,0,0,0,11.14,4.79c4.88,0,8.57-1.26,11.08-4.74h.15v2.25c0,5.82-6.18,8.78-10.67,8.33V66.2c5.38.77,11.78.47,16.26-3.8,3.78-3.58,5.39-8.74,5.39-17.21V16.05Zm-2.12,23a7.46,7.46,0,0,1-5.48,2.28,7.27,7.27,0,0,1-5.38-2.28,7.93,7.93,0,0,1,0-11,7.27,7.27,0,0,1,5.38-2.28A7.46,7.46,0,0,1,132.6,28a7.83,7.83,0,0,1,0,11.05Z">
                      </path>
                    </g>
                  </g>
                </svg></a></li>
            <li><a href="https://www.youtube.com/channel/UC5ouH4nfBUp_jTj0xPqjyNA" target="_blank"><i
                  class="xi-youtube-play"></i></a></li>
            <li><a href="https://www.instagram.com/avalonenglish/" target="_blank"><i class="xi-instagram"></i></a></li>
          </ul>
          <!-- // -->
          <!-- 회원메뉴 -->
          <ul class="member-menu-box">
            <li><a href="https://welcome.avalon.co.kr/join/step01?callback=//www.langcon.co.kr/LangConSite2/">Sign
                Up</a></li>
            <li><a href="/login">Login</a></li>
          </ul>
        </div>
        <!-- // -->
        <div class="gnb-navigation-wrapper">
          <div class="gnb-navigation-inner">
            <ul id="navigation" data-menu-clone="true">
              <li class="gnb1 has-2dep">
                <a href="./company/philosophy">랭콘 소개</a>
                <div class="gnb-2dep">
                  <ul>
                    <li><a href="./company/philosophy"><span>Philosophy</span></a></li>
                    <li><a href="./company/intro"><span>캐릭터 소개</span></a></li>
                    <li><a href="./company/story"><span>랭콘 이야기</span></a></li>
                  </ul>
                </div>
              </li>
              <li class="gnb2 has-2dep">
                <a href="./program/level_system">프로그램</a>
                <div class="gnb-2dep">
                  <ul>
                    <li><a href="./program/level_system"><span>Level</span></a></li>
                    <li><a href="./program/curriculum"><span>Curriculum</span></a></li>
                    <li><a href="./program/textbooks"><span>Textbook</span></a></li>
                    <li><a href="./program/homework"><span>Homework</span></a></li>
                    <li><a href="./program/assessment"><span>Assessment</span></a></li>
                    <li><a href="./program/motivation"><span>Motivation</span></a></li>
                  </ul>
                </div>
              </li>
              <li class="gnb3 has-2dep">
                <a href="./admission/admission_procedure">입학 안내</a>
                <div class="gnb-2dep">
                  <ul>
                    <li><a href="./admission/admission_procedure"><span>입학 절차</span></a></li>
                    <li><a href="./admission/level_test"><span>레벨테스트 소개</span></a></li>
                    <li><a href="https://welcome.avalon.co.kr/leveltest/bridge" target="_blank"><span>방문 레벨테스트
                          예약</span></a></li>
                  </ul>
                </div>
              </li>
              <li class="gnb4 has-2dep">
                <a href="./contest/magazine">What's New</a>
                <div class="gnb-2dep">
                  <ul>
                    <li><a href="./contest/magazine"><span>매거진</span></a></li>
                    <li><a href="./contest/dream_star"><span>Dream Star</span></a></li>
                  </ul>
                </div>
              </li>
            </ul><!-- PC메뉴 같을때 true / 같지않으면 false 후 메뉴삽입 -->
          </div>
        </div>
      </nav>
    </header>
