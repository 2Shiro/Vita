package com.vita.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.vita.user.domain.GoodsVo;
import com.vita.user.domain.PayVo;

@Mapper
public interface UsersMapper {

    List<GoodsVo> getGoodsList(Long id);

    // 로그인 회원의 구매 상품 조회
    List<PayVo> getPay(Long id);

    // 구매 고유번호 조회
    PayVo getIdentity(int pay_id);

    // 환불신청
    void requestRefund(@Param("payId") int payId, @Param("refundReason") String refundReason) throws Exception;

    // 환불 신청 여부 확인
    boolean isRefundRequested(@Param("payId") int payId);
}