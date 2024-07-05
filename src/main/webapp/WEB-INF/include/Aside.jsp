<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<div id="myModal" class="modal">
    <div class="modal-content">
      <div class="modal-wrap">
        <div class="modal-header">
          <div class="add-cart-message">
            <div class="add-to-cart-checkmark">
              <img src="/img/check.png" alt="green check marked">
            </div>
            <div class="add-to-cart-text">
              장바구니에 담았습니다!
            </div>
            <span id="closeModalBtn" class="close">&times;</span>
          </div>
        </div>
        <div class="modal-body">
          <div class="modal-product-info">
            <div class="add-to-cart-product">
              <div class="product-image">
                <div class="product-image-0">
                  <img src="/img/product01.jpg">
                </div>
              </div>
              <div class="product-detail">
                <div class="product-name">Doctor's Best, 루테맥스 2020 함유 루테인, 20mg, 소프트젤 180정</div>
              </div>
            </div>
            <div class="add-to-cart-total">
              <div class="subtotal-items">
                <div>
                  <strong>
                    <font style="vertical-align: inherit;">
                      <font style="vertical-align: inherit;">소계</font>
                    </font>
                  </strong>
                  <font style="vertical-align: inherit;">
                    <font style="vertical-align: inherit;"> (9개 항목)
                    </font>
                  </font>
                </div>
              </div>
              <div class="subtotal-price">
                <font style="vertical-align: inherit;">
                  <font style="vertical-align: inherit;">
                    $198.57
                  </font>
                </font>
              </div>
            </div>

            <div class="progess-bar-container">
              <div class="gen-progress-bar">
                <div class="progress-bar-background"></div>
                <div class="progress-bar-foreground" style="width: 100%;"></div>
              </div>

              <div class="shipping-message">
                <div class="enough">
                  <div class="add-to-cart-checkmark">
                    <img src="/img/check.png" alt="녹색 체크 표시">
                  </div>
                  <div class="free-shipping">
                    <font style="vertical-align: inherit;">
                      <font style="vertical-align: inherit;">
                        주문하시면 </font>
                    </font><b>
                      <font style="vertical-align: inherit;">
                        <font style="vertical-align: inherit;">무료 배송됩니다!</font>
                      </font>
                    </b>
                  </div>
                </div>
                <div class="short">
                  <div class="add-to-cart-checkmark">
                    <img src="/img/info-circle.svg" alt="무료배송불가">
                  </div>
                  <div class="free-shipping">
                    <font style="vertical-align: inherit;">
                      <font style="vertical-align: inherit;">
                        무료배송을 위해서는 </font>
                    </font>
                    <b>
                      <font style="vertical-align: inherit;">
                        <font style="vertical-align: inherit;">2000원</font>
                      </font>
                    </b>
                    <font style="vertical-align: inherit;">
                      <font style="vertical-align: inherit;">
                        이 부족합니다 </font>
                    </font>
                  </div>
                </div>
              </div>

            </div>
          </div>

          <div class="slide-wrap">
            <h4>함께 많이 주문하는 조합</h4>
            <div class="swiper-container swiper1">
              <div class="swiper-wrapper">
                <div class="swiper-slide">
                  <div class="product-item">
                    <img src="/img/product02.jpg" alt="Product 2">
                    <div class="product-name">NOW Foods, 아연, 50mg, 250정</div>
                    <div class="item-star">
                      <input type="hidden" class="recoAvg" data-reco-rating="4.4"> <span>
                        <div id="recostars" class="recoContainer">
                          <div class="recoStar"></div>
                          <div class="recoStar"></div>
                          <div class="recoStar"></div>
                          <div class="recoStar"></div>
                          <div class="recoStar"></div>
                        </div>
                    </div>
                    <div class="product-price">$15.00</div>
                  </div>
                </div>
                <div class="swiper-slide">
                  <div class="product-item">
                    <img src="/img/product03.jpg" alt="Product 3">
                    <div class="product-name">NOW Foods, 철분, 더블 스트렝스, 36mg, 베지 캡슐 90 정</div>
                    <div class="item-star">
                      <input type="hidden" class="recoAvg" data-reco-rating="4.4"> <span>
                        <div id="recostars" class="recoContainer">
                          <div class="recoStar"></div>
                          <div class="recoStar"></div>
                          <div class="recoStar"></div>
                          <div class="recoStar"></div>
                          <div class="recoStar"></div>
                        </div>
                    </div>
                    <div class="product-price">$20.00</div>
                  </div>
                </div>
                <div class="swiper-slide">
                  <div class="product-item">
                    <img src="/img/product04.jpg" alt="Product 4">
                    <div class="product-name">NOW Foods, 마그네슘 시트레이트, 120 정</div>
                    <div class="item-star">
                      <input type="hidden" class="recoAvg" data-reco-rating="4.4"> <span>
                        <div id="recostars" class="recoContainer">
                          <div class="recoStar"></div>
                          <div class="recoStar"></div>
                          <div class="recoStar"></div>
                          <div class="recoStar"></div>
                          <div class="recoStar"></div>
                        </div>
                    </div>
                    <div class="product-price">$12.00</div>
                  </div>
                </div>
              </div>
              <!-- Add Pagination -->
              <div class="swiper-pagination"></div>
              <!-- Add Navigation -->
              <div class="custom-swiper-button-next"><img src="/img/right-arrow.svg" alt="Next"></div>
              <div class="custom-swiper-button-prev"><img src="/img/left-arrow.svg" alt="Prev"></div>
            </div>
          </div>

          <div class="slide-wrap">
            <h4>다른 고객이 함께 본 상품</h4>
            <div class="swiper-container swiper2">
              <div class="swiper-wrapper">
                <div class="swiper-slide">
                  <div class="product-item">
                    <img src="/img/product07.jpg" alt="Product 7">
                    <div class="product-name">NOW Foods, 아연, 50mg, 250정</div>
                    <div class="item-star">
                      <input type="hidden" class="recoAvg" data-reco-rating="4.4"> <span>
                        <div id="recostars" class="recoContainer">
                          <div class="recoStar"></div>
                          <div class="recoStar"></div>
                          <div class="recoStar"></div>
                          <div class="recoStar"></div>
                          <div class="recoStar"></div>
                        </div>
                    </div>
                    <div class="product-price">$15.00</div>
                  </div>
                </div>
                <div class="swiper-slide">
                  <div class="product-item">
                    <img src="/img/product06.jpg" alt="Product 6">
                    <div class="product-name">NOW Foods, 철분, 더블 스트렝스, 36mg, 베지 캡슐 90 정</div>
                    <div class="item-star">
                      <input type="hidden" class="recoAvg" data-reco-rating="4.4"> <span>
                        <div id="recostars" class="recoContainer">
                          <div class="recoStar"></div>
                          <div class="recoStar"></div>
                          <div class="recoStar"></div>
                          <div class="recoStar"></div>
                          <div class="recoStar"></div>
                        </div>
                    </div>
                    <div class="product-price">$20.00</div>
                  </div>
                </div>
                <div class="swiper-slide">
                  <div class="product-item">
                    <img src="/img/product05.jpg" alt="Product 5">
                    <div class="product-name">NOW Foods, 마그네슘 시트레이트, 120 정</div>
                    <div class="item-star">
                      <input type="hidden" class="recoAvg" data-reco-rating="4.4"> <span>
                        <div id="recostars" class="recoContainer">
                          <div class="recoStar"></div>
                          <div class="recoStar"></div>
                          <div class="recoStar"></div>
                          <div class="recoStar"></div>
                          <div class="recoStar"></div>
                        </div>
                    </div>
                    <div class="product-price">$12.00</div>
                  </div>
                </div>
              </div>
              <!-- Add Pagination -->
              <div class="swiper-pagination"></div>
              <!-- Add Navigation -->
              <div class="custom-swiper-button-next"><img src="/img/right-arrow.svg" alt="Next"></div>
              <div class="custom-swiper-button-prev"><img src="/img/left-arrow.svg" alt="Prev"></div>
            </div>
          </div>

        </div>

      </div>
      <div class="modal-footer">
        <div class="buttons">
          <button id="continueShoppingBtn">계속 쇼핑하기</button>
          <button id="viewCartBtn">장바구니 보기</button>
        </div>
      </div>
    </div>

  </div>    
