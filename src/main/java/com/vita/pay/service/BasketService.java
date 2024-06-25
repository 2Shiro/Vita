package com.vita.pay.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vita.pay.domain.BasketVo;
import com.vita.pay.domain.ProdVo;
import com.vita.pay.mapper.PayMapper;

@Service
public class BasketService {

    @Autowired
    private PayMapper payMapper;

    // 장바구니 아이템의 수량을 업데이트하는 메서드
    public void updateItemCount(Long basket_id, int count) throws ItemNotFoundException {
        BasketVo basketvo = payMapper.getBasket(basket_id);
        if (basketvo == null) {
            throw new ItemNotFoundException("해당 장바구니 아이템을 찾을 수 없습니다.");
        }

        basketvo.setCount(count);
        payMapper.updateBasketCount(basketvo);
    }

    // 개별 아이템의 가격을 계산하는 메서드
    public int calculateItemPrice(Long basket_id, int count) throws ItemNotFoundException {
        BasketVo basketvo = payMapper.getBasket(basket_id);
        if (basketvo == null) {
            throw new ItemNotFoundException("해당 상품을 찾을 수 없습니다.");
        }
        return basketvo.getPrice() * count;
    }

    // 총 상품 금액을 계산하는 메서드
    public int calculateTotalPrice(Long id) {
        List<BasketVo> basketList = payMapper.getBasketList(id);
        int totalPrice = 0;
        for (BasketVo basketItem : basketList) {
            if (basketItem.getState() == 1) { // 체크된 상태의 상품만 계산
                ProdVo prod = payMapper.getProd(basketItem.getPro_id());
                totalPrice += prod.getPrice() * basketItem.getCount() + basketItem.getDelivery_charge();
            }
        }
        return totalPrice;
    }

    // ItemNotFoundException 예외 클래스 정의
    public static class ItemNotFoundException extends Exception {
        public ItemNotFoundException(String message) {
            super(message);
        }
    }

}
