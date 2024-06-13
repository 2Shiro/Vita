package com.vita.login.mapper;



import org.apache.ibatis.annotations.Mapper;

import com.vita.oauth.domain.SignUpDTO;
import com.vita.oauth.domain.UserVo;


@Mapper
public interface LoginMapper {


	void saveSignup(SignUpDTO dto);

	UserVo findByUsername(String email);

	Boolean findOAuthEmail(SignUpDTO dto);

	void UpdateSignup(SignUpDTO dto);

	void saveDelivery(SignUpDTO dto);

	Long getMaxUserId();

}
